# A minimal HTTP responder for Kubernetes liveness and readiness probes,
# serviced from the Manager's loop (no threads, no extra packages).
#
#   GET /healthz -> 200 "ok" whenever the loop is turning. If a reconcile
#                   hangs, nobody answers, the probe times out, and the
#                   kubelet restarts the pod.
#   GET /readyz  -> 200 "ok" once the manager is running (or standing by
#                   for the leader lease), 503 "not ready" before that.
#   anything else -> 404.
HealthServer <- R6::R6Class(
  "HealthServer",
  public = list(
    port = NULL,

    initialize = function(port) {
      self$port <- as.integer(port)
      private$srv <- serverSocket(self$port)
    },

    # Answer every request that is waiting, without blocking when none is.
    poll = function(ready = TRUE) {
      if (is.null(private$srv)) return(invisible(0L))
      n <- 0L
      repeat {
        pending <- tryCatch(socketSelect(list(private$srv), timeout = 0),
                            error = function(e) FALSE)
        if (!isTRUE(pending[1])) break
        con <- tryCatch(
          socketAccept(private$srv, blocking = TRUE, open = "r+b", timeout = 2),
          error = function(e) NULL)
        if (is.null(con)) break
        tryCatch(private$answer(con, isTRUE(ready)), error = function(e) NULL)
        n <- n + 1L
      }
      invisible(n)
    },

    close = function() {
      if (!is.null(private$srv)) try(close(private$srv), silent = TRUE)
      private$srv <- NULL
      invisible(self)
    }
  ),

  private = list(
    srv = NULL,

    answer = function(con, ready) {
      on.exit(try(close(con), silent = TRUE), add = TRUE)
      line <- readLines(con, n = 1, warn = FALSE)
      # Read the rest of the request headers; closing with unread input can
      # make the TCP stack reset the connection before the client reads the
      # response.
      for (i in seq_len(50)) {
        h <- readLines(con, n = 1, warn = FALSE)
        if (!length(h) || !nzchar(sub("\r$", "", h))) break
      }
      path <- if (length(line)) sub("^[A-Z]+ ([^ ?]*).*$", "\\1", line) else ""
      res <- switch(path,
        "/healthz" = list(200L, "OK", "ok"),
        "/readyz"  = if (ready) list(200L, "OK", "ok")
                     else list(503L, "Service Unavailable", "not ready"),
        list(404L, "Not Found", "not found"))
      body <- paste0(res[[3]], "\n")
      writeBin(charToRaw(paste0(
        "HTTP/1.1 ", res[[1]], " ", res[[2]], "\r\n",
        "Content-Type: text/plain\r\n",
        "Content-Length: ", nchar(body, type = "bytes"), "\r\n",
        "Connection: close\r\n\r\n", body)), con)
      flush(con)
    }
  )
)
