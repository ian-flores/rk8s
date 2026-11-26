# Pod exec/attach over WebSocket - implements the v4.channel.k8s.io subprotocol.
#
# Each WS binary frame from the server is prefixed with a 1-byte channel id:
#   0 = stdin   (client -> server)
#   1 = stdout  (server -> client)
#   2 = stderr  (server -> client)
#   3 = error   (server -> client; metav1.Status JSON when exec fails)
#   4 = resize  (client -> server; TTY only; payload is JSON {Width,Height})
#
# Reference:
#   https://github.com/kubernetes/kubernetes/blob/master/pkg/kubelet/cri/streaming/remotecommand/websocket.go
#   client-go: tools/remotecommand/websocket.go
#   Python: kubernetes.stream.WSClient

#' Open an interactive exec session on a pod
#'
#' Establishes a WebSocket to `/api/v1/namespaces/{ns}/pods/{name}/exec` using
#' the `v4.channel.k8s.io` subprotocol and returns a [PodExecSession] you can
#' write to / read from.
#'
#' Requires the `nanonext` package (a Suggests dependency). The API server's
#' certificate is verified against the kubeconfig CA (or the system CA bundle)
#' and its hostname is checked, unless the kubeconfig sets
#' `insecure-skip-tls-verify`. Authentication is a bearer token sent in the
#' `Authorization` header (token, token file, exec plugin or OIDC users);
#' users with only a client certificate get an error explaining the
#' alternatives, because the WebSocket client cannot present one.
#'
#' @param client An [ApiClient] (typically `kube()$client`).
#' @param namespace Namespace of the pod.
#' @param name Pod name.
#' @param command Character vector: the command and its arguments.
#' @param container Optional container name (required if the pod has more
#'   than one container).
#' @param stdin,stdout,stderr Logical; which streams to enable (default
#'   stdout+stderr only).
#' @param tty Logical; allocate a TTY (combines stdout+stderr; supports
#'   terminal resize events).
#' @return A [PodExecSession].
#' @examples
#' \dontrun{
#' k <- kube()
#' s <- pod_exec_open(k$client, "default", "nginx-abc", c("/bin/sh"),
#'                     stdin = TRUE)
#' s$on_stdout(function(b) cat(rawToChar(b)))
#' s$write_stdin("ls -la\n")
#' s$close()
#' }
#' @export
pod_exec_open <- function(client, namespace, name, command,
                            container = NULL, stdin = FALSE, stdout = TRUE,
                            stderr = TRUE, tty = FALSE) {
  PodExecSession$new(client, namespace, name, command, container,
                      stdin, stdout, stderr, tty)
}

#' Run a command in a pod, capture stdout/stderr/exit code
#'
#' Higher-level one-shot wrapper over [pod_exec_open()] for the common case:
#' "run this and tell me what happened". Blocks until the remote command
#' exits and the connection closes.
#'
#' @inheritParams pod_exec_open
#' @param stdin_data Optional character or raw vector to send on stdin
#'   before closing the input channel.
#' @param timeout Wall-clock cap in seconds (default 60). Sessions that
#'   exceed it are forcibly closed; `timed_out = TRUE` is set on the result.
#' @return A list with `stdout` (character), `stderr` (character),
#'   `exit_code` (integer or `NA`), and `timed_out` (logical).
#' @examples
#' \dontrun{
#' k <- kube()
#' r <- pod_exec(k$client, "default", "nginx-abc", c("ls", "-la", "/"))
#' cat(r$stdout); message("exit ", r$exit_code)
#' }
#' @export
pod_exec <- function(client, namespace, name, command, container = NULL,
                      stdin_data = NULL, timeout = 60) {
  s <- PodExecSession$new(client, namespace, name, command, container,
                           stdin = !is.null(stdin_data),
                           stdout = TRUE, stderr = TRUE, tty = FALSE)
  out_buf <- list(); err_buf <- list()
  s$on_stdout(function(b) out_buf[[length(out_buf) + 1]] <<- b)
  s$on_stderr(function(b) err_buf[[length(err_buf) + 1]] <<- b)
  if (!is.null(stdin_data)) {
    s$write_stdin(stdin_data)
    s$close_stdin()
  }
  timed_out <- !s$wait(timeout)
  if (timed_out) s$close()
  list(
    stdout = paste(vapply(out_buf, rawToChar, character(1)), collapse = ""),
    stderr = paste(vapply(err_buf, rawToChar, character(1)), collapse = ""),
    exit_code = s$exit_code,
    timed_out = timed_out
  )
}

