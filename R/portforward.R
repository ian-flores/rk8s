# Port-forward over WebSocket — implements the v4.channel.k8s.io subprotocol
# for /api/v1/namespaces/{ns}/pods/{name}/portforward.
#
# Channel layout: ports are paired. For the i-th requested port (0-indexed):
#   * channel 2*i   = data    (bidirectional)
#   * channel 2*i+1 = error   (server -> client)
# The first frame on every channel from the kubelet contains a 2-byte
# little-endian port number. We swallow that and route subsequent frames as
# raw bytes on the corresponding port.
#
# Reference:
#   client-go: tools/portforward/portforward.go
#   kubelet: pkg/kubelet/cri/streaming/portforward/websocket.go
#   Python: kubernetes.stream.ws_client.PortForward

#' Open a port-forward session to a pod
#'
#' Establishes a WebSocket to `/api/v1/namespaces/{ns}/pods/{name}/portforward`
#' and returns a [PodPortForwardSession]. Unlike `kubectl port-forward`, this
#' does **not** stand up a local TCP listener; instead it exposes a programmatic
#' `write(port, bytes)` / `on_data(port, fn)` API. That's the direct mapping
#' of the websocket protocol and matches the Python client's `PortForward`.
#'
#' @param client An [ApiClient].
#' @param namespace,name Pod coordinates.
#' @param ports Integer vector of remote ports to forward (e.g. `c(80, 443)`).
#' @return A [PodPortForwardSession].
#' @examples
#' \dontrun{
#' k <- kube()
#' pf <- pod_port_forward_open(k$client, "default", "nginx-abc", ports = 80)
#' pf$on_data(80, function(b) cat(rawToChar(b)))
#' pf$write(80, charToRaw("GET / HTTP/1.1\r\nHost: x\r\nConnection: close\r\n\r\n"))
#' pf$wait(timeout = 5)
#' pf$close()
#' }
#' @export
pod_port_forward_open <- function(client, namespace, name, ports) {
  PodPortForwardSession$new(client, namespace, name, as.integer(ports))
}

#' Forward a pod port to a local TCP listener (kubectl-style)
#'
#' Stands up a local TCP server bound to `127.0.0.1` and bridges every
#' accepted connection to a port on a pod via a [PodPortForwardSession]
#' running in a `callr` child process. Returns immediately; the bridge
#' lives until you call `$close()`.
#'
#' Equivalent to `kubectl port-forward pod/<name> <local>:<remote>`.
#'
#' @param client An [ApiClient].
#' @param namespace,name Pod coordinates.
#' @param remote_port Pod-side port to connect to.
#' @param local_port Local port to bind. `0` (default) picks a random
#'   ephemeral port; the chosen port is exposed as `$port` on the result.
#' @return A `PortForwardBridge` with fields `port` (the local port),
#'   `process` (the `callr` background handle), and a `$close()` method.
#' @examples
#' \dontrun{
#' k <- kube()
#' fwd <- pod_port_forward(k$client, "default", "nginx-abc", remote_port = 80)
#' Sys.sleep(0.5)
#' httr2::request(paste0("http://127.0.0.1:", fwd$port)) |> httr2::req_perform()
#' fwd$close()
#' }
#' @export
pod_port_forward <- function(client, namespace, name, remote_port,
                              local_port = 0) {
  if (!requireNamespace("websocket", quietly = TRUE)) {
    stop("pod_port_forward() requires the `websocket` package.", call. = FALSE)
  }
  if (!requireNamespace("callr", quietly = TRUE)) {
    stop("pod_port_forward() requires the `callr` package.", call. = FALSE)
  }
  if (!requireNamespace("later", quietly = TRUE)) {
    stop("pod_port_forward() requires the `later` package.", call. = FALSE)
  }

  # Reserve a free port in this process before handing off, so we can return
  # it to the caller synchronously. We close it right before the child binds
  # — small window of TOCTOU which is acceptable for ephemeral dev use.
  port <- if (identical(local_port, 0L) || identical(local_port, 0))
    pick_free_port() else as.integer(local_port)

  # Capture all the bits the child needs to recreate an ApiClient. We
  # explicitly forward materialised PEM paths and the bearer token, since
  # exec-plugin tokens are derived in this process and not portable.
  cfg <- client$configuration
  child_cfg <- list(
    host = cfg$host,
    token = cfg$bearer_token(),
    ssl_ca_cert = cfg$ssl_ca_cert,
    cert_file = cfg$cert_file,
    key_file = cfg$key_file,
    verify_ssl = cfg$verify_ssl
  )

  log_path <- tempfile("rk8s-pf-", fileext = ".log")
  proc <- callr::r_bg(
    func = .pod_port_forward_child,
    args = list(child_cfg = child_cfg, namespace = namespace, name = name,
                remote_port = as.integer(remote_port), local_port = port),
    supervise = TRUE,
    stdout = log_path,
    stderr = "2>&1"
  )

  bridge <- structure(
    list(
      port = port,
      remote_port = as.integer(remote_port),
      process = proc,
      log_path = log_path,
      close = function() {
        if (inherits(proc, "process") && proc$is_alive()) {
          tryCatch(proc$kill(), error = function(e) NULL)
        }
      }
    ),
    class = "PortForwardBridge"
  )

  # Wait briefly for the listener to come up so the caller can immediately
  # connect. Bail out fast if the child died (e.g. token expired, pod gone).
  deadline <- Sys.time() + 5
  repeat {
    if (port_is_open(port)) break
    if (!proc$is_alive()) {
      err <- tryCatch(proc$read_error(), error = function(e) "")
      out <- tryCatch(proc$read_output(), error = function(e) "")
      stop("port-forward child exited before binding: ",
           paste(c(err, out), collapse = "\n"), call. = FALSE)
    }
    if (Sys.time() > deadline) {
      proc$kill()
      stop("Timed out waiting for local port-forward listener on ", port,
           call. = FALSE)
    }
    Sys.sleep(0.05)
  }
  bridge
}

