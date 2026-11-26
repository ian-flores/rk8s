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
#' }
#' @export
Watch <- R6::R6Class(
  "Watch",
  public = list(
    #' @field resource_version Last observed resourceVersion. Used to resume.
    resource_version = NULL,
    #' @field stop_requested Set to TRUE by `$stop()` to break the loop.
    stop_requested = FALSE,
    #' @field end_reason Why the last `stream()` call returned: `"stop"`
    #'   (callback returned `FALSE` or `$stop()` was called), `"timeout"`
    #'   (`timeout_seconds` elapsed), or `"gone"` (410 Gone with
    #'   `return_on_gone = TRUE`).
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
      self$stop_requested <- FALSE
      self$end_reason <- NULL
      rv <- resource_version %||% self$resource_version
      deadline <- if (is.null(timeout_seconds)) Inf
                  else as.numeric(Sys.time()) + as.numeric(timeout_seconds)
      repeat {
        if (self$stop_requested) { self$end_reason <- "stop"; break }
        remaining <- deadline - as.numeric(Sys.time())
        if (remaining <= 0) { self$end_reason <- "timeout"; break }

        q <- c(query_params, list(watch = "true"))
        if (!is.null(rv)) q$resourceVersion <- rv
        if (is.finite(remaining)) {
          q$timeoutSeconds <- max(1L, as.integer(ceiling(remaining)))
        }

        req <- client$call_api(
          resource_path = resource_path,
          method = "GET",
          query_params = q,
          accept = "application/json",
          stream = TRUE
        )
        if (is.finite(remaining)) {
          # Backstop in case the server ignores timeoutSeconds.
          req <- httr2::req_timeout(req, remaining + 5)
        }

        status <- tryCatch(
          private$consume(req, callback, deadline),
          error = function(e) {
            if (as.numeric(Sys.time()) >= deadline) "eof" else stop(e)
          }
        )
        if (identical(status, "stop")) { self$end_reason <- "stop"; break }
        if (identical(status, "timeout")) { self$end_reason <- "timeout"; break }
        if (identical(status, "gone")) {
          if (isTRUE(return_on_gone)) { self$end_reason <- "gone"; break }
          # 410 Gone: resource version too old; restart from "now".
          self$resource_version <- NULL
          rv <- NULL
          next
        }
        rv <- self$resource_version
        # Server closed the stream normally; reconnect while time remains.
      }
      invisible(self)
    },

    #' @description Ask the current `stream()` call to return.
    stop = function() {
      self$stop_requested <- TRUE
      invisible(self)
    }
  ),

  private = list(
    consume = function(req, callback, deadline = Inf) {
      # Reads the watch body with a *non-blocking* connection. A blocking
      # `readBin(conn, n)` on a curl connection waits until `n` bytes arrive
      # or the server hangs up, so events would be delivered in 64 KB batches
      # (or only when the watch times out). Non-blocking reads return what
      # has arrived; between empty reads we sleep briefly, which also lets
      # us honour `$stop()` and the deadline on an idle stream.
      buf <- ""
      stop_reason <- NULL

      handle_chunk <- function(chunk) {
        if (self$stop_requested) {
          stop_reason <<- "stop"
          return(FALSE)
        }
        if (length(chunk) == 0) return(TRUE)
        buf <<- paste0(buf, rawToChar(chunk))
        # `strsplit("a\n", "\n")` returns `c("a")`, dropping the trailing
        # empty — so we can't tell from `length(pieces)` alone whether the
        # last piece is complete. Decide based on whether buf ends with a
        # newline. (Without this, a chunk that delivers exactly one event
        # ending in '\n' would be held indefinitely as "still in progress".)
        ends_with_nl <- endsWith(buf, "\n")
        pieces <- strsplit(buf, "\n", fixed = TRUE)[[1]]
        if (ends_with_nl) {
          to_process <- pieces
          buf <<- ""
        } else {
          to_process <- if (length(pieces) > 1) pieces[-length(pieces)] else character()
          buf <<- if (length(pieces)) pieces[length(pieces)] else ""
        }
        if (length(to_process) > 0) {
          for (line in to_process) {
            if (!nzchar(line)) next
            evt <- tryCatch(jsonlite::fromJSON(line, simplifyVector = FALSE),
                            error = function(e) NULL)
            if (is.null(evt)) next
            obj <- evt$object
            if (!is.null(obj$metadata$resourceVersion)) {
              self$resource_version <- obj$metadata$resourceVersion
            }
            if (identical(evt$type, "ERROR")) {
              if (isTRUE(as.integer(obj$code %||% NA) == 410L) ||
                  identical(obj$reason, "Gone") || identical(obj$reason, "Expired")) {
                stop_reason <<- "gone"
                return(FALSE)
              }
              message(sprintf("watch ERROR: %s", obj$message %||% "unknown"))
              next
            }
            keep <- tryCatch(callback(evt$type, obj), error = function(e) {
              warning("watch callback error: ", conditionMessage(e))
              TRUE
            })
            if (isFALSE(keep)) {
              self$stop_requested <- TRUE
              stop_reason <<- "stop"
              return(FALSE)
            }
          }
        }
        TRUE
      }

      resp <- httr2::req_perform_connection(req, blocking = FALSE)
      on.exit(try(close(resp), silent = TRUE), add = TRUE)
      status_code <- httr2::resp_status(resp)
      if (status_code == 410) return("gone")
      if (status_code >= 400) api_stop(resp)
      wait <- 0.01
      repeat {
        chunk <- httr2::resp_stream_raw(resp, kb = 64)
        if (length(chunk) > 0) {
          wait <- 0.01
          if (!handle_chunk(chunk)) return(stop_reason %||% "stop")
          next
        }
        if (httr2::resp_stream_is_complete(resp)) return(stop_reason %||% "eof")
        if (self$stop_requested) return("stop")
        if (as.numeric(Sys.time()) >= deadline) return("timeout")
        Sys.sleep(wait)
        wait <- min(wait * 2, 0.2)
      }
    }
  )
)
