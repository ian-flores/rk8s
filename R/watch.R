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

    #' @description Stream events to a callback.
    #' @param client An [ApiClient].
    #' @param resource_path Path template for the list endpoint, with path
    #'   parameters already substituted (e.g. "/api/v1/namespaces/default/pods").
    #' @param query_params Additional query parameters (label selectors etc.).
    #'   `watch=true` is added automatically.
    #' @param callback Function `function(type, object)` invoked for each event.
    #'   Return `FALSE` to stop the stream.
    #' @param timeout_seconds Passed as a query param; also used to bound
    #'   individual HTTP calls.
    #' @param resource_version Starting resourceVersion (defaults to last seen).
    stream = function(client, resource_path, query_params = list(), callback,
                      timeout_seconds = NULL, resource_version = NULL) {
      self$stop_requested <- FALSE
      rv <- resource_version %||% self$resource_version
      repeat {
        if (self$stop_requested) break
        q <- c(query_params, list(watch = "true"))
        if (!is.null(rv)) q$resourceVersion <- rv
        if (!is.null(timeout_seconds)) q$timeoutSeconds <- as.integer(timeout_seconds)

        req <- client$call_api(
          resource_path = resource_path,
          method = "GET",
          query_params = q,
          accept = "application/json",
          stream = TRUE
        )

        status <- private$consume(req, callback)
        if (identical(status, "stop")) break
        if (identical(status, "gone")) {
          # 410 Gone: resource version too old, must relist.
          self$resource_version <- NULL
          rv <- NULL
          next
        }
        rv <- self$resource_version
        # Server closed the stream normally; loop and reconnect.
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
    consume = function(req, callback) {
      # Decide between httr2's pull-based (`req_perform_connection`, 1.1+)
      # and callback-based (`req_perform_stream`, 1.0+) APIs at runtime so
      # we work on whichever ships with the user's `httr2`. The local-buffer
      # parsing logic is the same either way.
      buf <- ""
      status_code <- NA_integer_
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
              message(sprintf("watch ERROR: %s",
                              obj$message %||% "unknown"))
              if (identical(obj$code, 410L) || identical(obj$reason, "Gone")) {
                stop_reason <<- "gone"
                return(FALSE)
              }
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

      if (exists("req_perform_connection", envir = asNamespace("httr2"),
                  inherits = FALSE)) {
        # httr2 >= 1.1: pull-based
        resp <- httr2::req_perform_connection(req)
        on.exit(try(close(resp), silent = TRUE), add = TRUE)
        status_code <- httr2::resp_status(resp)
        if (status_code == 410) return("gone")
        if (status_code >= 400) api_stop(resp)
        repeat {
          chunk <- httr2::resp_stream_raw(resp, kb = 64)
          if (length(chunk) == 0) {
            if (!is.null(stop_reason)) return(stop_reason)
            return("eof")
          }
          ok <- handle_chunk(chunk)
          if (!ok) return(stop_reason %||% "stop")
        }
      } else {
        # httr2 1.0: callback-based
        on_chunk <- function(chunk) {
          if (is.na(status_code)) {
            # First call also provides metadata via attributes? No — status is
            # only readable post-perform. We rely on req_error() returning
            # FALSE so a 410 will arrive as a normal stream and parse-error;
            # for that, surface 4xx as an early end-of-stream below.
          }
          handle_chunk(chunk)
        }
        resp <- httr2::req_perform_stream(req, on_chunk, buffer_kb = 64)
        if (httr2::resp_status(resp) == 410) return("gone")
        if (httr2::resp_status(resp) >= 400) api_stop(resp)
        return(stop_reason %||% "eof")
      }
    }
  )
)
