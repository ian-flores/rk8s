test_that("pod_port_forward bridges a local TCP port to an nginx pod", {
  skip_if_not_installed("websocket")
  skip_if_not_installed("later")
  skip_if_not_installed("callr")

  k <- kube(namespace = "default")
  token_client <- mint_token_client(k)
  # Clean up any leftover pod from a previous (possibly killed) run so SSA
  # doesn't trip over a pod whose containers were spec'd by a different
  # field manager.
  try(kube_delete(k, "pod/rk8s-it-pf", grace_period = 0), silent = TRUE)
  for (i in seq_len(20)) {
    gone <- tryCatch({ kube_get(k, "pod/rk8s-it-pf"); FALSE },
                      rk8s_api_error = function(e) e$exception$status == 404L)
    if (gone) break
    Sys.sleep(1)
  }
  withr::defer(try(kube_delete(k, "pod/rk8s-it-pf", grace_period = 0),
                     silent = TRUE))

  kube_apply(k, list(
    apiVersion = "v1", kind = "Pod",
    metadata = list(name = "rk8s-it-pf", labels = list(app = "rk8s-it-pf")),
    spec = list(
      containers = list(list(
        name = "nginx", image = "nginx:1.25-alpine",
        ports = list(list(containerPort = 80L))
      ))
    )
  ))

  for (i in seq_len(60)) {
    p <- tryCatch(kube_get(k, "pod/rk8s-it-pf"),
                   rk8s_api_error = function(e) NULL)
    if (!is.null(p) && identical(p$status$phase, "Running")) break
    Sys.sleep(2)
  }
  expect_equal(p$status$phase, "Running")

  fwd <- pod_port_forward(token_client, "default", "rk8s-it-pf",
                            remote_port = 80)
  withr::defer(try(fwd$close(), silent = TRUE))

  # Hit the listener via raw TCP — keeps deps to base R. K8s portforward
  # has no per-connection close signal back to the client, so we read with
  # a bounded deadline rather than blocking until EOF.
  con <- socketConnection("127.0.0.1", port = fwd$port,
                           open = "r+b", blocking = TRUE, timeout = 10)
  withr::defer(try(close(con), silent = TRUE))
  writeBin(charToRaw("GET / HTTP/1.1\r\nHost: nginx\r\nConnection: close\r\n\r\n"), con)
  flush(con)

  total <- raw(0)
  deadline <- Sys.time() + 8
  while (Sys.time() < deadline) {
    ready <- socketSelect(list(con), timeout = 0.2)
    if (isTRUE(ready[[1]])) {
      chunk <- readBin(con, raw(), n = 8192, size = 1L)
      if (length(chunk) == 0) break  # EOF
      total <- c(total, chunk)
      # Heuristic: once we've seen the closing </html>, we're done.
      if (grepl("</html>", rawToChar(total), fixed = TRUE)) break
    }
  }
  resp <- rawToChar(total)
  expect_match(resp, "^HTTP/1\\.1 200")
  expect_match(resp, "Welcome to nginx", info = "expected nginx default page")
})