#' Pod exec session
#'
#' Returned by [pod_exec_open()]. Carries an open WebSocket; demuxes the
#' v4.channel.k8s.io subprotocol; routes server-to-client frames to user
#' callbacks; sends client-to-server frames via `write_stdin()`/`resize()`.
#' Incoming frames are dispatched while `wait()` or `pump()` runs.
#'
#' @export
PodExecSession <- R6::R6Class(
  "PodExecSession",
  public = list(
    #' @field exit_code Exit code reported by the kubelet on `error` channel,
    #'   or `NA_integer_` if the session ended without one.
    exit_code = NA_integer_,
    #' @field error Last error condition (a `metav1.Status` parsed list), or
    #'   `NULL`.
    error = NULL,

    #' @description Construct. Usually you call [pod_exec_open()] instead.
    #' @param client An [ApiClient].
    #' @param namespace,name,command,container,stdin,stdout,stderr,tty
    #'   See [pod_exec_open()].
    initialize = function(client, namespace, name, command, container,
                          stdin, stdout, stderr, tty) {
      private$client <- client
      private$callbacks <- list()
      private$closed <- FALSE
      private$ws <- private$open(namespace, name, command, container,
                                  stdin, stdout, stderr, tty)
    },

    #' @description Register a stdout callback; receives raw chunks.
    #' @param fn `function(raw)`: the byte payload (no channel prefix).
    on_stdout = function(fn) { private$callbacks$stdout <- fn; invisible(self) },

    #' @description Register a stderr callback.
    #' @param fn `function(raw)`.
    on_stderr = function(fn) { private$callbacks$stderr <- fn; invisible(self) },

    #' @description Register a callback fired when the kubelet's `error`
    #'   channel reports a `metav1.Status` (typically at session end with
    #'   the exit code; or earlier on container failure).
    #' @param fn `function(status_list)`.
    on_error = function(fn) { private$callbacks$error <- fn; invisible(self) },

    #' @description Register a close callback; fired once the WebSocket
    #'   transitions to closed.
    #' @param fn `function()`.
    on_close = function(fn) { private$callbacks$close <- fn; invisible(self) },

    #' @description Send bytes to the remote stdin.
    #' @param data Character or raw vector.
    write_stdin = function(data) {
      if (is.character(data)) data <- charToRaw(paste(data, collapse = ""))
      private$send(0L, data)
      invisible(self)
    },

    #' @description Resize the remote TTY. Only meaningful when `tty=TRUE`.
    #' @param width,height Integers (columns and rows).
    resize = function(width, height) {
      payload <- charToRaw(jsonlite::toJSON(
        list(Width = as.integer(width), Height = as.integer(height)),
        auto_unbox = TRUE))
      private$send(4L, payload)
      invisible(self)
    },

    #' @description Half-close the connection by sending a zero-length
    #'   stdin frame, signalling EOF to the remote.
    close_stdin = function() {
      private$send(0L, raw(0))
      invisible(self)
    },

    #' @description Close the WebSocket.
    close = function() {
      private$finish()
      invisible(self)
    },

    #' @description Dispatch frames that arrive within `timeout` seconds to
    #'   the registered callbacks. Returns as soon as the first frame (and any
    #'   already queued behind it) has been handled, or after `timeout`.
    #' @param timeout Seconds to wait for a frame (default 0, i.e. ~1 ms).
    #' @return `TRUE` while the session is open, invisibly.
    pump = function(timeout = 0) {
      if (isTRUE(private$closed)) return(invisible(FALSE))
      frame <- private$ws$recv(timeout)
      while (!is.null(frame)) {
        private$handle_frame(frame)
        frame <- private$ws$recv(0)
      }
      # The status on the error channel is the last thing the API server
      # sends before closing. nanonext does not report a peer close to
      # recv(), so treat the status as end-of-session: drain anything still
      # in flight, then finish.
      if (!is.null(self$error)) {
        repeat {
          frame <- private$ws$recv(0.2)
          if (is.null(frame)) break
          private$handle_frame(frame)
        }
        private$finish()
      }
      if (private$ws$is_closed()) private$finish()
      invisible(!isTRUE(private$closed))
    },

    #' @description Block until the session closes or `timeout` elapses,
    #'   dispatching frames in the meantime.
    #' @param timeout Seconds (default 60).
    #' @return `TRUE` if the session ended naturally; `FALSE` on timeout.
    wait = function(timeout = 60) {
      deadline <- Sys.time() + timeout
      while (!isTRUE(private$closed)) {
        left <- as.numeric(difftime(deadline, Sys.time(), units = "secs"))
        if (left <= 0) break
        self$pump(min(0.1, left))
      }
      isTRUE(private$closed)
    }
  ),

  private = list(
    client = NULL,
    ws = NULL,
    callbacks = NULL,
    closed = FALSE,

    open = function(namespace, name, command, container, stdin, stdout,
                    stderr, tty) {
      enc <- function(x) utils::URLencode(x, reserved = TRUE)
      query <- c(
        sprintf("command=%s", vapply(command, enc, character(1))),
        if (!is.null(container)) sprintf("container=%s", enc(container)),
        sprintf("stdin=%s",  tolower(as.character(isTRUE(stdin)))),
        sprintf("stdout=%s", tolower(as.character(isTRUE(stdout)))),
        sprintf("stderr=%s", tolower(as.character(isTRUE(stderr)))),
        sprintf("tty=%s",    tolower(as.character(isTRUE(tty))))
      )
      ws_connect(private$client$configuration,
                 sprintf("/api/v1/namespaces/%s/pods/%s/exec", namespace, name),
                 query)
    },

    # Mark closed (once), close the transport, fire the close callback.
    finish = function() {
      if (isTRUE(private$closed)) return(invisible())
      private$closed <- TRUE
      try(private$ws$close(), silent = TRUE)
      cb <- private$callbacks$close; if (!is.null(cb)) cb()
      invisible()
    },

    send = function(channel, data) {
      stopifnot(is.raw(data))
      private$ws$send(c(as.raw(channel), data))
    },

    handle_frame = function(data) {
      if (!is.raw(data) || length(data) == 0) return()
      ch <- as.integer(data[1])
      payload <- if (length(data) > 1) data[-1] else raw(0)
      if (ch == 1L) {
        cb <- private$callbacks$stdout; if (!is.null(cb)) cb(payload)
      } else if (ch == 2L) {
        cb <- private$callbacks$stderr; if (!is.null(cb)) cb(payload)
      } else if (ch == 3L) {
        # error channel: the kubelet sends a metav1.Status JSON with the
        # exit code stuffed into status$details$causes[[*]]$message="123".
        st <- tryCatch(
          jsonlite::fromJSON(rawToChar(payload), simplifyVector = FALSE),
          error = function(e) NULL
        )
        if (!is.null(st)) {
          self$error <- st
          # Try to extract the exit code (kubelet convention).
          for (cause in st$details$causes %||% list()) {
            if (identical(cause$reason, "ExitCode")) {
              self$exit_code <- suppressWarnings(as.integer(cause$message))
              break
            }
          }
          # Status="Success" without an exit-code cause => exit 0.
          if (identical(st$status, "Success") && is.na(self$exit_code)) {
            self$exit_code <- 0L
          }
          cb <- private$callbacks$error; if (!is.null(cb)) cb(st)
        }
      }
      # ch 0 (stdin) and ch 4 (resize) are client->server; not expected here.
    }
  )
)
