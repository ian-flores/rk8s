#' Load configuration from a kubeconfig file
#'
#' Mirrors `kubernetes.config.load_kube_config()` from the Python client.
#' Reads the kubeconfig YAML, selects a context, and returns a populated
#' [Configuration].
#'
#' Like `kubectl`, a `$KUBECONFIG` holding several paths (separated by `:`,
#' or `;` on Windows) is merged: for clusters, users and contexts the first
#' file that defines a name wins, `current-context` comes from the first file
#' that sets it, and relative paths resolve against the file they appear in.
#' Missing files in the list are ignored.
#'
#' Supported authentication: bearer `token` / `tokenFile`, client
#' certificates (file or inline data), basic auth, `exec` credential plugins
#' (including `provideClusterInfo`), and the `oidc` `auth-provider`
#' (the id-token is refreshed with the refresh-token when it expires). The
#' cluster's `proxy-url`, `tls-server-name` and `insecure-skip-tls-verify`
#' and the context's `namespace` are honoured.
#'
#' @param config_file Path to a kubeconfig. Defaults to `$KUBECONFIG` (merged
#'   as described above) or `~/.kube/config`.
#' @param context Context name. Defaults to the kubeconfig's `current-context`.
#' @param persist_config If `TRUE`, write refreshed OIDC tokens back to the
#'   kubeconfig file that defined the user (like the Python client). The
#'   default `FALSE` never modifies kubeconfig files.
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
  kc <- read_kubeconfig(resolve_kubeconfig_paths(config_file))
  load_kube_config_from_dict(kc, context = context,
                             persist_config = persist_config)
}

