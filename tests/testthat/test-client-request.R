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
  # URL-decode before matching: httr2 may percent-encode `=` or pass it
  # through depending on platform/version. The post-decoded query is what
  # actually reaches the server, so test that.
  expect_match(req$url,
               "^https://example\\.test:6443/api/v1/namespaces/kube-system/pods/kube-proxy-abc\\?")
  parts <- strsplit(req$url, "?", fixed = TRUE)[[1]]
  expect_equal(URLdecode(parts[2]), "labelSelector=app=proxy")
  # Don't poke inside the httr2 `req` for the Authorization header — its
  # storage shape changed between 1.0 and 1.1 (now wrapped with
  # `obfuscated()` to keep tokens out of printed reqs). Verify the bearer
  # token round-trips through Configuration instead, which is the same
  # value `call_api` uses to set the header.
  expect_equal(cfg$bearer_token(), "xyz")
  # And confirm an Authorization entry is present on the request, however
  # httr2 chooses to store it.
  expect_true("Authorization" %in% names(req$headers))
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
