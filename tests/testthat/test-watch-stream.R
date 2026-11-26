pods_path <- "/api/v1/namespaces/default/pods"

test_that("timeout_seconds is a wall-clock cap even when no events arrive", {
  f <- local_fake_api()
  w <- Watch$new()
  t0 <- Sys.time()
  w$stream(f$client, pods_path, callback = function(type, obj) TRUE,
           timeout_seconds = 2)
  elapsed <- as.numeric(difftime(Sys.time(), t0, units = "secs"))
  expect_lt(elapsed, 4)
  expect_gte(elapsed, 1.5)
  expect_equal(w$end_reason, "timeout")
})

test_that("timeout_seconds holds even if the server ignores timeoutSeconds", {
  f <- local_fake_api()
  f$ctl(act("ignore_timeout"))
  w <- Watch$new()
  t0 <- Sys.time()
  w$stream(f$client, pods_path, callback = function(type, obj) TRUE,
           timeout_seconds = 1)
  elapsed <- as.numeric(difftime(Sys.time(), t0, units = "secs"))
  expect_lt(elapsed, 9)          # 1s budget + 5s client-side backstop
  expect_equal(w$end_reason, "timeout")
})

test_that("events are delivered in order and resourceVersion is tracked", {
  f <- local_fake_api(pods = "a")
  f$ctl(act("modify", "a", after = 0.3), act("delete", "a", after = 0.6))
  seen <- character()
  w <- Watch$new()
  w$stream(f$client, pods_path, timeout_seconds = 3, callback = function(type, obj) {
    seen <<- c(seen, paste(type, obj$metadata$name))
    length(seen) < 3
  })
  expect_equal(seen, c("ADDED a", "MODIFIED a", "DELETED a"))
  expect_equal(w$end_reason, "stop")
  expect_equal(w$resource_version, as.character(f$state()$rv))
})

test_that("410 Gone returns with end_reason 'gone' when asked to", {
  f <- local_fake_api(pods = "a")
  f$ctl(act("modify", "a", silent = TRUE), act("compact"))
  w <- Watch$new()
  w$stream(f$client, pods_path, resource_version = "100", timeout_seconds = 3,
           return_on_gone = TRUE, callback = function(type, obj) TRUE)
  expect_equal(w$end_reason, "gone")
})

test_that("410 Gone without return_on_gone restarts from current state", {
  f <- local_fake_api(pods = "a")
  f$ctl(act("compact"))
  seen <- character()
  w <- Watch$new()
  w$stream(f$client, pods_path, resource_version = "100", timeout_seconds = 3,
           callback = function(type, obj) {
             seen <<- c(seen, paste(type, obj$metadata$name))
             FALSE
           })
  expect_equal(seen, "ADDED a")
})

test_that("kube_watch honours timeout_seconds on a quiet resource", {
  f <- local_fake_api()
  k <- structure(list(client = f$client, namespace = "default",
                      resource_and_name = function(ref) list(resource = list(
                        info = list(namespaced = TRUE, base_path = "/api/v1",
                                    name = "pods")))),
                 class = "rk8s_kube")
  t0 <- Sys.time()
  w <- kube_watch(k, "pods", on_event = function(type, obj) TRUE,
                  timeout_seconds = 1)
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 3)
  expect_equal(w$end_reason, "timeout")
})

test_that("events are delivered as they happen, not when the stream closes", {
  # Regression: a blocking 64 KB read held small events until the server
  # hung up, so a watch with a long timeout saw nothing for minutes.
  f <- local_fake_api(pods = "a")
  f$ctl(act("modify", "a", after = 0.5))
  t0 <- Sys.time()
  got_at <- NA
  w <- Watch$new()
  w$stream(f$client, pods_path, resource_version = as.character(f$state()$rv),
           timeout_seconds = 20, callback = function(type, obj) {
             got_at <<- as.numeric(difftime(Sys.time(), t0, units = "secs"))
             FALSE
           })
  expect_false(is.na(got_at))
  expect_lt(got_at, 2)
})

