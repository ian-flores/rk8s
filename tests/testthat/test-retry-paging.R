flaky_app <- function() {
  app <- webfakes::new_app()
  app$locals$hits <- list()
  hit <- function(req, key) {
    n <- (req$app$locals$hits[[key]] %||% 0L) + 1L
    req$app$locals$hits[[key]] <- n
    n
  }
  # 429 twice (Retry-After: 0), then OK.
  app$get("/throttled", function(req, res) {
    if (hit(req, "throttled") <= 2) {
      res$set_header("Retry-After", "0")
      return(res$set_status(429L)$send_json(list(code = 429L), auto_unbox = TRUE))
    }
    res$send_json(list(ok = TRUE), auto_unbox = TRUE)
  })
  # 503 once, then OK -- for both GET and POST.
  app$get("/flaky", function(req, res) {
    if (hit(req, "flaky-get") <= 1) {
      return(res$set_status(503L)$send_json(list(code = 503L), auto_unbox = TRUE))
    }
    res$send_json(list(ok = TRUE), auto_unbox = TRUE)
  })
  app$post("/flaky", function(req, res) {
    hit(req, "flaky-post")
    res$set_status(503L)$send_json(list(kind = "Status", code = 503L,
                                        message = "unavailable"), auto_unbox = TRUE)
  })
  app$post("/throttled-post", function(req, res) {
    if (hit(req, "throttled-post") <= 1) {
      res$set_header("Retry-After", "0")
      return(res$set_status(429L)$send_json(list(code = 429L), auto_unbox = TRUE))
    }
    res$send_json(list(created = TRUE), auto_unbox = TRUE)
  })
  app$get("/hits", function(req, res) res$send_json(req$app$locals$hits, auto_unbox = TRUE))
  app
}
environment(flaky_app) <- list2env(
  list(`%||%` = function(x, y) if (is.null(x)) y else x), parent = baseenv())

local_flaky <- function(.env = parent.frame()) {
  skip_if_not_installed("webfakes")
  web <- webfakes::local_app_process(flaky_app(), .local_envir = .env)
  base <- sub("/$", "", web$url())
  list(base = base,
       hits = function() httr2::resp_body_json(httr2::req_perform(
         httr2::request(paste0(base, "/hits")))))
}

test_that("429 is retried for any method, honouring Retry-After", {
  f <- local_flaky()
  client <- ApiClient$new(Configuration$new(host = f$base))
  expect_true(client$call_api("/throttled")$ok)
  expect_true(client$call_api("/throttled-post", "POST", body = list(a = 1))$created)
  expect_equal(f$hits()$throttled, 3L)
  expect_equal(f$hits()$`throttled-post`, 2L)
})

test_that("5xx is retried for GET but not for POST", {
  f <- local_flaky()
  client <- ApiClient$new(Configuration$new(host = f$base))
  expect_true(client$call_api("/flaky")$ok)
  expect_error(client$call_api("/flaky", "POST", body = list(a = 1)),
               class = "rk8s_api_error")
  expect_equal(f$hits()$`flaky-post`, 1L)
})

test_that("max_retries = 0 disables retries", {
  f <- local_flaky()
  cfg <- Configuration$new(host = f$base)
  cfg$max_retries <- 0L
  expect_error(ApiClient$new(cfg)$call_api("/throttled"), class = "rk8s_api_error")
  expect_equal(f$hits()$throttled, 1L)
})

test_that("DynamicResource$list fetches every page; explicit limit returns one", {
  f <- local_fake_api(pods = c("a", "b", "c", "d", "e"))
  res <- DynamicResource$new(f$client, list(
    api_version = "v1", kind = "Pod", name = "pods", namespaced = TRUE,
    base_path = "/api/v1"))
  all <- res$list(namespace = "default", page_size = 2)
  expect_equal(vapply(all$items, function(x) x$metadata$name, ""),
               c("a", "b", "c", "d", "e"))
  expect_null(all$metadata[["continue"]])

  one <- res$list(namespace = "default", limit = 2)
  expect_length(one$items, 2)
  expect_equal(one$metadata[["continue"]], "2")
})
