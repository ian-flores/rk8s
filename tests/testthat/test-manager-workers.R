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

# Each reconcile writes one "key start end" record to its own file in a
# log directory: workers can't touch the test's variables, and several
# workers appending to one file interleave their writes.
log_run <- function(dir, key, start) {
  writeLines(paste(key, start, as.numeric(Sys.time())),
             tempfile(tmpdir = dir, fileext = ".log"))
}
environment(log_run) <- baseenv()

read_log <- function(dir) {
  files <- list.files(dir, pattern = "[.]log$", full.names = TRUE)
  parts <- lapply(files, function(f) strsplit(readLines(f, warn = FALSE)[1], " ")[[1]])
  parts <- Filter(function(p) length(p) == 3, parts)
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
  log <- withr::local_tempdir()
  mgr <- Manager$new(kube(client = f$client, namespace = "default"))
  mgr$controller("pods", namespace = "default", workers = 3,
                 reconcile = function(req) {
                   t0 <- as.numeric(Sys.time()); Sys.sleep(1)
                   log_run(log, req$key, t0)
                   NULL
                 })
  mgr$start()
  withr::defer(mgr$close())
  expect_true(run_until(mgr, function() nrow(read_log(log)) >= 3, budget = 30))
  x <- read_log(log)
  expect_setequal(x$key, c("default/a", "default/b", "default/c"))
  # All three overlapped: the last one started before the first one ended.
  expect_lt(max(x$start), min(x$end))
  expect_equal(mgr$controllers()[[1]]$busy(), 0)
})

test_that("one object is never reconciled twice at once, and changes are not lost", {
  skip_without_workers()
  f <- local_fake_api(pods = "a")
  log <- withr::local_tempdir()
  mgr <- Manager$new(kube(client = f$client, namespace = "default"))
  mgr$controller("pods", namespace = "default", workers = 3,
                 reconcile = function(req) {
                   t0 <- as.numeric(Sys.time()); Sys.sleep(1)
                   log_run(log, req$key, t0)
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

test_that("start() waits for workers and reports a broken worker setup", {
  skip_without_workers()
  f <- local_fake_api(pods = "a")
  mgr <- Manager$new(kube(client = f$client, namespace = "default"))
  ctl <- mgr$controller("pods", namespace = "default", workers = 2,
                        reconcile = function(req) NULL)
  # Send the workers settings they cannot use: building the session fails
  # inside each worker ("unused argument"), which start() must report.
  local_mocked_bindings(config_to_list = function(cfg) list(not_a_setting = TRUE))
  expect_error(mgr$start(), "could not start reconcile workers.*unused argument")
  mgr$close()
  expect_equal(ctl$busy(), 0)
})