#' @export
print.PortForwardBridge <- function(x, ...) {
  alive <- inherits(x$process, "process") && x$process$is_alive()
  cat(sprintf("<PortForwardBridge> 127.0.0.1:%d -> pod:%d (%s)\n",
              x$port, x$remote_port, if (alive) "running" else "stopped"))
  invisible(x)
}

# Pick an ephemeral port that's currently free on 127.0.0.1. Tries a few
# random picks before falling back to letting the OS allocate (which we then
# read back). On systems where serverSocket(0) doesn't expose the chosen port,
# we just retry with random picks.
pick_free_port <- function(retries = 50) {
  for (i in seq_len(retries)) {
    p <- sample(49152:65535, 1)
    fd <- tryCatch(serverSocket(p), error = function(e) NULL)
    if (!is.null(fd)) {
      close.connection(fd)
      return(p)
    }
  }
  stop("Could not allocate a local port for port-forward", call. = FALSE)
}

# Connect-test a local port — TRUE once the child's listener is up.
port_is_open <- function(port) {
  conn <- tryCatch(
    suppressWarnings(socketConnection(host = "127.0.0.1", port = port,
                                        blocking = TRUE, timeout = 1,
                                        open = "r+")),
    error = function(e) NULL
  )
  if (is.null(conn)) return(FALSE)
  close(conn)
  TRUE
}

# Runs in the callr child process. Opens a websocket port-forward to the pod,
# binds a local TCP listener, and bridges accepted connections.
.pod_port_forward_child <- function(child_cfg, namespace, name,
                                      remote_port, local_port) {
  cfg <- rk8s::Configuration$new(
    host = child_cfg$host,
    api_key = if (!is.null(child_cfg$token))
      list(authorization = paste("Bearer", child_cfg$token)) else list(),
    ssl_ca_cert = child_cfg$ssl_ca_cert,
    cert_file = child_cfg$cert_file,
    key_file = child_cfg$key_file,
    verify_ssl = isTRUE(child_cfg$verify_ssl)
  )
  client <- rk8s::ApiClient$new(cfg)
  session <- rk8s::pod_port_forward_open(client, namespace, name,
                                           ports = remote_port)

  # WebSocket connects asynchronously. Wait until it's OPEN (readyState=1)
  # before binding the local listener so we don't accept TCP clients only
  # to drop their bytes on a half-open WS.
  ws <- session$.__enclos_env__$private$ws
  deadline <- Sys.time() + 10
  while (!is.null(ws) && ws$readyState() == 0L && Sys.time() < deadline) {
    later::run_now(0.05)
  }
  if (!is.null(ws) && ws$readyState() != 1L) {
    stop("WebSocket failed to reach OPEN state (readyState=",
         ws$readyState(), ")", call. = FALSE)
  }
  server <- serverSocket(local_port)
  on.exit({
    try(close.connection(server), silent = TRUE)
    try(session$close(), silent = TRUE)
  }, add = TRUE)

  # Single-connection-at-a-time bridge. K8s portforward channels are 1:1
  # with requested ports, not 1:1 with TCP connections, so multiplexing
  # parallel client connections over a single websocket isn't supported by
  # the protocol. For dev workflows that's fine — match kubectl's default.
  repeat {
    # Pump the websocket while we wait for clients.
    later::run_now(0.05)
    ready <- tryCatch(socketSelect(list(server), timeout = 0.25),
                       error = function(e) NULL)
    if (is.null(ready) || !isOpen(server)) break
    if (!isTRUE(ready[[1]])) next

    # Open the accepted connection in non-blocking mode so readBin returns
    # immediately with whatever the kernel has buffered (even raw(0)). With
    # blocking=TRUE, R's connection layer adds enough latency between the
    # buffered data being queued and a subsequent readBin returning it that
    # the local round trip can stretch into seconds for short HTTP exchanges.
    local <- tryCatch(
      socketAccept(server, blocking = FALSE, open = "a+b", timeout = 5),
      error = function(e) NULL
    )
    if (is.null(local)) next
    # Resolve the internal helper at call time. `getFromNamespace` is the
    # CRAN-blessed way to reach a package's unexported binding; using `:::`
    # in package code triggers a check warning. callr ships this function
    # body into a fresh R process where rk8s is reachable but its private
    # bindings aren't injected.
    bridge_one <- utils::getFromNamespace("bridge_one", "rk8s")
    bridge_one(session, remote_port, local)
  }
}

