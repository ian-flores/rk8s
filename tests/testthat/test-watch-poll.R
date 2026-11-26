pods_path <- "/api/v1/namespaces/default/pods"

names_of <- function(events) {
  vapply(events, function(e) paste(e$type, e$object$metadata$name), "")
}

# Poll until `n` events have arrived or `budget` seconds pass.
poll_until <- function(w, n, budget = 5) {
  got <- list()
  deadline <- Sys.time() + budget
  while (length(got) < n && Sys.time() < deadline) {
    got <- c(got, w$poll(0.2))
  }
  got
}

test_that("open/poll returns events as they happen, without blocking", {
  f <- local_fake_api(pods = "a")
  w <- Watch$new()
  w$open(f$client, pods_path)
  withr::defer(w$close())
  expect_true(w$is_open())

  expect_equal(names_of(poll_until(w, 1)), "ADDED a")

  # Nothing pending: poll(0) returns at once with no events.
  t0 <- Sys.time()
  expect_length(w$poll(0), 0)
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 0.5)

  f$ctl(act("modify", "a"), act("add", "b"))
  t0 <- Sys.time()
  got <- poll_until(w, 2)
  expect_equal(names_of(got), c("MODIFIED a", "ADDED b"))
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 2)
  expect_equal(w$resource_version, as.character(f$state()$rv))

  w$close()
  expect_false(w$is_open())
  expect_equal(w$end_reason, "stop")
})

test_that("poll reconnects after the server ends a watch, resuming from the last version", {
  f <- local_fake_api(pods = "a")
  w <- Watch$new()
  # The server closes each connection after 1s; the watch itself has no
  # overall limit, so poll() should reconnect transparently.
  w$open(f$client, pods_path, server_timeout = 1)
  withr::defer(w$close())
  expect_equal(names_of(poll_until(w, 1)), "ADDED a")

  f$ctl(act("modify", "a", after = 2.5))
  got <- poll_until(w, 1, budget = 6)
  expect_equal(names_of(got), "MODIFIED a")   # not a replayed ADDED
  expect_true(w$is_open())

  watches <- grep("^watch", unlist(f$state()$requests), value = TRUE)
  expect_gte(length(watches), 2)
  expect_true(all(grepl("resourceVersion=", watches[-1])))
})

test_that("timeout_seconds ends a polled watch with end_reason 'timeout'", {
  f <- local_fake_api()
  w <- Watch$new()
  w$open(f$client, pods_path, timeout_seconds = 1)
  t0 <- Sys.time()
  while (w$is_open() && Sys.time() - t0 < 5) w$poll(0.2)
  expect_false(w$is_open())
  expect_equal(w$end_reason, "timeout")
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 3)
})

test_that("410 Gone mid-stream ends the watch when return_on_gone = TRUE", {
  f <- local_fake_api(pods = "a")
  w <- Watch$new()
  w$open(f$client, pods_path, return_on_gone = TRUE)
  withr::defer(w$close())
  poll_until(w, 1)
  f$ctl(act("modify", "a", silent = TRUE), act("compact"))
  # The fake reports 410 on the next pass of the open stream.
  t0 <- Sys.time()
  while (w$is_open() && Sys.time() - t0 < 5) w$poll(0.2)
  expect_equal(w$end_reason, "gone")
})

test_that("Informer poll() keeps the cache current and relists after 410", {
  f <- local_fake_api(pods = c("a", "b"))
  inf <- Informer$new(f$client, pods_path)
  log <- character()
  inf$add_event_handler(
    on_add = function(obj) log <<- c(log, paste("add", obj$metadata$name)),
    on_update = function(old, new) log <<- c(log, paste("update", new$metadata$name)),
    on_delete = function(obj) log <<- c(log, paste("delete", obj$metadata$name)))
  inf$start()
  withr::defer(inf$close())
  expect_true(inf$has_synced())
  expect_equal(log, c("add a", "add b"))

  f$ctl(act("modify", "a"))
  t0 <- Sys.time()
  while (length(log) < 3 && Sys.time() - t0 < 5) inf$poll(0.2)
  expect_equal(log[3], "update a")

  # Missed changes, then 410: poll() should relist and reconcile.
  f$ctl(act("delete", "b", silent = TRUE), act("add", "c", silent = TRUE),
        act("compact"))
  t0 <- Sys.time()
  while (length(log) < 5 && Sys.time() - t0 < 6) inf$poll(0.2)
  expect_setequal(log[4:5], c("delete b", "add c"))
  expect_setequal(names(inf$list()), c("default/a", "default/c"))

  # And the watch carries on after the relist.
  f$ctl(act("modify", "c"))
  t0 <- Sys.time()
  while (length(log) < 6 && Sys.time() - t0 < 5) inf$poll(0.2)
  expect_equal(log[6], "update c")
})

test_that("two informers can be driven from one loop", {
  f <- local_fake_api(pods = "a")
  seen <- list(one = character(), two = character())
  infs <- list(one = Informer$new(f$client, pods_path),
               two = Informer$new(f$client, pods_path))
  for (nm in names(infs)) local({
    nm <- nm
    infs[[nm]]$add_event_handler(
      on_add = function(obj) seen[[nm]] <<- c(seen[[nm]], obj$metadata$name))
  })
  for (inf in infs) inf$start()
  withr::defer(for (inf in infs) inf$close())

  f$ctl(act("add", "b"))
  t0 <- Sys.time()
  while (!(length(seen$one) == 2 && length(seen$two) == 2) &&
         Sys.time() - t0 < 5) {
    for (inf in infs) inf$poll(0.05)
  }
  expect_equal(seen$one, c("a", "b"))
  expect_equal(seen$two, c("a", "b"))
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 2)
})

test_that("open() does not wait for the first event on a resumed watch", {
  # The real API server sends nothing on a resumed watch until an event
  # arrives (often a bookmark, about a minute later). Opening must not block
  # on that, or one quiet watch stalls every other watch in the loop.
  f <- local_fake_api(pods = "a")
  f$ctl(act("hold_resumed"))
  rv <- as.character(f$state()$rv)
  w <- Watch$new()
  t0 <- Sys.time()
  w$open(f$client, pods_path, resource_version = rv)
  withr::defer(w$close())
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 1)
  expect_length(w$poll(0.3), 0)

  f$ctl(act("modify", "a", after = 1))
  expect_equal(names_of(poll_until(w, 1)), "MODIFIED a")
})
