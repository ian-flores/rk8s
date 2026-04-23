# Exec credential plugin
#
# Implements client.authentication.k8s.io ExecCredential v1/v1beta1 as used by
# EKS (aws-iam-authenticator), GKE (gke-gcloud-auth-plugin), and others.
# Spec: https://kubernetes.io/docs/reference/access-authn-authz/authentication/#client-go-credential-plugins
#
# Invokes the configured command, parses the returned ExecCredential JSON, and
# returns the bearer token (or client cert/key pair, if that's what the plugin
# returns — mapped back into the Configuration at call sites).

# Cached credentials keyed by a hash of the exec spec. Cleared when the
# expirationTimestamp passes.
.rk8s_exec_cache <- new.env(parent = emptyenv())

exec_plugin_token <- function(spec) {
  creds <- exec_plugin_run(spec)
  creds$status$token
}

exec_plugin_run <- function(spec) {
  key <- digest_key(spec)
  cached <- .rk8s_exec_cache[[key]]
  if (!is.null(cached) && !exec_expired(cached)) return(cached)

  cmd <- spec$command %||% stop("exec plugin: `command` is required")
  args <- spec$args %||% character()
  env <- spec$env %||% list()

  env_vec <- Sys.getenv()
  for (e in env) {
    if (!is.null(e$name)) env_vec[[e$name]] <- as.character(e$value %||% "")
  }

  input <- jsonlite::toJSON(list(
    apiVersion = spec$apiVersion %||% "client.authentication.k8s.io/v1",
    kind = "ExecCredential",
    spec = list(interactive = FALSE)
  ), auto_unbox = TRUE)

  res <- system2(
    cmd, args = args, input = input,
    stdout = TRUE, stderr = TRUE,
    env = paste0(names(env_vec), "=", env_vec)
  )
  status <- attr(res, "status")
  if (!is.null(status) && status != 0) {
    stop(sprintf("exec plugin '%s' failed (exit %d): %s",
                 cmd, status, paste(res, collapse = "\n")))
  }
  out <- paste(res, collapse = "\n")
  creds <- jsonlite::fromJSON(out, simplifyVector = FALSE)
  .rk8s_exec_cache[[key]] <- creds
  creds
}

exec_expired <- function(creds) {
  exp <- creds$status$expirationTimestamp
  if (is.null(exp)) return(FALSE)
  parsed <- tryCatch(as.POSIXct(exp, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
                     error = function(e) NA)
  if (is.na(parsed)) return(FALSE)
  Sys.time() >= parsed - as.difftime(30, units = "secs")
}

digest_key <- function(x) {
  rawToChar(openssl::sha256(jsonlite::toJSON(x, auto_unbox = TRUE))[1:16])
}
