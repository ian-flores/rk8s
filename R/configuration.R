#' Kubernetes client configuration
#'
#' A transport + authentication bundle. Populated by [load_kube_config()] or
#' [load_incluster_config()], or constructed directly for tests.
#'
#' Mirrors `kubernetes.client.Configuration` from the Python client and the
#' `rest.Config` struct from client-go.
#'
#' @examples
#' # In-memory config — typical tests or ad-hoc use against a known endpoint.
#' cfg <- Configuration$new(
#'   host = "https://10.0.0.1:6443",
#'   api_key = list(authorization = "Bearer <token>"),
#'   verify_ssl = FALSE
#' )
#' cfg$bearer_token()
#' @export
Configuration <- R6::R6Class(
  "Configuration",
  public = list(
    #' @field host API server URL (e.g. "https://10.0.0.1:6443").
    host = NULL,
    #' @field api_key Named list of API-key-style headers, e.g.
    #'   `list(authorization = "Bearer ...")`.
    api_key = NULL,
    #' @field username HTTP basic auth username.
    username = NULL,
    #' @field password HTTP basic auth password.
    password = NULL,
    #' @field ssl_ca_cert Path to a PEM CA bundle.
    ssl_ca_cert = NULL,
    #' @field cert_file Path to a PEM client cert.
    cert_file = NULL,
    #' @field key_file Path to the PEM client key.
    key_file = NULL,
    #' @field verify_ssl Verify server TLS certs (logical).
    verify_ssl = TRUE,
    #' @field proxy Optional proxy URL.
    proxy = NULL,
    #' @field user_agent User-Agent header.
    user_agent = "rk8s/0.1.0",
    #' @field exec Optional `list(command, args, env, apiVersion)` exec plugin.
    exec = NULL,
    #' @field token_file Optional path to a file holding a bearer token (reread
    #'   on each request to handle rotation — matches in-cluster behaviour).
    token_file = NULL,
    #' @field context_name Name of the kubeconfig context used, for reference.
    context_name = NULL,

    #' @description Construct a Configuration. All arguments are optional.
    #' @param host,api_key,username,password,ssl_ca_cert,cert_file,key_file
    #'   See fields of the same name.
    #' @param verify_ssl,proxy,user_agent,exec,token_file,context_name Likewise.
    initialize = function(host = NULL, api_key = NULL, username = NULL,
                          password = NULL, ssl_ca_cert = NULL, cert_file = NULL,
                          key_file = NULL, verify_ssl = TRUE, proxy = NULL,
                          user_agent = "rk8s/0.1.0", exec = NULL,
                          token_file = NULL, context_name = NULL) {
      self$host <- host
      self$api_key <- api_key %||% list()
      self$username <- username
      self$password <- password
      self$ssl_ca_cert <- ssl_ca_cert
      self$cert_file <- cert_file
      self$key_file <- key_file
      self$verify_ssl <- isTRUE(verify_ssl)
      self$proxy <- proxy
      self$user_agent <- user_agent
      self$exec <- exec
      self$token_file <- token_file
      self$context_name <- context_name
    },

    #' @description Return the current bearer token, refreshing via the exec
    #'   plugin or token file if configured.
    bearer_token = function() {
      if (!is.null(self$token_file) && file.exists(self$token_file)) {
        tok <- trimws(readLines(self$token_file, warn = FALSE))
        if (length(tok) > 0 && nzchar(tok[1])) return(tok[1])
      }
      if (!is.null(self$exec)) {
        return(exec_plugin_token(self$exec))
      }
      auth <- self$api_key[["authorization"]] %||% self$api_key[["Authorization"]]
      if (is.null(auth)) return(NULL)
      sub("^[Bb]earer\\s+", "", auth)
    }
  )
)

`%||%` <- function(x, y) if (is.null(x)) y else x
