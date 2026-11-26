#' Kubernetes client configuration
#'
#' A transport + authentication bundle. Populated by [load_kube_config()] or
#' [load_incluster_config()], or constructed directly for tests.
#'
#' Mirrors `kubernetes.client.Configuration` from the Python client and the
#' `rest.Config` struct from client-go.
#'
#' @examples
#' # In-memory config - typical tests or ad-hoc use against a known endpoint.
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
    user_agent = "rk8s/0.2.0",
    #' @field exec Optional `list(command, args, env, apiVersion)` exec plugin.
    exec = NULL,
    #' @field token_file Optional path to a file holding a bearer token (reread
    #'   on each request to handle rotation - matches in-cluster behaviour).
    token_file = NULL,
    #' @field context_name Name of the kubeconfig context used, for reference.
    context_name = NULL,
    #' @field timeout Optional per-request timeout in seconds for ordinary
    #'   (non-streaming) calls. Watches and log streams are not affected.
    timeout = NULL,
    #' @field max_retries How many times ordinary requests are retried on
    #'   HTTP 429 (any method, honouring `Retry-After`) and, for GET/HEAD, on
    #'   500/502/503/504 or connection failures, with jittered exponential
    #'   backoff. `0` disables retries.
    max_retries = 3L,
    #' @field namespace Default namespace from the kubeconfig context (or the
    #'   in-cluster service account), or `NULL`.
    namespace = NULL,
    #' @field tls_server_name Server name to use for TLS SNI and certificate
    #'   verification instead of the host in `host` (kubeconfig
    #'   `tls-server-name`).
    tls_server_name = NULL,
    #' @field auth_provider OIDC `auth-provider` settings from the kubeconfig
    #'   (`list(name = "oidc", config = ...)`), or `NULL`.
    auth_provider = NULL,
    #' @field exec_cluster Cluster details handed to an exec plugin that sets
    #'   `provideClusterInfo: true` (filled in by [load_kube_config()]).
    exec_cluster = NULL,

    #' @description Construct a Configuration. All arguments are optional.
    #' @param host,api_key,username,password,ssl_ca_cert,cert_file,key_file
    #'   See fields of the same name.
    #' @param verify_ssl,proxy,user_agent,exec,token_file,context_name,timeout
    #'   Likewise.
    initialize = function(host = NULL, api_key = NULL, username = NULL,
                          password = NULL, ssl_ca_cert = NULL, cert_file = NULL,
                          key_file = NULL, verify_ssl = TRUE, proxy = NULL,
                          user_agent = "rk8s/0.2.0", exec = NULL,
                          token_file = NULL, context_name = NULL,
                          timeout = NULL) {
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
      self$timeout <- timeout
    },

    #' @description Return the current bearer token, refreshing via the exec
    #'   plugin or token file if configured.
    bearer_token = function() {
      if (!is.null(self$token_file) && file.exists(self$token_file)) {
        tok <- trimws(readLines(self$token_file, warn = FALSE))
        if (length(tok) > 0 && nzchar(tok[1])) return(tok[1])
      }
      if (!is.null(self$exec)) {
        tok <- exec_plugin_credentials(self$exec, self$exec_cluster)$token
        if (!is.null(tok)) return(tok)
      }
      if (!is.null(self$auth_provider)) {
        return(oidc_id_token(self))
      }
      auth <- self$api_key[["authorization"]] %||% self$api_key[["Authorization"]]
      if (is.null(auth)) return(NULL)
      sub("^[Bb]earer\\s+", "", auth)
    },

    #' @description Client certificate and key files to present, if any.
    #'   An exec plugin that returns a certificate takes precedence over
    #'   `cert_file`/`key_file`.
    #' @return `list(cert_file, key_file)`; elements may be `NULL`.
    client_cert = function() {
      if (!is.null(self$exec)) {
        creds <- exec_plugin_credentials(self$exec, self$exec_cluster)
        if (!is.null(creds$cert_file) && !is.null(creds$key_file)) {
          return(list(cert_file = creds$cert_file, key_file = creds$key_file))
        }
      }
      list(cert_file = self$cert_file, key_file = self$key_file)
    },

    #' @description Drop cached exec-plugin credentials so the next request
    #'   runs the plugin again (called automatically on HTTP 401).
    refresh_credentials = function() {
      if (!is.null(self$exec)) exec_cache_clear(self$exec, self$exec_cluster)
      invisible(self)
    }
  )
)

`%||%` <- function(x, y) if (is.null(x)) y else x

# Plain-data snapshot of a Configuration, for recreating it in a child R
# process (callr). Carries every auth mechanism -- client certs, token files
# and exec plugins are re-evaluated in the child rather than frozen as a
# bearer token string that may expire.
config_to_list <- function(cfg) {
  list(
    host = cfg$host, api_key = cfg$api_key, username = cfg$username,
    password = cfg$password, ssl_ca_cert = cfg$ssl_ca_cert,
    cert_file = cfg$cert_file, key_file = cfg$key_file,
    verify_ssl = cfg$verify_ssl, proxy = cfg$proxy,
    user_agent = cfg$user_agent, exec = cfg$exec,
    token_file = cfg$token_file, context_name = cfg$context_name,
    timeout = cfg$timeout, exec_cluster = cfg$exec_cluster,
    namespace = cfg$namespace, tls_server_name = cfg$tls_server_name,
    auth_provider = cfg$auth_provider, max_retries = cfg$max_retries
  )
}

config_from_list <- function(x) {
  extra <- c("exec_cluster", "namespace", "tls_server_name", "auth_provider",
             "max_retries")
  cfg <- do.call(Configuration$new, x[setdiff(names(x), extra)])
  for (f in extra) if (!is.null(x[[f]])) cfg[[f]] <- x[[f]]
  cfg
}
