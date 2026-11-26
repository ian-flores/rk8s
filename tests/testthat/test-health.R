# Issue GET requests without blocking, servicing `serve()` until they finish
# (the server only answers when its owner polls it).
probe <- function(port, paths, serve, budget = 5) {
  pool <- curl::new_pool()
  out <- list()
  for (p in paths) local({
    p <- p
    curl::curl_fetch_multi(
      sprintf("http://127.0.0.1:%d%s", port, p),
      done = function(res) out[[p]] <<- list(status = res$status_code,
                                             body = rawToChar(res$content)),
      fail = function(msg) out[[p]] <<- list(status = NA, body = msg),
      pool = pool)
  })
  t0 <- Sys.time()
  while (length(out) < length(paths) && Sys.time() - t0 < budget) {
    curl::multi_run(timeout = 0.05, pool = pool)
    serve()
  }
  out
}

test_that("the health server answers /healthz, /readyz and 404", {
  port <- pick_free_port()
  h <- HealthServer$new(port)
  withr::defer(h$close())
  ready <- FALSE
  r <- probe(port, c("/healthz", "/readyz", "/other"), function() h$poll(ready))
  expect_equal(r[["/healthz"]], list(status = 200L, body = "ok\n"))
  expect_equal(r[["/readyz"]]$status, 503L)
  expect_equal(r[["/other"]]$status, 404L)

  ready <- TRUE
  expect_equal(probe(port, "/readyz", function() h$poll(ready))[["/readyz"]]$status, 200L)
  # Nothing pending: poll returns at once.
  t0 <- Sys.time(); h$poll(TRUE)
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 0.2)
})

test_that("a manager is ready once started, and probes are answered from step()", {
  f <- local_fake_api(pods = "a")
  mgr <- Manager$new(kube(client = f$client, namespace = "default"))
  mgr$controller("pods", namespace = "default", reconcile = function(req) NULL)
  port <- pick_free_port()
  mgr$serve_health(port)
  withr::defer(mgr$close())
  expect_equal(probe(port, "/readyz", function() mgr$step(0))[["/readyz"]]$status, 503L)
  mgr$start()
  r <- probe(port, c("/readyz", "/healthz"), function() mgr$step(0.05))
  expect_equal(r[["/readyz"]]$status, 200L)
  expect_equal(r[["/healthz"]]$status, 200L)
})

hold_lease <- function(f, holder = "someone-else") {
  f$client$call_api(
    "/apis/coordination.k8s.io/v1/namespaces/default/leases", "POST",
    body = list(apiVersion = "coordination.k8s.io/v1", kind = "Lease",
                metadata = list(name = "standby-test", namespace = "default"),
                spec = list(holderIdentity = holder, leaseDurationSeconds = 600L,
                            renewTime = format(Sys.time(), "%Y-%m-%dT%H:%M:%OS6Z",
                                               tz = "UTC"))))
}

test_that("run_as_leader() calls on_wait instead of sleeping while it waits", {
  skip_if_not_installed("callr")
  f <- local_fake_api()
  hold_lease(f)
  waits <- numeric()
  res <- tryCatch(
    run_as_leader(f$client, "standby-test", "default", "me",
                  on_started_leading = function(leader) stop("should not lead"),
                  lease_duration_seconds = 3, renew_deadline_seconds = 2,
                  retry_period_seconds = 1,
                  on_wait = function(s) {
                    waits <<- c(waits, s)
                    if (length(waits) >= 2) stop("enough")
                  }),
    error = function(e) conditionMessage(e))
  expect_equal(res, "enough")
  expect_length(waits, 2)
  expect_true(all(waits > 0 & waits <= 1.5))
})

test_that("a standby manager answers probes and still honours stop_seconds", {
  skip_if_not_installed("callr")
  f <- local_fake_api(pods = "a")
  hold_lease(f)
  port <- pick_free_port()
  log <- withr::local_tempfile()
  # Probe from another process while run() blocks this one.
  prober <- callr::r_bg(function(port, log) {
    for (i in 1:40) {
      Sys.sleep(0.1)
      st <- tryCatch(curl::curl_fetch_memory(
        sprintf("http://127.0.0.1:%d/readyz", port))$status_code,
        error = function(e) NA)
      cat(st, "\n", file = log, append = TRUE)
    }
  }, args = list(port = port, log = log))
  withr::defer(prober$kill())

  mgr <- Manager$new(kube(client = f$client, namespace = "default"))
  calls <- 0
  mgr$controller("pods", namespace = "default",
                 reconcile = function(req) { calls <<- calls + 1; NULL })
  t0 <- Sys.time()
  mgr$run(stop_seconds = 2.5, leader_election = "standby-test",
          lease_namespace = "default", identity = "me", health_port = port,
          lease_duration_seconds = 3, renew_deadline_seconds = 2,
          retry_period_seconds = 1)
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 5)
  expect_equal(calls, 0)                       # never became leader
  statuses <- trimws(readLines(log))
  expect_true("200" %in% statuses)             # answered while on standby
})
