# Drive a manager with step() until `cond()` is true or `budget` seconds pass.
step_until <- function(mgr, cond, budget = 5) {
  t0 <- Sys.time()
  while (!cond() && Sys.time() - t0 < budget) mgr$step(0.1)
  cond()
}

fake_manager <- function(f) Manager$new(kube(client = f$client, namespace = "default"))

test_that("owner_keys() maps controller ownerReferences to owner keys", {
  pod <- function(refs, ns = "default") {
    list(metadata = list(name = "child", namespace = ns, ownerReferences = refs))
  }
  ref <- function(kind, name, api = "example.com/v1", controller = TRUE) {
    list(apiVersion = api, kind = kind, name = name, controller = controller)
  }
  expect_equal(owner_keys(pod(list(ref("Site", "s1"))), "example.com/v1", "Site"),
               "default/s1")
  # other kinds, other groups and non-controller owners are ignored
  expect_length(owner_keys(pod(list(ref("Other", "x"))), "example.com/v1", "Site"), 0)
  expect_length(owner_keys(pod(list(ref("Site", "x", api = "other.io/v1"))),
                           "example.com/v1", "Site"), 0)
  expect_length(owner_keys(pod(list(ref("Site", "x", controller = FALSE))),
                           "example.com/v1", "Site"), 0)
  # a different version of the same group still matches
  expect_equal(owner_keys(pod(list(ref("Site", "s2", api = "example.com/v2"))),
                          "example.com/v1", "Site"), "default/s2")
  # cluster-scoped child
  expect_equal(owner_keys(pod(list(ref("Site", "s3")), ns = NULL),
                          "example.com/v1", "Site"), "s3")
  expect_length(owner_keys(list(metadata = list(name = "x")), "v1", "Pod"), 0)
})

test_that("reconcile runs for existing objects, then once per change", {
  f <- local_fake_api(pods = c("a", "b"))
  mgr <- fake_manager(f)
  calls <- character()
  mgr$controller("pods", namespace = "default", reconcile = function(req) {
    calls <<- c(calls, req$key)
    NULL
  })
  mgr$start()
  withr::defer(mgr$close())
  expect_true(step_until(mgr, function() length(calls) >= 2))
  expect_setequal(calls, c("default/a", "default/b"))

  # Several changes to one object before the loop runs -> one reconcile.
  f$ctl(act("modify", "a"), act("modify", "a"), act("modify", "a"))
  Sys.sleep(0.5)
  expect_true(step_until(mgr, function() length(calls) >= 3))
  for (i in 1:5) mgr$step(0.1)
  expect_equal(calls[3:length(calls)], "default/a")

  f$ctl(act("delete", "b"))
  expect_true(step_until(mgr, function() length(calls) >= 4))
  expect_equal(calls[4], "default/b")
})

test_that("reconcile gets the request and, if it asks, the session", {
  f <- local_fake_api(pods = "a")
  mgr <- fake_manager(f)
  got <- NULL
  mgr$controller("pods", namespace = "default", reconcile = function(req, k) {
    got <<- list(req = req, k = k)
    NULL
  })
  mgr$start()
  withr::defer(mgr$close())
  expect_true(step_until(mgr, function() !is.null(got)))
  expect_equal(got$req$key, "default/a")
  expect_equal(got$req$namespace, "default")
  expect_equal(got$req$name, "a")
  expect_s3_class(got$k, "Kube")
})

test_that("requeue_after() reconciles again after the delay", {
  f <- local_fake_api(pods = "a")
  mgr <- fake_manager(f)
  times <- numeric()
  mgr$controller("pods", namespace = "default", reconcile = function(req) {
    times <<- c(times, as.numeric(Sys.time()))
    if (length(times) == 1) requeue_after(0.6) else NULL
  })
  mgr$start()
  withr::defer(mgr$close())
  expect_true(step_until(mgr, function() length(times) >= 2))
  expect_gte(diff(times)[1], 0.55)
  expect_lt(diff(times)[1], 1.5)
  for (i in 1:10) mgr$step(0.1)
  expect_length(times, 2)
})

