test_that("call_api builds URL, path params, query params, and Authorization", {
  cfg <- Configuration$new(
    host = "https://example.test:6443/",  # trailing slash must be normalized
    api_key = list(authorization = "Bearer xyz"),
    verify_ssl = FALSE
  )
  ac <- ApiClient$new(cfg)
  req <- ac$call_api(
    resource_path = "/api/v1/namespaces/{namespace}/pods/{name}",
    method = "GET",
    path_params = list(namespace = "kube-system", name = "kube-proxy-abc"),
    query_params = list(labelSelector = "app=proxy"),
    stream = TRUE
  )
  expect_equal(req$method, "GET")
  expect_match(req$url,
               "^https://example\\.test:6443/api/v1/namespaces/kube-system/pods/kube-proxy-abc\\?labelSelector=app%3Dproxy$")
  expect_equal(req$headers[["Authorization"]], "Bearer xyz")
})

test_that("path parameters are URL-encoded", {
  ac <- ApiClient$new(Configuration$new(host = "https://x"))
  req <- ac$call_api(
    resource_path = "/api/v1/namespaces/{namespace}/pods",
    method = "GET",
    path_params = list(namespace = "my namespace/with slashes"),
    stream = TRUE
  )
  expect_match(req$url, "/namespaces/my%20namespace%2Fwith%20slashes/pods")
})

test_that("ApiException carries status, reason, and parsed metav1.Status body", {
  err <- ApiException$new(
    status = 404, reason = "Not Found",
    headers = list(), body = '{"kind":"Status","message":"pods \\"x\\" not found","code":404}'
  )
  expect_equal(err$status, 404L)
  expect_match(err$format(), "404")
  expect_match(err$format(), "not found")
})
