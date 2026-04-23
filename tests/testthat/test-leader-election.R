test_that("is_expired returns TRUE for stale renewTime and FALSE for fresh", {
  now <- Sys.time()
  fresh <- strftime(now, "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
  stale <- strftime(now - 60, "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
  expect_false(rk8s:::is_expired(fresh, 15))
  expect_true(rk8s:::is_expired(stale, 15))
  expect_true(rk8s:::is_expired(NULL, 15))
  expect_true(rk8s:::is_expired(fresh, NULL))
})