test_that("errors are logged and retried with backoff until they succeed", {
  f <- local_fake_api(pods = "a")
  mgr <- fake_manager(f)
  n <- 0
  mgr$controller("pods", namespace = "default", reconcile = function(req) {
    n <<- n + 1
    if (n < 3) stop("not yet") else NULL
  })
  mgr$start()
  withr::defer(mgr$close())
  msgs <- character()
  withCallingHandlers(
    step_until(mgr, function() n >= 3),
    message = function(m) {
      msgs <<- c(msgs, conditionMessage(m)); invokeRestart("muffleMessage")
    })
  expect_equal(n, 3)
  expect_length(grep("default/a.*not yet", msgs), 2)
  ctl <- mgr$controllers()[[1]]
  expect_equal(ctl$queue$num_requeues("default/a"), 0)   # forgotten on success
})

test_that("requeue() retries with backoff", {
  f <- local_fake_api(pods = "a")
  mgr <- fake_manager(f)
  n <- 0
  mgr$controller("pods", namespace = "default", reconcile = function(req) {
    n <<- n + 1
    if (n < 3) requeue() else NULL
  })
  mgr$start()
  withr::defer(mgr$close())
  expect_true(step_until(mgr, function() n >= 3))
})

test_that("changes to owned objects reconcile their owner", {
  f <- local_fake_api(pods = "parent")
  f$ctl(act("add", "child", owner = "parent"))
  mgr <- fake_manager(f)
  calls <- character()
  # Pods owning pods keeps the fake simple; the mapping is the same for any
  # pair of kinds.
  mgr$controller("pods", namespace = "default", owns = "pods",
                 reconcile = function(req) { calls <<- c(calls, req$key); NULL })
  mgr$start()
  withr::defer(mgr$close())
  step_until(mgr, function() length(calls) >= 2)
  for (i in 1:5) mgr$step(0.1)
  calls <- character()

  f$ctl(act("modify", "child"))
  # The child is itself a primary object, so both are reconciled. The two
  # informers have separate connections, so either can be seen first.
  expect_true(step_until(mgr, function() all(c("default/parent", "default/child") %in% calls)))
})

test_that("resync_seconds requeues every object periodically", {
  f <- local_fake_api(pods = c("a", "b"))
  mgr <- fake_manager(f)
  calls <- character()
  mgr$controller("pods", namespace = "default", resync_seconds = 0.5,
                 reconcile = function(req) { calls <<- c(calls, req$key); NULL })
  mgr$start()
  withr::defer(mgr$close())
  expect_true(step_until(mgr, function() length(calls) >= 4, budget = 4))
  expect_setequal(unique(calls), c("default/a", "default/b"))
})

test_that("run(stop_seconds) runs controllers and returns on time", {
  f <- local_fake_api(pods = "a")
  mgr <- fake_manager(f)
  calls <- 0
  mgr$controller("pods", namespace = "default",
                 reconcile = function(req) { calls <<- calls + 1; NULL })
  f$ctl(act("modify", "a", after = 0.8))
  t0 <- Sys.time()
  mgr$run(stop_seconds = 2)
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 4)
  expect_equal(calls, 2)
})

test_that("stop() from inside reconcile ends run()", {
  f <- local_fake_api(pods = "a")
  mgr <- fake_manager(f)
  mgr$controller("pods", namespace = "default",
                 reconcile = function(req) { mgr$stop(); NULL })
  t0 <- Sys.time()
  mgr$run(stop_seconds = 10)
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 3)
})

test_that("run(leader_election =) reconciles only while holding the lease", {
  skip_if_not_installed("callr")
  skip_if_not(callr::r(function() {
    requireNamespace("rk8s", quietly = TRUE) &&
      exists("leader_renew_loop", envir = asNamespace("rk8s"))
  }), "installed rk8s lacks leader_renew_loop (install the package first)")
  f <- local_fake_api(pods = "a")
  mgr <- fake_manager(f)
  calls <- 0
  mgr$controller("pods", namespace = "default",
                 reconcile = function(req) { calls <<- calls + 1; NULL })
  mgr$run(stop_seconds = 2, leader_election = "mgr-test",
          lease_namespace = "default", identity = "me",
          lease_duration_seconds = 4, renew_deadline_seconds = 3,
          retry_period_seconds = 1)
  expect_equal(calls, 1)
  st <- f$state()
  expect_null(st$lease$spec$holderIdentity)       # released on exit
})
