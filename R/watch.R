#' Watch a Kubernetes list endpoint
#'
#' Streams watch events (ADDED/MODIFIED/DELETED/BOOKMARK/ERROR) from any list
#' endpoint that supports `?watch=true`. Mirrors the Python client's
#' `kubernetes.watch.Watch` and client-go's `watch.Interface`.
#'
#' The server returns line-delimited JSON; each line is a `WatchEvent` with
#' `type` and `object` fields. The `object`'s `resourceVersion` is tracked so
#' the stream can be resumed after a 410 Gone.
#'
#' There are two ways to consume a watch:
#'
#' * `$stream()` blocks and calls a callback for each event.
#' * `$open()`, then `$poll()` repeatedly, then `$close()`. `poll()` returns
#'   the events that have arrived (waiting at most `max_wait` seconds), so a
#'   single R process can drive several watches from one loop. When the
#'   server ends a connection normally, `poll()` reconnects from the last
#'   resourceVersion, so callers see one continuous stream.
#'
#' @examples
#' \dontrun{
#' client <- new_client_from_config()
#' w <- Watch$new()
#' w$stream(
#'   client,
#'   resource_path = "/api/v1/namespaces/default/pods",
#'   callback = function(type, object) {
#'     cat(type, object$metadata$name, "\n")
#'     TRUE  # keep watching
#'   },
#'   timeout_seconds = 30
#' )
#'
#' # Polling
#' w <- Watch$new()
#' w$open(client, "/api/v1/namespaces/default/pods")
#' repeat {
#'   for (e in w$poll(1)) cat(e$type, e$object$metadata$name, "\n")
#' }
#' }
#' @export
Watch <- R6::R6Class(
  "Watch",
  public = list(
    #' @field resource_version Last observed resourceVersion. Used to resume.
    resource_version = NULL,
    #' @field stop_requested Set to TRUE by `$stop()` to break the loop.
    stop_requested = FALSE,
    #' @field end_reason Why the watch ended: `"stop"` (the callback returned
    #'   `FALSE`, or `$stop()` / `$close()` was called), `"timeout"`
    #'   (`timeout_seconds` elapsed), or `"gone"` (410 Gone with
    #'   `return_on_gone = TRUE`). `NULL` while the watch is open.
    end_reason = NULL,

    #' @description Stream events to a callback.
    #' @param client An [ApiClient].
    #' @param resource_path Path template for the list endpoint, with path
    #'   parameters already substituted (e.g. "/api/v1/namespaces/default/pods").
    #' @param query_params Additional query parameters (label selectors etc.).
    #'   `watch=true` is added automatically.
    #' @param callback Function `function(type, object)` invoked for each event.
    #'   Return `FALSE` to stop the stream.
    #' @param timeout_seconds Total wall-clock budget for the whole call. The
    #'   stream reconnects after normal server hang-ups while time remains and
    #'   returns once it is spent, even if no events arrive. `NULL` (default)
    #'   watches until the callback returns `FALSE` or `$stop()` is called.
    #' @param resource_version Starting resourceVersion (defaults to last seen).
    #' @param return_on_gone If `TRUE`, return with `end_reason = "gone"` on
    #'   410 Gone so the caller can re-list (this is what [Informer] does). If
    #'   `FALSE` (default), restart the watch without a resourceVersion, which
    #'   replays the current state as `ADDED` events but cannot report objects
    #'   deleted while the watch was disconnected.
    stream = function(client, resource_path, query_params = list(), callback,
                      timeout_seconds = NULL, resource_version = NULL,
                      return_on_gone = FALSE) {
      self$open(client, resource_path, query_params = query_params,
                resource_version = resource_version,
                timeout_seconds = timeout_seconds,
                return_on_gone = return_on_gone)
      on.exit(if (self$is_open()) private$finish("stop"), add = TRUE)
      while (self$is_open()) {
        for (e in self$poll(0.2)) {
          keep <- tryCatch(callback(e$type, e$object), error = function(err) {
            warning("watch callback error: ", conditionMessage(err))
            TRUE
          })
          if (isFALSE(keep) || self$stop_requested) {
            # Resume from the last event actually delivered, not from the
            # end of the batch.
            if (!is.null(e$resource_version)) {
              self$resource_version <- e$resource_version
            }
            self$stop_requested <- TRUE
            break
          }
        }
        if (self$stop_requested) private$finish("stop")
      }
      invisible(self)
    },

    #' @description Open the watch for polling with `$poll()`.
    #' @param client,resource_path,query_params,resource_version,return_on_gone
    #'   As for `$stream()`.
    #' @param timeout_seconds Optional overall limit; once it passes, `poll()`
    #'   closes the watch with `end_reason = "timeout"`.
    #' @param server_timeout Optional `timeoutSeconds` for each connection.
    #'   The server ends the connection after this long and `poll()`
    #'   reconnects. `NULL` leaves it to the server (usually 30-60 minutes).
    open = function(client, resource_path, query_params = list(),
                    resource_version = NULL, timeout_seconds = NULL,
                    server_timeout = NULL, return_on_gone = FALSE) {
      if (self$is_open()) private$finish("stop")
      self$stop_requested <- FALSE
      self$end_reason <- NULL
      private$client <- client
      private$path <- resource_path
      private$query <- query_params
      private$return_on_gone <- isTRUE(return_on_gone)
      private$server_timeout <- server_timeout
      private$deadline <- if (is.null(timeout_seconds)) Inf
                          else as.numeric(Sys.time()) + as.numeric(timeout_seconds)
      self$resource_version <- resource_version %||% self$resource_version
      private$open_flag <- TRUE
      private$connect()
      invisible(self)
    },

    #' @description Return the events that have arrived, waiting up to
    #'   `max_wait` seconds for the first one.
    #' @param max_wait Seconds to wait when nothing is pending (default 0:
    #'   just collect what is already there).
    #' @return A list of events, each `list(type, object, resource_version)`.
    #'   Empty when nothing arrived or the watch is closed.
    poll = function(max_wait = 0) {
      events <- list()
      if (!self$is_open()) return(events)
      started <- as.numeric(Sys.time())
      repeat {
        if (self$stop_requested) { private$finish("stop"); break }
        now <- as.numeric(Sys.time())
        if (now >= private$deadline) { private$finish("timeout"); break }
        left <- max(0, max_wait - (now - started))
        # Let curl move data for up to 50 ms; the data callback appends
        # whatever arrives to private$incoming.
        curl::multi_run(timeout = min(0.05, left, private$deadline - now),
                        pool = private$pool)
        events <- c(events, private$drain())
        if (!self$is_open()) break            # gone with return_on_gone
        if (!is.null(private$failure)) {
          msg <- private$failure
          if (as.numeric(Sys.time()) >= private$deadline) {
            private$finish("timeout"); break
          }
          private$finish("stop")
          stop("watch connection failed: ", msg, call. = FALSE)
        }
        if (isTRUE(private$done)) {
          code <- private$status()
          if (code == 410) { private$gone(); if (!self$is_open()) break; next }
          if (code >= 400) {
            resp <- httr2::response(
              status_code = code, url = private$url, method = "GET",
              headers = list(`Content-Type` = "application/json"),
              body = private$error_body)
            private$finish("stop")
            api_stop(resp)
          }
          # The server ended this connection normally; carry on from the
          # last resourceVersion.
          private$disconnect()
          if (as.numeric(Sys.time()) >= private$deadline) {
            private$finish("timeout"); break
          }
          private$connect()
          if (!self$is_open()) break
          next
        }
        if (length(events) > 0) break
        if (as.numeric(Sys.time()) - started >= max_wait) break
      }
      events
    },

    #' @description Is the watch open (for polling)?
    is_open = function() isTRUE(private$open_flag),

    #' @description Close a watch opened with `$open()`.
    close = function() {
      if (self$is_open()) private$finish("stop")
      invisible(self)
    },

    #' @description Ask the watch to end: `$stream()` returns after the
    #'   current event, and the next `$poll()` closes the watch.
    stop = function() {
      self$stop_requested <- TRUE
      invisible(self)
    }
  ),

  private = list(
    client = NULL,
    path = NULL,
    query = NULL,
    return_on_gone = FALSE,
    server_timeout = NULL,
    deadline = Inf,
    buf = "",
    open_flag = FALSE,
    # curl multi transfer state for the current connection
    pool = NULL,
    handle = NULL,
    url = NULL,
    incoming = NULL,
    error_body = raw(0),
    done = FALSE,
    failure = NULL,

    # Open one watch connection. The transfer runs on a curl multi pool, so
    # nothing here blocks: the API server may hold the first body bytes of a
    # resumed watch until there is an event (up to a minute for a bookmark),
    # and a curl *connection* would wait for them in open().
    connect = function() {
      remaining <- private$deadline - as.numeric(Sys.time())
      if (remaining <= 0) return(private$finish("timeout"))
      q <- c(private$query, list(watch = "true"))
      if (!is.null(self$resource_version)) {
        q$resourceVersion <- self$resource_version
      }
      per_conn <- c(if (is.finite(remaining)) remaining,
                    if (!is.null(private$server_timeout)) private$server_timeout)
      if (length(per_conn)) {
        q$timeoutSeconds <- max(1L, as.integer(ceiling(min(per_conn))))
      }
      req <- private$client$call_api(
        resource_path = private$path,
        method = "GET",
        query_params = q,
        accept = "application/json",
        stream = TRUE
      )
      h <- curl::new_handle()
      if (length(req$options)) curl::handle_setopt(h, .list = req$options)
      curl::handle_setheaders(h, .list = lapply(
        httr2::req_get_headers(req, redacted = "reveal"), as.character))
      curl::handle_setopt(h, url = req$url)
      if (is.finite(remaining)) {
        # Backstop in case the server ignores timeoutSeconds.
        curl::handle_setopt(h, timeout_ms = as.integer((remaining + 5) * 1000))
      }
      private$pool <- curl::new_pool()
      private$handle <- h
      private$url <- req$url
      private$incoming <- list()
      private$error_body <- raw(0)
      private$done <- FALSE
      private$failure <- NULL
      private$buf <- ""
      curl::multi_add(
        h,
        data = function(x, ...) {
          private$incoming[[length(private$incoming) + 1L]] <- x
        },
        done = function(res) private$done <- TRUE,
        fail = function(msg) private$failure <- msg,
        pool = private$pool
      )
      # Start the transfer (DNS, TLS, request) without waiting for a reply.
      curl::multi_run(timeout = 0, pool = private$pool)
    },

    status = function() {
      if (is.null(private$handle)) return(0L)
      as.integer(curl::handle_data(private$handle)$status_code)
    },

    # Hand data that has arrived to the line parser. Error responses are
    # kept whole for the error message instead.
    drain = function() {
      if (!length(private$incoming)) return(list())
      chunk <- do.call(c, private$incoming)
      private$incoming <- list()
      if (private$status() >= 400) {
        private$error_body <- c(private$error_body, chunk)
        return(list())
      }
      private$parse(chunk)
    },

    disconnect = function() {
      if (!is.null(private$handle)) {
        try(curl::multi_cancel(private$handle), silent = TRUE)
      }
      private$handle <- NULL
      private$pool <- NULL
      private$incoming <- list()
    },

    finish = function(reason) {
      private$disconnect()
      private$open_flag <- FALSE
      self$end_reason <- reason
      invisible()
    },

    # 410 Gone: our resourceVersion is too old.
    gone = function() {
      private$disconnect()
      if (private$return_on_gone) return(private$finish("gone"))
      # Restart from "now"; the server replays current state as ADDED.
      self$resource_version <- NULL
      private$connect()
    },

    # Split a chunk into complete lines and turn them into events.
    parse = function(chunk) {
      buf <- paste0(private$buf, rawToChar(chunk))
      # `strsplit("a\n", "\n")` drops the trailing empty piece, so decide
      # whether the last piece is complete from the trailing newline.
      pieces <- strsplit(buf, "\n", fixed = TRUE)[[1]]
      if (endsWith(buf, "\n")) {
        lines <- pieces
        private$buf <- ""
      } else {
        lines <- if (length(pieces) > 1) pieces[-length(pieces)] else character()
        private$buf <- if (length(pieces)) pieces[length(pieces)] else ""
      }
      out <- list()
      for (line in lines) {
        if (!nzchar(line)) next
        evt <- tryCatch(jsonlite::fromJSON(line, simplifyVector = FALSE),
                        error = function(e) NULL)
        if (is.null(evt)) next
        obj <- evt$object
        if (identical(evt$type, "ERROR")) {
          if (isTRUE(as.integer(obj$code %||% NA) == 410L) ||
              identical(obj$reason, "Gone") || identical(obj$reason, "Expired")) {
            private$gone()
            # After a restart (return_on_gone = FALSE) the rest of this
            # chunk belongs to the old stream; drop it.
            break
          }
          message(sprintf("watch ERROR: %s", obj$message %||% "unknown"))
          next
        }
        rv <- obj$metadata$resourceVersion
        if (!is.null(rv)) self$resource_version <- rv
        out[[length(out) + 1L]] <- list(type = evt$type, object = obj,
                                        resource_version = rv)
      }
      out
    }
  )
)
