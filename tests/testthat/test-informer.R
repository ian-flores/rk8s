pods_path <- "/api/v1/namespaces/default/pods"

recorder <- function(inf) {
  log <- character()
  inf$add_event_handler(
    on_add = function(obj) log <<- c(log, paste("add", obj$metadata$name)),
    on_update = function(old, new) log <<- c(log, paste("update", new$metadata$name)),
    on_delete = function(obj) log <<- c(log, paste("delete", obj$metadata$name))
  )
  function() log
}

test_that("run(stop_seconds) returns on time on a quiet resource", {
  f <- local_fake_api(pods = c("a", "b"))
  inf <- Informer$new(f$client, pods_path)
  log <- recorder(inf)
  t0 <- Sys.time()
  inf$run(stop_seconds = 2)
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 4)
  expect_true(inf$has_synced())
  expect_equal(log(), c("add a", "add b"))
  expect_setequal(names(inf$list()), c("default/a", "default/b"))
})

test_that("410 Gone triggers a re-list that reconciles missed changes", {
  f <- local_fake_api(pods = c("a", "b"))
  inf <- Informer$new(f$client, pods_path)
  log <- recorder(inf)
  # While the watch is open: b is deleted and c added *without* watch events
  # (as if we'd been disconnected), then history is compacted -> 410.
  # Afterwards a normal MODIFIED for a must still be delivered.
  f$ctl(act("delete", "b", after = 0.5, silent = TRUE),
        act("add", "c", after = 0.5, silent = TRUE),
        act("compact", after = 0.5),
        act("modify", "a", after = 1.5))
  inf$run(stop_seconds = 3)
  l <- log()
  expect_length(l, 5)
  expect_equal(l[1:2], c("add a", "add b"))           # initial list
  expect_setequal(l[3:4], c("delete b", "add c"))     # reconciliation after 410
  expect_equal(l[5], "update a")                      # live watch resumed
  expect_setequal(names(inf$list()), c("default/a", "default/c"))
  expect_null(inf$lister()$get("b", "default"))
})

test_that("unchanged objects do not fire on_update during reconciliation", {
  f <- local_fake_api(pods = c("a", "b"))
  inf <- Informer$new(f$client, pods_path)
  log <- recorder(inf)
  f$ctl(act("modify", "b", after = 0.3, silent = TRUE),
        act("compact", after = 0.3))
  inf$run(stop_seconds = 1.5)
  expect_equal(log(), c("add a", "add b", "update b"))
})

test_that("lists are paged with limit/continue", {
  f <- local_fake_api(pods = c("a", "b", "c", "d", "e"))
  inf <- Informer$new(f$client, pods_path, page_size = 2)
  inf$run(stop_seconds = 0.5)
  expect_length(inf$list(), 5)
  lists <- grep("^list", f$state()$requests, value = TRUE)
  expect_length(lists, 3)
  expect_match(lists[2], "continue=2")
})

test_that("run() can be re-invoked and resumes without re-listing", {
  f <- local_fake_api(pods = "a")
  inf <- Informer$new(f$client, pods_path)
  log <- recorder(inf)
  inf$run(stop_seconds = 0.5)
  f$ctl(act("add", "b"))
  inf$run(stop_seconds = 1)
  expect_equal(log(), c("add a", "add b"))
  expect_length(grep("^list", f$state()$requests), 1)
})

test_that("$stop() from a handler ends run()", {
  f <- local_fake_api(pods = "a")
  inf <- Informer$new(f$client, pods_path)
  inf$add_event_handler(on_update = function(old, new) inf$stop())
  f$ctl(act("modify", "a", after = 0.3))
  t0 <- Sys.time()
  inf$run()          # no deadline: only stop() can end it
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 3)
})

test_that("cache is populated even when no on_add handler is registered", {
  # Regression: put() was passed lazily through fire(...) and skipped.
  f <- local_fake_api(pods = c("a", "b"))
  inf <- Informer$new(f$client, pods_path)
  inf$run(stop_seconds = 0.5)
  expect_setequal(names(inf$list()), c("default/a", "default/b"))
})