bridge_one <- function(session, remote_port, local) {
  on.exit(try(close.connection(local), silent = TRUE), add = TRUE)

  # Per-connection inbox for pod->local bytes. Closures around `inbox`
  # outlive bridge_one across the websocket's onMessage callback, but only
  # the *current* on_data handler points to this inbox (each new connection
  # rebinds it).
  inbox <- new.env(parent = emptyenv())
  inbox$buf <- list()
  session$on_data(remote_port, function(b) {
    inbox$buf[[length(inbox$buf) + 1L]] <- b
  })

  # K8s portforward gives us no per-connection close signal. We can't
  # reliably tell a fast-but-silent client from a closed peer through the
  # R/socketSelect interaction either (a successful write seems to leave
  # the local socket pseudo-readable on macOS, with readBin then returning
  # 0 — indistinguishable from a real EOF). So we run on dual idle timers:
  # once both sides have been quiet for `idle_grace`, we close.
  idle_grace <- 1.5
  last_local_byte <- Sys.time()
  last_pod_byte   <- Sys.time()

  while (TRUE) {
    later::run_now(0.02)

    if (length(inbox$buf) > 0) {
      for (chunk in inbox$buf) {
        ok <- tryCatch({ writeBin(chunk, local); flush(local); TRUE },
                       error = function(e) FALSE)
        if (!ok) return()
      }
      inbox$buf <- list()
      last_pod_byte <- Sys.time()
    }

    # Non-blocking readBin: returns whatever's queued in the kernel right
    # now (could be 0 bytes, no error). Avoids the multi-second latency we
    # saw with `socketSelect` + blocking readBin on macOS.
    chunk <- tryCatch(readBin(local, raw(), n = 65536, size = 1L),
                      error = function(e) NULL)
    if (is.null(chunk)) return()
    if (length(chunk) > 0) {
      session$write(remote_port, chunk)
      last_local_byte <- Sys.time()
    } else {
      # Tiny sleep to keep this loop from pegging a CPU core when both
      # halves are quiet.
      Sys.sleep(0.005)
    }

    # Both halves have been quiet for `idle_grace` seconds: close.
    now <- Sys.time()
    if (now - last_local_byte > idle_grace &&
          now - last_pod_byte > idle_grace) return()
  }
}

