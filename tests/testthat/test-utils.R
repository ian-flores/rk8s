test_that("parse_quantity handles SI, binary, and plain suffixes", {
  expect_equal(parse_quantity("100m"), 0.1)
  expect_equal(parse_quantity("2"), 2)
  expect_equal(parse_quantity("256Mi"), 256 * 2^20)
  expect_equal(parse_quantity("1.5Gi"), 1.5 * 2^30)
  expect_equal(parse_quantity("500k"), 500e3)
  expect_error(parse_quantity("10Q"), "Unknown quantity suffix")
})

test_that("drop_nulls_deep removes NULLs recursively but preserves structure", {
  x <- list(a = 1, b = NULL, c = list(d = NULL, e = 2, f = list(g = NULL, h = 3)))
  expect_equal(rk8s:::drop_nulls_deep(x),
               list(a = 1, c = list(e = 2, f = list(h = 3))))
})
