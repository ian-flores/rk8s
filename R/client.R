#' Kubernetes API client
#'
#' Low-level transport used by every generated API class. Wraps [httr2::request()]
#' with authentication, TLS, serialization, and error translation. You rarely
#' call `call_api()` directly; instead, you pass an `ApiClient` into a typed
#' API class like [CoreV1Api] or [AppsV1Api], or a [DynamicClient].
#'
#' Mirrors `kubernetes.client.ApiClient` from the Python client and
#' `rest.RESTClient` from client-go.
#'
#' @examples
#' \dontrun{
#' client <- new_client_from_config()
#' core   <- CoreV1Api$new(client)
#' core$list_pod_for_all_namespaces()
#' }
#' @export
ApiClient <- R6::R6Class(
  "ApiClient",
  public = list(
    #' @field configuration The attached [Configuration].
    configuration = NULL,
    #' @field default_headers Named list of headers added to every request.
    default_headers = NULL,

    #' @description Construct an ApiClient.
    #' @param configuration A [Configuration] (defaults to an empty one).
    #' @param default_headers Additional headers, as a named list.
    initialize = function(configuration = Configuration$new(),
                          default_headers = list()) {
      self$configuration <- configuration
      self$default_headers <- default_headers
    },

    #' @description Perform an HTTP call against the API server.
    #' @param resource_path Path portion of the URL (e.g. "/api/v1/namespaces/{namespace}/pods").
    #' @param method HTTP method (GET, POST, PUT, PATCH, DELETE).
    #' @param path_params Named list of path params substituted into
    #'   `resource_path`.
    #' @param query_params Named list of query parameters.
    #' @param header_params Named list of headers (merged with defaults).
    #' @param body An R object (serialized as JSON) or a raw/character body.
    #' @param response_type Either `NULL` (return parsed JSON as a nested list),
    #'   `"raw"` (return raw bytes), `"text"` (return string), or the name of a
    #'   generated model class (return an instance, constructed via `$from_list`).
    #' @param content_type Content-Type to send (default application/json; use
    #'   `application/merge-patch+json`, `application/strategic-merge-patch+json`,
    #'   or `application/json-patch+json` for PATCH variants).
    #' @param accept Accept header (default application/json).
    #' @param stream If TRUE, return the raw [httr2::response] without reading
    #'   the body — used by [Watch] and log-streaming.
    call_api = function(resource_path, method = "GET",
                        path_params = list(), query_params = list(),
                        header_params = list(), body = NULL,
                        response_type = NULL,
                        content_type = "application/json",
                        accept = "application/json",
                        stream = FALSE) {
      req <- private$build_request(
        resource_path, method, path_params, query_params,
        header_params, body, content_type, accept
      )
      if (isTRUE(stream)) {
        return(req)
      }
      resp <- httr2::req_perform(req)
      if (httr2::resp_status(resp) >= 400) api_stop(resp)
      private$deserialize(resp, response_type)
    },

    #' @description Substitute `{name}` placeholders in a path template.
    #' @param path_template E.g. "/api/v1/namespaces/{namespace}/pods/{name}".
    #' @param path_params Named list of replacements.
    select_path = function(path_template, path_params = list()) {
      for (nm in names(path_params)) {
        path_template <- gsub(
          paste0("\\{", nm, "\\}"),
          utils::URLencode(as.character(path_params[[nm]]), reserved = TRUE),
          path_template, fixed = FALSE
        )
      }
      path_template
    }
  ),

  private = list(
    build_request = function(resource_path, method, path_params, query_params,
                             header_params, body, content_type, accept) {
      cfg <- self$configuration
      if (is.null(cfg$host)) stop("Configuration$host is not set")

      url <- paste0(sub("/$", "", cfg$host), self$select_path(resource_path, path_params))
      req <- httr2::request(url)
      req <- httr2::req_method(req, toupper(method))
      req <- httr2::req_user_agent(req, cfg$user_agent)

      # Query parameters: drop NULL, repeat named vector entries for arrays.
      q <- drop_nulls(query_params)
      if (length(q) > 0) {
        req <- do.call(httr2::req_url_query, c(list(req), q, list(.multi = "explode")))
      }

      # Auth: bearer token, then basic auth, then client cert via options.
      headers <- c(self$default_headers, header_params)
      tok <- cfg$bearer_token()
      if (!is.null(tok) && nzchar(tok)) {
        headers[["Authorization"]] <- paste("Bearer", tok)
      } else if (!is.null(cfg$username)) {
        req <- httr2::req_auth_basic(req, cfg$username, cfg$password %||% "")
      }
      if (!is.null(accept)) headers[["Accept"]] <- accept

      # TLS configuration.
      opts <- list()
      if (!isTRUE(cfg$verify_ssl)) {
        opts$ssl_verifypeer <- 0L
        opts$ssl_verifyhost <- 0L
      }
      if (!is.null(cfg$ssl_ca_cert)) opts$cainfo <- cfg$ssl_ca_cert
      if (!is.null(cfg$cert_file))   opts$sslcert <- cfg$cert_file
      if (!is.null(cfg$key_file))    opts$sslkey  <- cfg$key_file
      if (!is.null(cfg$proxy))       opts$proxy   <- cfg$proxy
      if (length(opts) > 0) req <- do.call(httr2::req_options, c(list(req), opts))

      # Body serialization.
      if (!is.null(body)) {
        if (is.character(body) || is.raw(body)) {
          req <- httr2::req_body_raw(req, body, type = content_type)
        } else {
          json <- jsonlite::toJSON(body, auto_unbox = TRUE, null = "null",
                                    na = "null", digits = NA)
          req <- httr2::req_body_raw(req, as.character(json), type = content_type)
        }
      }

      if (length(headers) > 0) {
        req <- do.call(httr2::req_headers, c(list(req), headers))
      }
      req <- httr2::req_error(req, is_error = function(resp) FALSE)
      req
    },

    deserialize = function(resp, response_type) {
      if (identical(response_type, "raw")) return(httr2::resp_body_raw(resp))
      if (identical(response_type, "text")) return(httr2::resp_body_string(resp))
      body <- tryCatch(httr2::resp_body_string(resp), error = function(e) "")
      if (!nzchar(body)) return(NULL)
      parsed <- jsonlite::fromJSON(body, simplifyVector = FALSE)
      if (is.null(response_type)) return(parsed)

      # response_type is the name of a generated R6 model class exported by the
      # package; construct from list via its from_list() static helper.
      cls <- tryCatch(get(response_type, envir = asNamespace("rk8s")),
                       error = function(e) NULL)
      if (is.null(cls) || !inherits(cls, "R6ClassGenerator")) return(parsed)
      cls$from_list(parsed)
    }
  )
)

drop_nulls <- function(x) x[!vapply(x, is.null, logical(1))]
