#!/usr/bin/env Rscript
# Stream pod events in the `default` namespace for up to 60 seconds.

library(rk8s)

client <- new_client_from_config()

w <- Watch$new()
w$stream(
  client,
  resource_path = "/api/v1/namespaces/default/pods",
  callback = function(type, object) {
    phase <- if (is.null(object$status$phase)) "-" else object$status$phase
    cat(sprintf("[%s] %s phase=%s\n", type, object$metadata$name, phase))
    TRUE  # keep watching; return FALSE to stop
  },
  timeout_seconds = 60
)