#' List contexts in a kubeconfig
#'
#' @inheritParams load_kube_config
#' @return A list with elements `contexts` (list of context entries) and
#'   `current_context` (name of the current context, or `NULL`).
#' @export
list_kube_config_contexts <- function(config_file = NULL) {
  kc <- read_kubeconfig(resolve_kubeconfig_paths(config_file))
  list(
    contexts = lapply(kc$contexts %||% list(), strip_origin),
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
  cfg <- Configuration$new(
    host = sprintf("https://%s", if (grepl(":", host, fixed = TRUE))
                     sprintf("[%s]:%s", host, port) else sprintf("%s:%s", host, port)),
    token_file = token_file,
    ssl_ca_cert = ca_file,
    verify_ssl = TRUE,
    context_name = "in-cluster"
  )
  ns_file <- file.path(sa_dir, "namespace")
  if (file.exists(ns_file)) {
    cfg$namespace <- trimws(readLines(ns_file, n = 1, warn = FALSE))
  }
  cfg
}

# ---- internal ----------------------------------------------------------------

resolve_kubeconfig_paths <- function(config_file) {
  if (!is.null(config_file)) return(normalizePath(config_file, mustWork = TRUE))
  env <- Sys.getenv("KUBECONFIG", unset = "")
  if (nzchar(env)) {
    paths <- strsplit(env, .Platform$path.sep, fixed = TRUE)[[1]]
    paths <- path.expand(paths[nzchar(paths)])
    paths <- unique(paths[file.exists(paths)])
    if (!length(paths)) {
      stop("None of the files in KUBECONFIG exist: ", env, call. = FALSE)
    }
    return(normalizePath(paths))
  }
  normalizePath("~/.kube/config", mustWork = TRUE)
}

# Read and merge one or more kubeconfig files (client-go semantics: first
# definition of a name wins). Every cluster/user/context entry is tagged with
# the file it came from (`.origin`) so relative paths can be resolved and
# refreshed credentials written back to the right file.
read_kubeconfig <- function(paths) {
  merged <- list(clusters = list(), users = list(), contexts = list(),
                 `current-context` = NULL)
  for (p in paths) {
    kc <- yaml::read_yaml(p) %||% list()
    for (sect in c("clusters", "users", "contexts")) {
      have <- vapply(merged[[sect]], function(x) x$name %||% "", character(1))
      for (item in kc[[sect]] %||% list()) {
        if (is.null(item$name) || item$name %in% have) next
        item$.origin <- p
        merged[[sect]][[length(merged[[sect]]) + 1]] <- item
        have <- c(have, item$name)
      }
    }
    cur <- kc$`current-context`
    if (is.null(merged$`current-context`) && !is.null(cur) && nzchar(cur)) {
      merged$`current-context` <- cur
    }
  }
  merged
}

strip_origin <- function(x) { x$.origin <- NULL; x }

# The cluster extension client-go hands to exec plugins as `cluster.config`.
exec_extension_config <- function(extensions) {
  for (e in extensions %||% list()) {
    if (identical(e$name, "client.authentication.k8s.io/exec")) return(e$extension)
  }
  NULL
}

load_kube_config_from_dict <- function(kc, context = NULL, base_dir = getwd(),
                                       persist_config = FALSE) {
  if (is.null(kc$contexts) || length(kc$contexts) == 0) {
    stop("kubeconfig has no contexts")
  }
  ctx_name <- context %||% kc$`current-context`
  if (is.null(ctx_name) || !nzchar(ctx_name)) {
    stop("No context specified and kubeconfig has no current-context")
  }
  ctx <- find_named(kc$contexts, ctx_name, "context")
  if (is.null(ctx)) stop(sprintf("Context '%s' not found in kubeconfig", ctx_name))

  cluster <- find_named(kc$clusters, ctx$context[["cluster"]], "cluster")
  if (is.null(cluster)) {
    stop(sprintf("Cluster '%s' not found in kubeconfig", ctx$context[["cluster"]]))
  }
  user <- if (!is.null(ctx$context[["user"]]))
    find_named(kc$users, ctx$context[["user"]], "user") else NULL

  cl <- cluster$cluster
  usr <- if (!is.null(user)) user$user else list()
  cluster_dir <- if (!is.null(cluster$.origin)) dirname(cluster$.origin) else base_dir
  user_dir <- if (!is.null(user$.origin)) dirname(user$.origin) else base_dir

  cfg <- Configuration$new(
    host = cl[["server"]],
    verify_ssl = !isTRUE(cl[["insecure-skip-tls-verify"]]),
    context_name = ctx_name
  )
  ns <- ctx$context[["namespace"]]
  if (!is.null(ns) && nzchar(ns)) cfg$namespace <- ns
  if (!is.null(cl[["proxy-url"]]) && nzchar(cl[["proxy-url"]])) {
    cfg$proxy <- cl[["proxy-url"]]
  }
  if (!is.null(cl[["tls-server-name"]]) && nzchar(cl[["tls-server-name"]])) {
    cfg$tls_server_name <- cl[["tls-server-name"]]
  }

  # NOTE: use `[[` for every kubeconfig key: `$` does partial matching on
  # lists, so `usr$token` would silently read `tokenFile`, and
  # "certificate-authority" would match "certificate-authority-data".
  cfg$ssl_ca_cert <- materialize_pem(cl[["certificate-authority"]],
                                      cl[["certificate-authority-data"]],
                                      cluster_dir, suffix = "ca.crt")
  cfg$cert_file <- materialize_pem(usr[["client-certificate"]],
                                    usr[["client-certificate-data"]],
                                    user_dir, suffix = "client.crt")
  cfg$key_file <- materialize_pem(usr[["client-key"]],
                                   usr[["client-key-data"]],
                                   user_dir, suffix = "client.key")

  if (!is.null(usr[["token"]]) && nzchar(usr[["token"]])) {
    cfg$api_key <- list(authorization = paste("Bearer", usr[["token"]]))
  } else if (!is.null(usr[["tokenFile"]])) {
    cfg$token_file <- path_rel(usr[["tokenFile"]], user_dir)
  }
  if (!is.null(usr[["username"]])) {
    cfg$username <- usr[["username"]]
    cfg$password <- usr[["password"]]
  }
  if (!is.null(usr[["exec"]])) {
    ex <- usr[["exec"]]
    # Like client-go: a bare name is looked up on PATH, an absolute path is
    # used as-is, and a relative path with a separator is relative to the
    # kubeconfig file.
    cmd <- ex$command %||% ""
    if (grepl("/", cmd, fixed = TRUE) && !startsWith(cmd, "/")) {
      ex$command <- path_rel(cmd, user_dir)
    }
    cfg$exec <- ex
    cfg$exec_cluster <- drop_nulls(list(
      server = cl[["server"]],
      `tls-server-name` = cl[["tls-server-name"]],
      `insecure-skip-tls-verify` = cl[["insecure-skip-tls-verify"]],
      `certificate-authority-data` = cl[["certificate-authority-data"]] %||%
        if (!is.null(cfg$ssl_ca_cert))
          base64enc::base64encode(readBin(cfg$ssl_ca_cert, "raw",
                                          file.info(cfg$ssl_ca_cert)$size)),
      `proxy-url` = cl[["proxy-url"]],
      config = exec_extension_config(cl[["extensions"]])
    ))
  }
  if (!is.null(usr[["auth-provider"]])) {
    ap <- usr[["auth-provider"]]
    if (!identical(ap$name, "oidc")) {
      stop(sprintf(paste0(
        "kubeconfig user '%s' uses the '%s' auth-provider, which Kubernetes ",
        "removed in v1.26. Switch to its exec credential plugin (e.g. ",
        "gke-gcloud-auth-plugin for GKE, kubelogin for AKS)."),
        user$name, ap$name), call. = FALSE)
    }
    cfg$auth_provider <- list(
      name = "oidc", config = ap$config %||% list(), user_name = user$name,
      kubeconfig = if (isTRUE(persist_config)) user$.origin else NULL,
      base_dir = user_dir
    )
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
