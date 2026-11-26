# Exec credential plugin
#
# Implements client.authentication.k8s.io ExecCredential v1/v1beta1 as used by
# EKS (aws eks get-token / aws-iam-authenticator), GKE
# (gke-gcloud-auth-plugin), AKS (kubelogin) and others.
# Spec: https://kubernetes.io/docs/reference/access-authn-authz/authentication/#client-go-credential-plugins
#
# The plugin receives its input in the KUBERNETES_EXEC_INFO environment
# variable and prints an ExecCredential JSON on stdout. The credential is
# either a bearer token or a client certificate/key pair. Results are cached
# until `status.expirationTimestamp` (minus a small skew), and dropped early
# when the API server answers 401.

# Cached credentials keyed by a hash of the exec spec (+ cluster info).
.rk8s_exec_cache <- new.env(parent = emptyenv())

# Returns list(token, cert_file, key_file); any element may be NULL.
exec_plugin_credentials <- function(spec, cluster = NULL) {
  key <- exec_cache_key(spec, cluster)
  cached <- .rk8s_exec_cache[[key]]
  if (!is.null(cached) && !exec_expired(cached$raw)) return(cached)

  raw <- exec_plugin_run(spec, cluster)
  st <- raw$status %||% list()
  creds <- list(
    raw = raw,
    token = st$token,
    cert_file = write_secret_pem(st$clientCertificateData, "exec-client.crt"),
    key_file = write_secret_pem(st$clientKeyData, "exec-client.key")
  )
  if (is.null(creds$token) && (is.null(creds$cert_file) || is.null(creds$key_file))) {
    stop("exec plugin '", spec$command, "' returned neither a token nor a ",
         "client certificate/key pair", call. = FALSE)
  }
  old <- .rk8s_exec_cache[[key]]
  if (!is.null(old)) unlink(c(old$cert_file, old$key_file))
  .rk8s_exec_cache[[key]] <- creds
  creds
}

exec_plugin_token <- function(spec, cluster = NULL) {
  exec_plugin_credentials(spec, cluster)$token
}

# Forget cached credentials (all of them, or for one spec), e.g. after a 401.
exec_cache_clear <- function(spec = NULL, cluster = NULL) {
  keys <- if (is.null(spec)) ls(.rk8s_exec_cache) else exec_cache_key(spec, cluster)
  for (k in intersect(keys, ls(.rk8s_exec_cache))) {
    unlink(c(.rk8s_exec_cache[[k]]$cert_file, .rk8s_exec_cache[[k]]$key_file))
    rm(list = k, envir = .rk8s_exec_cache)
  }
  invisible()
}

exec_plugin_run <- function(spec, cluster = NULL) {
  cmd <- spec$command %||% stop("exec plugin: `command` is required", call. = FALSE)
  args <- as.character(unlist(spec$args %||% character()))
  api_version <- spec$apiVersion %||% "client.authentication.k8s.io/v1"

  info <- list(apiVersion = api_version, kind = "ExecCredential",
               spec = list(interactive = FALSE))
  if (isTRUE(spec$provideClusterInfo) && !is.null(cluster)) {
    info$spec$cluster <- cluster
  }

  # Set variables in this process for the duration of the call rather than
  # via system2(env = ...), which pastes them unquoted into a shell command.
  vars <- list(KUBERNETES_EXEC_INFO = as.character(
    jsonlite::toJSON(info, auto_unbox = TRUE, null = "null")))
  for (e in spec$env %||% list()) {
    if (!is.null(e$name)) vars[[e$name]] <- as.character(e$value %||% "")
  }
  restore <- local_env_vars(vars)
  on.exit(restore(), add = TRUE)

  if (!nzchar(Sys.which(cmd)) && !file.exists(cmd)) {
    stop(exec_failure_message(spec, sprintf("command '%s' not found", cmd)),
         call. = FALSE)
  }

  err_file <- tempfile("rk8s-exec-stderr-")
  on.exit(unlink(err_file), add = TRUE)
  out <- suppressWarnings(system2(cmd, args = shQuote(args), stdout = TRUE,
                                  stderr = err_file, stdin = ""))
  status <- attr(out, "status") %||% 0L
  err <- if (file.exists(err_file)) readLines(err_file, warn = FALSE) else character()
  if (status != 0) {
    stop(exec_failure_message(spec, sprintf("exited with status %d", status), err),
         call. = FALSE)
  }

  creds <- tryCatch(
    jsonlite::fromJSON(paste(out, collapse = "\n"), simplifyVector = FALSE),
    error = function(e) {
      stop(exec_failure_message(spec, "did not print a valid ExecCredential JSON",
                                c(utils::head(out, 5), err)), call. = FALSE)
    }
  )
  if (!identical(creds$kind, "ExecCredential")) {
    stop(exec_failure_message(spec, sprintf("returned kind '%s', expected ExecCredential",
                                            creds$kind %||% "")), call. = FALSE)
  }
  creds
}

