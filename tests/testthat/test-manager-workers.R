# Reconciles with workers > 1 run in other R processes, which load the
# installed rk8s; skip unless it has this feature.
skip_without_workers <- function() {
  skip_if_not_installed("mirai")
  skip_if_not_installed("callr")
  skip_if_not(callr::r(function() {
    requireNamespace("rk8s", quietly = TRUE) &&
      exists("worker_setup", envir = asNamespace("rk8s"))
  }), "installed rk8s lacks worker support (install the package first)")
}

# Reconciles append "key start end" lines here; workers can't touch the
# test's variables.
read_log <- function(path) {
  lines <- if (file.exists(path)) readLines(path, warn = FALSE) else character()
  # Skip a line a worker is still writing (it has fewer than 3 fields).
  parts <- Filter(function(p) length(p) == 3, strsplit(trimws(lines), " +"))
  if (!length(parts)) {
    return(data.frame(key = character(), start = numeric(), end = numeric()))
  }
  x <- data.frame(key = vapply(parts, `[`, "", 1),
                  start = as.numeric(vapply(parts, `[`, "", 2)),
                  end = as.numeric(vapply(parts, `[`, "", 3)))
  x[order(x$start), ]
}

# Define a function the way a top-level script would: enclosed by the
# global environment (functions created inside test_that() are not).
global_fn <- function(name, f) {
  environment(f) <- globalenv()
  assign(name, f, envir = globalenv())
}

run_until <- function(mgr, cond, budget = 15) {
  t0 <- Sys.time()
  while (!isTRUE(cond()) && Sys.time() - t0 < budget) mgr$step(0.05)
  isTRUE(cond())
}

test_that("bundle_function() carries global helpers into another process", {
  skip_if_not_installed("callr")
  withr::defer(rm(list = c(".rk8s_t_helper", ".rk8s_t_inner", ".rk8s_t_n"),
                  envir = globalenv()))
  assign(".rk8s_t_n", 10, envir = globalenv())
  global_fn(".rk8s_t_inner", function(x) x * .rk8s_t_n)
  global_fn(".rk8s_t_helper", function(x) .rk8s_t_inner(x) + 1)
  fn <- function(req) .rk8s_t_helper(req$n)
  environment(fn) <- globalenv()
  bundled <- bundle_function(fn)
  expect_equal(bundled(list(n = 2)), 21)
  # In a fresh process the globals don't exist, but the bundle has them.
  expect_equal(callr::r(function(f) f(list(n = 3)), args = list(f = bundled)), 31)
})

test_that("workers run reconciles in parallel", {
  skip_without_workers()
  f <- local_fake_api(pods = c("a", "b", "c"))
  log <- withr::local_tempfile()
  mgr <- Manager$new(kube(client = f$client, namespace = "default"))
  mgr$controller("pods", namespace = "default", workers = 3,
                 reconcile = function(req) {
                   t0 <- as.numeric(Sys.time()); Sys.sleep(1)
                   cat(req$key, t0, as.numeric(Sys.time()), "\n",
                       file = log, append = TRUE)
                   NULL
                 })
  mgr$start()
  withr::defer(mgr$close())
  expect_true(run_until(mgr, function() nrow(read_log(log)) >= 3))
  x <- read_log(log)
  expect_setequal(x$key, c("default/a", "default/b", "default/c"))
  # All three overlapped: the last one started before the first one ended.
  expect_lt(max(x$start), min(x$end))
  expect_equal(mgr$controllers()[[1]]$busy(), 0)
})

test_that("one object is never reconciled twice at once, and changes are not lost", {
  skip_without_workers()
  f <- local_fake_api(pods = "a")
  log <- withr::local_tempfile()
  mgr <- Manager$new(kube(client = f$client, namespace = "default"))
  mgr$controller("pods", namespace = "default", workers = 3,
                 reconcile = function(req) {
                   t0 <- as.numeric(Sys.time()); Sys.sleep(1)
                   cat(req$key, t0, as.numeric(Sys.time()), "\n",
                       file = log, append = TRUE)
                   NULL
                 })
  mgr$start()
  withr::defer(mgr$close())
  # Change "a" while its first reconcile is running.
  f$ctl(act("modify", "a", after = 0.3), act("modify", "a", after = 0.5))
  expect_true(run_until(mgr, function() nrow(read_log(log)) >= 2))
  for (i in 1:30) mgr$step(0.05)            # give a third run a chance
  x <- read_log(log)
  expect_equal(nrow(x), 2)                  # the two changes collapse into one rerun
  expect_gte(x$start[2], x$end[1])          # and it waited for the first
})

test_that("worker errors are logged and retried; requeue_after works", {
  skip_without_workers()
  f <- local_fake_api(pods = "a")
  state <- withr::local_tempfile()
  mgr <- Manager$new(kube(client = f$client, namespace = "default"))
  mgr$controller("pods", namespace = "default", workers = 2,
                 reconcile = function(req) {
                   n <- if (file.exists(state)) length(readLines(state)) else 0
                   cat("x\n", file = state, append = TRUE)
                   if (n == 0) stop("first attempt fails")
                   if (n == 1) return(requeue_after(0.5))
                   NULL
                 })
  mgr$start()
  withr::defer(mgr$close())
  msgs <- character()
  withCallingHandlers(
    ok <- run_until(mgr, function() file.exists(state) && length(readLines(state)) >= 3),
    message = function(m) {
      msgs <<- c(msgs, conditionMessage(m)); invokeRestart("muffleMessage")
    })
  expect_true(ok)
  expect_length(grep("default/a.*first attempt fails", msgs), 1)
  expect_equal(mgr$controllers()[[1]]$queue$num_requeues("default/a"), 0)
})

test_that("a reconcile defined in the global environment can use global helpers", {
  skip_without_workers()
  f <- local_fake_api(pods = "a")
  log <- withr::local_tempfile()
  withr::defer(rm(list = c(".rk8s_t_label", ".rk8s_t_log"), envir = globalenv()))
  assign(".rk8s_t_log", log, envir = globalenv())
  global_fn(".rk8s_t_label", function(req) paste0("seen-", req$name))
  # Unqualified rk8s calls (has_finalizer) need rk8s attached in the worker,
  # as library(rk8s) at the top of a script does in the manager's session.
  reconcile <- function(req, k) {
    cat(.rk8s_t_label(req), class(k)[1], has_finalizer(list(), "x"), "\n",
        file = .rk8s_t_log, append = TRUE)
    NULL
  }
  environment(reconcile) <- globalenv()
  mgr <- Manager$new(kube(client = f$client, namespace = "default"))
  mgr$controller("pods", namespace = "default", workers = 2, reconcile = reconcile)
  mgr$start()
  withr::defer(mgr$close())
  expect_true(run_until(mgr, function() file.exists(log) && length(readLines(log)) >= 1))
  expect_equal(trimws(readLines(log)[1]), "seen-a Kube FALSE")
})
