test_that("kube() connects and lists namespaces", {
  k <- kube()
  ns <- kube_list(k, "namespaces")
  expect_s3_class(ns, "rk8s_list")
  names <- vapply(ns$items, function(n) n$metadata$name, character(1))
  expect_true("default" %in% names)
  expect_true("kube-system" %in% names)
})

test_that("API server version is reachable", {
  k <- kube()
  v <- k$client$call_api("/version", method = "GET")
  expect_true(!is.null(v$gitVersion))
})
