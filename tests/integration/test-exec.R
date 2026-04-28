test_that("pod_exec runs a command and captures stdout/stderr/exit", {
  skip_if_not_installed("websocket")
  skip_if_not_installed("later")

  k <- kube(namespace = "default")
  # Cert-only kubeconfigs (default for kind) need a bearer token for the
  # WebSocket call. Mint one via TokenRequest against a cluster-admin SA.
  token_client <- mint_token_client(k)
  try(kube_delete(k, "pod/rk8s-it-exec", grace_period = 0), silent = TRUE)
  for (i in seq_len(20)) {
    gone <- tryCatch({ kube_get(k, "pod/rk8s-it-exec"); FALSE },
                      rk8s_api_error = function(e) e$exception$status == 404L)
    if (gone) break
    Sys.sleep(1)
  }
  withr::defer(try(kube_delete(k, "pod/rk8s-it-exec", grace_period = 0),
                     silent = TRUE))

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

  r <- pod_exec(token_client, "default", "rk8s-it-exec",
                 c("sh", "-c", "echo hello; echo bad >&2; exit 7"))
  expect_equal(r$exit_code, 7L)
  expect_match(r$stdout, "^hello\n")
  expect_match(r$stderr, "^bad\n")
})
