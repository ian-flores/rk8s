lease_base <- "/apis/coordination.k8s.io/v1/namespaces/default/leases"
lease_item <- paste0(lease_base, "/ctl")

acquire <- function(f, identity, duration = 6) {
  rk8s:::try_acquire(f$client, lease_base, lease_item, "ctl", "default",
                     identity, duration)
}

# run_as_leader's renewer runs in a callr child that loads the *installed*
# rk8s, so these tests need an installed copy that has the new renewer.
skip_without_installed_renewer <- function() {
  skip_if_not_installed("callr")
  ok <- getOption("rk8s.test.installed_renewer")
  if (is.null(ok)) {
    ok <- tryCatch(callr::r(function() {
      requireNamespace("rk8s", quietly = TRUE) &&
        exists("leader_renew_loop", envir = asNamespace("rk8s"))
    }), error = function(e) FALSE)
    options(rk8s.test.installed_renewer = ok)
  }
  skip_if_not(ok, "installed rk8s lacks leader_renew_loop (install the package first)")
}

test_that("try_acquire creates, keeps, refuses and takes over leases", {
  f <- local_fake_api()
  expect_equal(acquire(f, "me")$holder, "me")          # create
  expect_equal(acquire(f, "me")$holder, "me")          # renew own (PUT, no 422)
  expect_equal(acquire(f, "other")$holder, "me")       # fresh: refused
  expect_equal(f$state()$lease_puts, 1L)

  # Held by someone whose last renewal is older than the lease duration (6s):
  # expired, so it is taken over.
  f$ctl(act("steal_lease", identity = "ghost", age = 60))
  expect_equal(acquire(f, "other")$holder, "other")
  expect_equal(f$state()$lease$spec$leaseTransitions, 1L)
})

test_that("a released lease (no holder) is taken over immediately", {
  f <- local_fake_api()
  acquire(f, "me")
  rk8s:::release_lease(f$client, lease_item, "me")
  expect_null(f$state()$lease$spec$holderIdentity)
  expect_equal(acquire(f, "other")$holder, "other")
})

test_that("release_lease does not touch a lease held by someone else", {
  f <- local_fake_api()
  acquire(f, "other")
  expect_false(rk8s:::release_lease(f$client, lease_item, "me"))
  expect_equal(f$state()$lease$spec$holderIdentity, "other")
})

test_that("renew loop renews, then reports 'stolen' when the lease is taken", {
  f <- local_fake_api()
  acquire(f, "me")
  f$ctl(act("steal_lease", identity = "other", after = 1.5))
  stamp <- tempfile()
  t0 <- Sys.time()
  res <- rk8s:::leader_renew_loop(rk8s:::config_to_list(f$client$configuration),
                                  lease_item, "me", renew_deadline = 3,
                                  retry_period = 0.3, status_file = stamp)
  expect_equal(res$reason, "stolen")
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 3)
  expect_gte(f$state()$lease_puts, 2L)
  expect_false(is.na(rk8s:::read_renew_stamp(stamp)))
})

test_that("renew loop gives up with 'deadline' when renewals keep failing", {
  f <- local_fake_api()
  t0 <- Sys.time()
  res <- rk8s:::leader_renew_loop(rk8s:::config_to_list(f$client$configuration),
                                  paste0(lease_base, "/missing"), "me",
                                  renew_deadline = 1, retry_period = 0.3,
                                  status_file = tempfile())
  expect_equal(res$reason, "deadline")
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 3)
})

test_that("config_to_list carries every auth mechanism to the child", {
  cfg <- Configuration$new(host = "https://h", cert_file = "/c.crt",
                           key_file = "/c.key", ssl_ca_cert = "/ca.crt",
                           token_file = "/tok", verify_ssl = FALSE,
                           exec = list(command = "aws", args = list("eks")),
                           proxy = "http://proxy:3128", timeout = 7)
  back <- rk8s:::config_from_list(rk8s:::config_to_list(cfg))
  for (f in c("host", "cert_file", "key_file", "ssl_ca_cert", "token_file",
              "verify_ssl", "exec", "proxy", "timeout")) {
    expect_identical(back[[f]], cfg[[f]], info = f)
  }
})

test_that("leader handle reports loss once the renew stamp goes stale", {
  stamp <- tempfile()
  rk8s:::write_renew_stamp(stamp)
  fake_proc <- list(is_alive = function() TRUE)
  h <- rk8s:::new_leader_handle("me", fake_proc, stamp, renew_deadline = 0.5)
  expect_true(h$is_leader())
  expect_invisible(h$check())
  Sys.sleep(0.8)
  expect_false(h$is_leader())
  expect_error(h$check(), class = "rk8s_leadership_lost")
  expect_equal(h$reason(), "deadline")
})

test_that("leader handle reports loss when the renewer exits", {
  stamp <- tempfile()
  rk8s:::write_renew_stamp(stamp)
  fake_proc <- list(is_alive = function() FALSE,
                    get_result = function() list(reason = "stolen"))
  h <- rk8s:::new_leader_handle("me", fake_proc, stamp, renew_deadline = 10)
  expect_error(h$check(), "stolen", class = "rk8s_leadership_lost")
})

test_that("run_as_leader validates timing parameters", {
  expect_error(run_as_leader(NULL, "l", "default", "me", function() NULL,
                             lease_duration_seconds = 5,
                             renew_deadline_seconds = 10),
               "lease_duration_seconds > renew_deadline_seconds")
})

# ---- end-to-end through the callr renewer ------------------------------------

test_that("run_as_leader unwinds the callback when leadership is stolen", {
  skip_without_installed_renewer()
  f <- local_fake_api()
  events <- character()
  f$ctl(act("steal_lease", identity = "other", after = 4))
  t0 <- Sys.time()
  run_as_leader(
    f$client, "ctl", "default", "me",
    on_started_leading = function(leader) {
      events <<- c(events, "started")
      repeat { leader$check(); Sys.sleep(0.1) }
    },
    on_stopped_leading = function() events <<- c(events, "stopped"),
    lease_duration_seconds = 8, renew_deadline_seconds = 6,
    retry_period_seconds = 0.5
  )
  elapsed <- as.numeric(difftime(Sys.time(), t0, units = "secs"))
  expect_equal(events, c("started", "stopped"))
  expect_lt(elapsed, 8)
  expect_gte(f$state()$lease_puts, 2L)                # renewer actually renewed
  expect_equal(f$state()$lease$spec$holderIdentity, "other")  # not clobbered
})

test_that("run_as_leader releases the lease when the callback returns", {
  skip_without_installed_renewer()
  f <- local_fake_api()
  run_as_leader(f$client, "ctl", "default", "me",
                on_started_leading = function(leader) Sys.sleep(1.5),
                lease_duration_seconds = 8, renew_deadline_seconds = 6,
                retry_period_seconds = 0.5)
  expect_null(f$state()$lease$spec$holderIdentity)
})

test_that("run_as_leader re-raises callback errors after cleanup", {
  skip_without_installed_renewer()
  f <- local_fake_api()
  stopped <- FALSE
  expect_error(
    run_as_leader(f$client, "ctl", "default", "me",
                  on_started_leading = function(leader) stop("boom"),
                  on_stopped_leading = function() stopped <<- TRUE,
                  lease_duration_seconds = 8, renew_deadline_seconds = 6,
                  retry_period_seconds = 0.5),
    "boom")
  expect_true(stopped)
  expect_null(f$state()$lease$spec$holderIdentity)
})
