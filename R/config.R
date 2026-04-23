#' Load configuration from a kubeconfig file
#'
#' Mirrors `kubernetes.config.load_kube_config()` from the Python client.
#' Reads the kubeconfig YAML, selects a context, and returns a populated
#' [Configuration].
#'
#' @param config_file Path to a kubeconfig. Defaults to `$KUBECONFIG` (the
#'   first entry if colon-separated) or `~/.kube/config`.
#' @param context Context name. Defaults to the kubeconfig's `current-context`.
#' @param persist_config Unused (kept for API parity); the Python client
#'   writes refreshed tokens back here. Not implemented.
#'
#' @return A [Configuration].
#' @examples
#' \dontrun{
#' cfg <- load_kube_config()                        # ~/.kube/config
#' cfg <- load_kube_config(context = "my-dev")      # pick a context
#' cfg <- load_kube_config("~/configs/prod.yaml")   # alternate file
#' client <- ApiClient$new(cfg)
#' }
#' @export
load_kube_config <- function(config_file = NULL, context = NULL,
                             persist_config = FALSE) {
  cfg_path <- resolve_kubeconfig_path(config_file)
  kc <- yaml::read_yaml(cfg_path)
  load_kube_config_from_dict(kc, context = context, base_dir = dirname(cfg_path))
}

#' List contexts in a kubeconfig
#'
#' @inheritParams load_kube_config
#' @return A list with elements `contexts` (list of context entries) and
#'   `current_context` (name of the current context, or `NULL`).
#' @export
list_kube_config_contexts <- function(config_file = NULL) {
  cfg_path <- resolve_kubeconfig_path(config_file)
  kc <- yaml::read_yaml(cfg_path)
  list(
    contexts = kc$contexts %||% list(),
    current_context = kc$`current-context`
  )
}

#' Shorthand for loading config + constructing an [ApiClient].
#'
#' @inheritParams load_kube_config
#' @return An [ApiClient].
#' @examples
#' \dontrun{
#' client <- new_client_from_config()
#' CoreV1Api$new(client)$list_namespace()
#' }
#' @export
new_client_from_config <- function(config_file = NULL, context = NULL) {
  ApiClient$new(configuration = load_kube_config(config_file, context))
}

#' Load configuration from the in-cluster service account
#'
#' Uses the CA bundle and token mounted at
#' `/var/run/secrets/kubernetes.io/serviceaccount/` and the
#' `KUBERNETES_SERVICE_HOST`/`KUBERNETES_SERVICE_PORT` env vars, matching the
#' semantics of `kubernetes.config.load_incluster_config()` and client-go's
#' `rest.InClusterConfig()`.
#'
#' @return A [Configuration].
#' @examples
#' \dontrun{
#' client <- ApiClient$new(load_incluster_config())
#' }
#' @export
load_incluster_config <- function() {
  host <- Sys.getenv("KUBERNETES_SERVICE_HOST", unset = "")
  port <- Sys.getenv("KUBERNETES_SERVICE_PORT", unset = "")
  if (!nzchar(host) || !nzchar(port)) {
    stop("Not running in-cluster: KUBERNETES_SERVICE_HOST / _SERVICE_PORT not set")
  }
  sa_dir <- "/var/run/secrets/kubernetes.io/serviceaccount"
  token_file <- file.path(sa_dir, "token")
  ca_file <- file.path(sa_dir, "ca.crt")
  if (!file.exists(token_file) || !file.exists(ca_file)) {
    stop("In-cluster service account token or CA missing at ", sa_dir)
  }
  Configuration$new(
    host = sprintf("https://%s", if (grepl(":", host, fixed = TRUE))
                     sprintf("[%s]:%s", host, port) else sprintf("%s:%s", host, port)),
    token_file = token_file,
    ssl_ca_cert = ca_file,
    verify_ssl = TRUE,
    context_name = "in-cluster"
  )
}

# ---- internal ----------------------------------------------------------------

resolve_kubeconfig_path <- function(config_file) {
  if (!is.null(config_file)) return(normalizePath(config_file, mustWork = TRUE))
  env <- Sys.getenv("KUBECONFIG", unset = "")
  if (nzchar(env)) {
    first <- strsplit(env, .Platform$path.sep, fixed = TRUE)[[1]][1]
    return(normalizePath(first, mustWork = TRUE))
  }
  normalizePath("~/.kube/config", mustWork = TRUE)
}

load_kube_config_from_dict <- function(kc, context = NULL, base_dir = getwd()) {
  if (is.null(kc$contexts) || length(kc$contexts) == 0) {
    stop("kubeconfig has no contexts")
  }
  ctx_name <- context %||% kc$`current-context`
  if (is.null(ctx_name) || !nzchar(ctx_name)) {
    stop("No context specified and kubeconfig has no current-context")
  }
  ctx <- find_named(kc$contexts, ctx_name, "context")
  if (is.null(ctx)) stop(sprintf("Context '%s' not found in kubeconfig", ctx_name))

  cluster <- find_named(kc$clusters, ctx$context$cluster, "cluster")
  if (is.null(cluster)) {
    stop(sprintf("Cluster '%s' not found in kubeconfig", ctx$context$cluster))
  }
  user <- if (!is.null(ctx$context$user))
    find_named(kc$users, ctx$context$user, "user") else NULL

  cl <- cluster$cluster
  usr <- if (!is.null(user)) user$user else list()

  cfg <- Configuration$new(
    host = cl$server,
    verify_ssl = !isTRUE(cl$`insecure-skip-tls-verify`),
    context_name = ctx_name
  )

  # NOTE: use `[[` for exact key matching; `$` does partial matching on lists
  # and would match "certificate-authority" against "certificate-authority-data".
  cfg$ssl_ca_cert <- materialize_pem(cl[["certificate-authority"]],
                                      cl[["certificate-authority-data"]],
                                      base_dir, suffix = "ca.crt")
  cfg$cert_file <- materialize_pem(usr[["client-certificate"]],
                                    usr[["client-certificate-data"]],
                                    base_dir, suffix = "client.crt")
  cfg$key_file <- materialize_pem(usr[["client-key"]],
                                   usr[["client-key-data"]],
                                   base_dir, suffix = "client.key")

  if (!is.null(usr$token) && nzchar(usr$token)) {
    cfg$api_key <- list(authorization = paste("Bearer", usr$token))
  } else if (!is.null(usr$tokenFile)) {
    cfg$token_file <- path_rel(usr$tokenFile, base_dir)
  }
  if (!is.null(usr$username)) {
    cfg$username <- usr$username
    cfg$password <- usr$password
  }
  if (!is.null(usr$exec)) {
    cfg$exec <- usr$exec
  }
  cfg
}

find_named <- function(items, name, key) {
  for (it in items) if (identical(it$name, name)) return(it)
  NULL
}

# Resolve either an inline base64 blob or a file path (absolute, or relative to
# the kubeconfig's directory) into an on-disk PEM file. Returns NULL if neither.
materialize_pem <- function(path, data, base_dir, suffix) {
  if (!is.null(path) && nzchar(path)) {
    return(path_rel(path, base_dir))
  }
  if (!is.null(data) && nzchar(data)) {
    tmp <- tempfile("rk8s-", fileext = paste0("-", suffix))
    writeBin(base64enc::base64decode(data), tmp)
    return(tmp)
  }
  NULL
}

path_rel <- function(p, base_dir) {
  if (is.null(p)) return(NULL)
  if (startsWith(p, "/") || grepl("^[A-Za-z]:", p)) p else file.path(base_dir, p)
}
