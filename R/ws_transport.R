# WebSocket transport for pod exec / port-forward, built on nanonext.
#
# The `websocket` package was used previously, but it never verifies the
# server certificate (its TLS context sets no verify mode, loads no CA and
# checks no hostname), so the bearer token was sent to whoever answered.
# nanonext's `stream()` verifies the peer against a CA and checks the
# hostname when given a `tls_config(client = <ca>)`, and can send the
# Authorization and Sec-WebSocket-Protocol headers the API server needs.
#
# Limitations (each gives a clear error instead of an insecure connection):
#   * no TLS client certificates (nanonext client configs carry only a CA),
#     so cert-only kubeconfig users need a token for exec / port-forward;
#   * no tls-server-name override (the URL host is what gets verified);
#   * no HTTP proxy;
#   * a peer close is not reported by recv() (it keeps timing out); only the
#     next send() fails. Exec ends on the final status frame instead, and
#     port-forward notices a dead connection on its next write.
#
# ws_plan() makes every decision without touching the network, so it can be
# unit tested; ws_connect() dials it.

ws_plan <- function(cfg, path, query = character(),
                    protocol = "v4.channel.k8s.io") {
  host <- sub("/$", "", cfg$host)
  secure <- grepl("^https://", host)
  url <- paste0(sub("^http", "ws", host), path,
                if (length(query)) paste0("?", paste(query, collapse = "&")))

  if (secure && !is.null(cfg$tls_server_name) && nzchar(cfg$tls_server_name)) {
    stop("pod exec / port-forward cannot honour the kubeconfig ",
         "tls-server-name (", cfg$tls_server_name, "): the WebSocket client ",
         "verifies the certificate against the URL host only. Point the ",
         "cluster `server:` at a name the certificate covers.", call. = FALSE)
  }

  tok <- cfg$bearer_token()
  has_token <- !is.null(tok) && nzchar(tok)
  if (!has_token) {
    cc <- cfg$client_cert()
    if (!is.null(cc$cert_file)) {
      stop("pod exec / port-forward needs a bearer token, but the active ",
           "kubeconfig context only has client-certificate auth, which the ",
           "WebSocket client (nanonext) cannot present.\n",
           "Workarounds:\n",
           "  - use a token-based user (exec plugin, OIDC, ServiceAccount ",
           "token via `kubectl create token <sa>`)\n",
           "  - run from inside the cluster (load_incluster_config())",
           call. = FALSE)
    }
  }

  headers <- c(`Sec-WebSocket-Protocol` = protocol)
  if (has_token) headers <- c(Authorization = paste("Bearer", tok), headers)

  ca <- NULL
  if (secure && isTRUE(cfg$verify_ssl)) {
    ca <- cfg$ssl_ca_cert %||% system_ca_bundle()
    if (is.null(ca)) {
      stop("pod exec / port-forward needs a CA certificate to verify the ",
           "API server, but the kubeconfig has none and no system CA bundle ",
           "was found. Set `certificate-authority` in the kubeconfig, or ",
           "SSL_CERT_FILE.", call. = FALSE)
    }
  }
  list(url = url, headers = headers, ca = ca, secure = secure,
       verify = secure && isTRUE(cfg$verify_ssl))
}

# First existing CA bundle among the usual env vars and OS locations.
system_ca_bundle <- function() {
  cands <- c(Sys.getenv(c("SSL_CERT_FILE", "CURL_CA_BUNDLE")),
             "/etc/ssl/cert.pem",                      # macOS, Alpine
             "/etc/ssl/certs/ca-certificates.crt",     # Debian, Ubuntu
             "/etc/pki/tls/certs/ca-bundle.crt",       # RHEL, Fedora
             "/etc/ssl/ca-bundle.pem")                 # SUSE
  cands <- cands[nzchar(cands) & file.exists(cands)]
  if (length(cands)) cands[[1]] else NULL
}

# Open the WebSocket and return a small transport object:
#   send(raw)          write one binary frame
#   recv(timeout)      next frame as raw, or NULL if none arrived in
#                      `timeout` seconds or the connection is closed
#   is_closed()        TRUE once the peer closed or close() was called
#   close()
ws_connect <- function(cfg, path, query = character(),
                       protocol = "v4.channel.k8s.io") {
  if (!requireNamespace("nanonext", quietly = TRUE)) {
    stop("pod exec / port-forward requires the `nanonext` package. ",
         "Install with: install.packages(\"nanonext\")", call. = FALSE)
  }
  plan <- ws_plan(cfg, path, query, protocol)
  tls <- if (!is.null(plan$ca)) nanonext::tls_config(client = plan$ca)
  con <- tryCatch(
    nanonext::stream(dial = plan$url, headers = plan$headers, tls = tls),
    error = function(e) {
      stop("could not open WebSocket to ", sub("\\?.*$", "", plan$url), ": ",
           conditionMessage(e),
           if (plan$verify) paste0(
             "\n(A 'Cryptographic error' means the server certificate did ",
             "not verify against ", plan$ca, " or does not match the host; ",
             "a 'Protocol error' usually means the API server refused the ",
             "upgrade, e.g. 401/403 or a missing pod.)"),
           call. = FALSE)
    })
  ws_transport(con)
}

ws_transport <- function(con) {
  state <- new.env(parent = emptyenv())
  state$closed <- FALSE
  mark_closed <- function() {
    if (!state$closed) {
      state$closed <- TRUE
      try(close(con), silent = TRUE)
    }
  }
  list(
    send = function(data) {
      if (state$closed) stop("WebSocket is closed", call. = FALSE)
      r <- nanonext::send(con, data, mode = "raw", block = 10000L)
      if (nanonext::is_error_value(r) && !identical(as.integer(r), 0L)) {
        mark_closed()
        stop("WebSocket send failed: ", nanonext::nng_error(r), call. = FALSE)
      }
      invisible(TRUE)
    },
    recv = function(timeout = 0) {
      if (state$closed) return(NULL)
      # A non-blocking recv (block = FALSE) never returns stream data, so
      # always wait at least 1 ms.
      ms <- max(1L, as.integer(round(timeout * 1000)))
      r <- nanonext::recv(con, mode = "raw", block = ms)
      if (nanonext::is_error_value(r)) {
        # 5 = timed out, 8 = try again; anything else means the connection
        # is gone, and later recv calls would only report timeouts, so
        # remember it now.
        if (!as.integer(r) %in% c(5L, 8L)) mark_closed()
        return(NULL)
      }
      r
    },
    is_closed = function() state$closed,
    close = mark_closed
  )
}