exec_failure_message <- function(spec, what, detail = character()) {
  msg <- sprintf("exec credential plugin '%s' %s", spec$command, what)
  if (length(detail)) msg <- paste0(msg, ":\n", paste(detail, collapse = "\n"))
  if (!is.null(spec$installHint) && nzchar(spec$installHint)) {
    msg <- paste0(msg, "\n\n", spec$installHint)
  }
  msg
}

exec_expired <- function(creds) {
  exp <- creds$status$expirationTimestamp
  if (is.null(exp)) return(FALSE)
  parsed <- parse_rfc3339(exp)
  if (is.na(parsed)) return(TRUE)    # unparseable: don't trust the cache
  as.numeric(Sys.time()) >= parsed - 30
}

exec_cache_key <- function(spec, cluster = NULL) {
  digest_key(list(spec, if (isTRUE(spec$provideClusterInfo)) cluster))
}

digest_key <- function(x) {
  paste(as.character(openssl::sha256(
    charToRaw(as.character(jsonlite::toJSON(x, auto_unbox = TRUE, null = "null"))))),
    collapse = "")
}

# Parse an RFC 3339 timestamp ("2024-01-02T03:04:05Z", with optional
# fractional seconds and a "Z" or +hh:mm / -hh:mm offset) to epoch seconds.
parse_rfc3339 <- function(x) {
  if (is.null(x) || !is.character(x) || length(x) != 1) return(NA_real_)
  m <- regmatches(x, regexec(
    "^(\\d{4}-\\d{2}-\\d{2})[Tt ](\\d{2}:\\d{2}:\\d{2})(\\.\\d+)?([Zz]|[+-]\\d{2}:?\\d{2})$",
    x))[[1]]
  if (length(m) == 0) return(NA_real_)
  base <- as.numeric(as.POSIXct(paste(m[2], m[3]), format = "%Y-%m-%d %H:%M:%S",
                                tz = "UTC"))
  frac <- if (nzchar(m[4])) as.numeric(paste0("0", m[4])) else 0
  off <- 0
  if (!toupper(m[5]) %in% "Z") {
    sgn <- if (startsWith(m[5], "-")) -1 else 1
    digits <- gsub("[^0-9]", "", m[5])
    off <- sgn * (as.numeric(substr(digits, 1, 2)) * 3600 +
                  as.numeric(substr(digits, 3, 4)) * 60)
  }
  base + frac - off
}

# Write base64-free PEM text (as returned by exec plugins) to a private temp
# file. Returns NULL when `pem` is NULL/empty.
write_secret_pem <- function(pem, suffix) {
  if (is.null(pem) || !nzchar(pem)) return(NULL)
  path <- tempfile("rk8s-", fileext = paste0("-", suffix))
  file.create(path)
  Sys.chmod(path, "0600")
  writeLines(pem, path, sep = "")
  path
}

# Set environment variables; returns a function that restores the old values.
local_env_vars <- function(vars) {
  if (!length(vars)) return(function() invisible())
  old <- Sys.getenv(names(vars), unset = NA, names = TRUE)
  do.call(Sys.setenv, vars)
  function() {
    for (nm in names(old)) {
      if (is.na(old[[nm]])) Sys.unsetenv(nm)
      else do.call(Sys.setenv, stats::setNames(list(old[[nm]]), nm))
    }
    invisible()
  }
}
