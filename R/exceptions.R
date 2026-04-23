#' Kubernetes API exception
#'
#' Condition raised for non-2xx responses from the Kubernetes API. Carries the
#' HTTP status code, reason phrase, response headers, and parsed body (a
#' `metav1.Status` object when the server returned one).
#'
#' Typed API methods raise `rk8s_api_error` conditions whose `$exception` field
#' is an `ApiException`. Catch with `tryCatch()`.
#'
#' @examples
#' \dontrun{
#' tryCatch(
#'   CoreV1Api$new(new_client_from_config())$read_namespaced_pod(
#'     name = "does-not-exist", namespace = "default"),
#'   rk8s_api_error = function(e) {
#'     message("API error: ", e$exception$status, " ", e$exception$reason)
#'   }
#' )
#' }
#' @export
ApiException <- R6::R6Class(
  "ApiException",
  public = list(
    #' @field status Integer HTTP status code.
    status = NULL,
    #' @field reason HTTP reason phrase.
    reason = NULL,
    #' @field headers Named list of response headers.
    headers = NULL,
    #' @field body Raw response body (character).
    body = NULL,
    #' @field status_obj Parsed `metav1.Status`, or `NULL` if body wasn't JSON.
    status_obj = NULL,

    #' @description Construct an ApiException.
    #' @param status HTTP status code.
    #' @param reason HTTP reason phrase.
    #' @param headers Named list of headers.
    #' @param body Response body (character or raw).
    initialize = function(status = NA_integer_, reason = NA_character_,
                          headers = list(), body = "") {
      self$status <- as.integer(status)
      self$reason <- reason
      self$headers <- headers
      self$body <- if (is.raw(body)) rawToChar(body) else body
      self$status_obj <- tryCatch(
        jsonlite::fromJSON(self$body, simplifyVector = FALSE),
        error = function(e) NULL
      )
    },

    #' @description Render a human-readable message.
    format = function() {
      msg <- sprintf("Kubernetes API error (%s %s)", self$status, self$reason)
      if (!is.null(self$status_obj) && !is.null(self$status_obj$message)) {
        msg <- paste0(msg, ": ", self$status_obj$message)
      }
      msg
    }
  )
)

api_stop <- function(resp) {
  body <- tryCatch(httr2::resp_body_string(resp), error = function(e) "")
  err <- ApiException$new(
    status = httr2::resp_status(resp),
    reason = httr2::resp_status_desc(resp),
    headers = httr2::resp_headers(resp),
    body = body
  )
  cond <- structure(
    class = c("rk8s_api_error", "error", "condition"),
    list(message = err$format(), call = sys.call(-1), exception = err)
  )
  stop(cond)
}
