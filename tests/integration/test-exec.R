test_that("pod_exec runs a command and captures stdout/stderr/exit", {
  skip_if_not_installed("websocket")
  skip_if_not_installed("later")

  k <- kube(namespace = "default")
  withr::defer(try(kube_delete(k, "pod/rk8s-it-exec"), silent = TRUE))

  kube_apply(k, list(
    apiVersion = "v1", kind = "Pod",
    metadata = list(name = "rk8s-it-exec"),
    spec = list(
      restartPolicy = "Never",
      containers = list(list(
        name = "sh", image = "busybox:1.36",
        command = list("sh", "-c", "sleep 600")
      ))
    )
  ))

  # Wait for the pod to be Running.
  for (i in seq_len(60)) {
    p <- tryCatch(kube_get(k, "pod/rk8s-it-exec"),
                   rk8s_api_error = function(e) NULL)
    if (!is.null(p) && identical(p$status$phase, "Running")) break
    Sys.sleep(2)
  }
  expect_equal(p$status$phase, "Running")

  r <- pod_exec(k$client, "default", "rk8s-it-exec",
                 c("sh", "-c", "echo hello; echo bad >&2; exit 7"))
  expect_equal(r$exit_code, 7L)
  expect_match(r$stdout, "^hello\n")
  expect_match(r$stderr, "^bad\n")
})