#' Pod port-forward session
#'
#' Returned by [pod_port_forward_open()]. Holds an open WebSocket and routes
#' bytes between the user and the per-port data channels.
#'
#' @export
PodPortForwardSession <- R6::R6Class(
  "PodPortForwardSession",
  public = list(
    #' @field ports Forwarded remote ports (integer vector).
    ports = integer(),
    #' @field errors Per-port error strings populated from the kubelet's
    #'   error channels. `errors[[as.character(port)]]` is `NA` until set.
    errors = NULL,

    #' @description Construct.
    #' @param client An [ApiClient].
    #' @param namespace,name,ports See [pod_port_forward_open()].
    initialize = function(client, namespace, name, ports) {
      if (!requireNamespace("websocket", quietly = TRUE)) {
        stop("pod_port_forward_open() requires the `websocket` package. ",
             "Install with: install.packages(\"websocket\")", call. = FALSE)
      }
      self$ports <- ports
      self$errors <- setNames(as.list(rep(NA_character_, length(ports))),
                                as.character(ports))
      private$client <- client
      private$cb <- list()
      private$first_seen <- rep(FALSE, 2L * length(ports))
      private$closed <- FALSE
      private$ws <- private$open(namespace, name, ports)
    },

    #' @description Register a per-port data callback.
    #' @param port Remote port (must have been requested at open time).
    #' @param fn `function(raw)` called with each chunk received.
    on_data = function(port, fn) {
      key <- as.character(port)
      if (!key %in% names(self$errors)) {
        stop("Port ", port, " was not requested for forwarding.", call. = FALSE)
      }
      private$cb[[key]] <- fn
      invisible(self)
    },

    #' @description Send bytes to a remote port.
    #' @param port Remote port.
    #' @param data Character or raw vector.
    write = function(port, data) {
      idx <- match(as.integer(port), self$ports)
      if (is.na(idx)) stop("Port ", port, " was not requested.", call. = FALSE)
      if (is.character(data)) data <- charToRaw(paste(data, collapse = ""))
      ch <- as.raw(2L * (idx - 1L))     # data channel
      private$ws$send(c(ch, data))
      invisible(self)
    },

    #' @description Close the WebSocket.
    close = function() {
      if (!isTRUE(private$closed)) {
        try(private$ws$close(), silent = TRUE)
        private$closed <- TRUE
      }
      invisible(self)
    },

    #' @description Block while pumping the websocket event loop.
    #' @param timeout Seconds.
    #' @return `TRUE` if the session ended naturally; `FALSE` on timeout.
    wait = function(timeout = 60) {
      deadline <- Sys.time() + timeout
      while (!isTRUE(private$closed) && Sys.time() < deadline) {
        later::run_now(0.1)
      }
      isTRUE(private$closed)
    }
  ),

  private = list(
    client = NULL,
    ws = NULL,
    cb = NULL,
    first_seen = NULL,    # logical[2*nports]; TRUE once the leading 2-byte
                          # port-number frame has been consumed.
    closed = FALSE,

    open = function(namespace, name, ports) {
      cfg <- private$client$configuration
      base <- sub("^https://", "wss://",
                   sub("^http://", "ws://", sub("/$", "", cfg$host)))
      path <- sprintf("/api/v1/namespaces/%s/pods/%s/portforward", namespace, name)
      qparts <- sprintf("ports=%d", ports)
      url <- paste0(base, path, "?", paste(qparts, collapse = "&"))

      headers <- list()
      tok <- cfg$bearer_token()
      if (!is.null(tok) && nzchar(tok)) {
        headers[["Authorization"]] <- paste("Bearer", tok)
      }
      ws_args <- ws_tls_args(cfg)

      ws <- do.call(websocket::WebSocket$new, c(
        list(url = url,
             protocols = "v4.channel.k8s.io",
             headers = headers,
             accessLogChannels = "none"),
        ws_args
      ))
      ws$onMessage(function(event) private$handle_frame(event$data))
      ws$onClose(function(event) { private$closed <- TRUE })
      ws$onError(function(event) {
        warning("port-forward websocket error: ", event$message, call. = FALSE)
        private$closed <- TRUE
      })
      ws
    },

    handle_frame = function(data) {
      if (!is.raw(data) || length(data) == 0) return()
      ch <- as.integer(data[1])
      payload <- if (length(data) > 1) data[-1] else raw(0)

      # The kubelet's first frame on every channel is the 2-byte LE port
      # number — used by the client to validate. Swallow it.
      ch_idx <- ch + 1L
      if (ch_idx > length(private$first_seen)) return()
      if (!isTRUE(private$first_seen[ch_idx])) {
        private$first_seen[ch_idx] <- TRUE
        return()
      }

      port_idx <- (ch %/% 2L) + 1L
      if (port_idx > length(self$ports)) return()
      port <- self$ports[port_idx]
      key <- as.character(port)

      if (ch %% 2L == 0L) {
        # Data channel
        cb <- private$cb[[key]]
        if (!is.null(cb)) cb(payload)
      } else {
        # Error channel: one-shot string (typically "unable to do port forwarding")
        self$errors[[key]] <- rawToChar(payload)
      }
    }
  )
)
