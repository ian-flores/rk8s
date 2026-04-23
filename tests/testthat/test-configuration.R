test_that("Configuration stores fields and bearer_token() reads token_file", {
  cfg <- Configuration$new(host = "https://x:6443", api_key = list(authorization = "Bearer abc"))
  expect_equal(cfg$bearer_token(), "abc")

  tf <- tempfile()
  writeLines("  tok-from-file  ", tf)
  cfg2 <- Configuration$new(host = "https://x", token_file = tf)
  expect_equal(cfg2$bearer_token(), "tok-from-file")
})
