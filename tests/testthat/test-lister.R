test_that("Lister filters by namespace and returns NULL on miss", {
  store <- new.env(parent = emptyenv())
  assign("default/nginx", list(metadata = list(name = "nginx", namespace = "default")), envir = store)
  assign("default/redis", list(metadata = list(name = "redis", namespace = "default")), envir = store)
  assign("kube-system/coredns",
         list(metadata = list(name = "coredns", namespace = "kube-system")), envir = store)

  l <- Lister$new(store)
  expect_length(l$list(), 3)
  expect_length(l$namespace("default"), 2)
  expect_equal(l$get("nginx", namespace = "default")$metadata$name, "nginx")
  expect_null(l$get("missing", namespace = "default"))
})
