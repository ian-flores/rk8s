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

test_that("a wildcard content type from the spec is sent as application/json", {
  # Most generated write operations pass content_type = "*/*" (the spec's
  # `consumes`); the API server answers that with 415.
  ac <- ApiClient$new(Configuration$new(host = "https://x"))
  body_type <- function(ct) {
    ac$call_api("/apis/apps/v1/namespaces/default/deployments", "POST",
                body = list(kind = "Deployment"), content_type = ct,
                stream = TRUE)$body$content_type
  }
  expect_equal(body_type("*/*"), "application/json")
  expect_equal(body_type("application/json-patch+json"),
               "application/json-patch+json")
  expect_equal(body_type("application/apply-patch+yaml"),
               "application/apply-patch+yaml")
})

test_that("text/plain accepts also offer */* (the API server 406s a bare text/plain)", {
  ac <- ApiClient$new(Configuration$new(host = "https://x"))
  accept <- function(a) ac$call_api("/api/v1/namespaces/d/pods/p/log",
                                    accept = a, stream = TRUE)$headers$Accept
  expect_equal(accept("text/plain"), "text/plain, */*")
  expect_equal(accept("application/json"), "application/json")
})

test_that("untyped responses are parsed only when they are JSON", {
  skip_if_not_installed("webfakes")
  app <- webfakes::new_app()
  app$get("/log", function(req, res) {
    res$set_type("text/plain")$send("line 1\n{not json}\n")
  })
  app$get("/obj", function(req, res) res$send_json(list(a = 1), auto_unbox = TRUE))
  app$get("/obj-charset", function(req, res) {
    res$set_header("Content-Type", "application/json; charset=utf-8")$send('{"b":2}')
  })
  web <- webfakes::local_app_process(app)
  ac <- ApiClient$new(Configuration$new(host = sub("/$", "", web$url())))
  expect_equal(ac$call_api("/log"), "line 1\n{not json}\n")
  expect_equal(ac$call_api("/obj"), list(a = 1L))
  expect_equal(ac$call_api("/obj-charset"), list(b = 2L))
})
