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

      tok <- cfg$bearer_token()
      headers <- list()
      if (!is.null(tok) && nzchar(tok)) {
        headers[["Authorization"]] <- paste("Bearer", tok)
      } else if (!is.null(cfg$cert_file)) {
        stop("port-forward over WebSocket with client-cert auth is not ",
             "currently supported. Use a bearer-token kubeconfig.",
             call. = FALSE)
      }

      ws <- websocket::WebSocket$new(
        url,
        protocols = "v4.channel.k8s.io",
        headers = headers,
        accessLogChannels = "none"
      )
      ws$onMessage(function(event) private$handle_frame(event$data))
      ws$onClose(function(event) { private$closed <- TRUE })
      ws$onError(function(event) {
        warning("port-forward websocket error: ", event$message, call. = FALSE)
        private$closed <- TRUE
      })
      ws$connect()
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
