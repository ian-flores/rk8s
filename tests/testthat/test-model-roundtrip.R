test_that("V1Pod round-trips through JSON with no lossy fields", {
  p <- V1Pod$new(
    api_version = "v1", kind = "Pod",
    metadata = V1ObjectMeta$new(name = "demo", namespace = "default",
                                 labels = list(app = "demo")),
    spec = V1PodSpec$new(
      containers = list(V1Container$new(name = "c", image = "nginx",
                                         command = list("nginx")))
    )
  )
  j <- jsonlite::toJSON(p$to_list(), auto_unbox = TRUE)
  p2 <- V1Pod$from_list(jsonlite::fromJSON(as.character(j), simplifyVector = FALSE))
  expect_identical(p$to_list(), p2$to_list())
  expect_identical(p2$metadata$name, "demo")
  expect_identical(p2$spec$containers[[1]]$image, "nginx")
})

test_that("Scalar wrappers (IntOrString, Quantity) serialize as bare values", {
  ru <- V1RollingUpdateDeployment$new(
    max_surge = IntOrString$new(value = "25%"),
    max_unavailable = IntOrString$new(value = 0L)
  )
  j <- as.character(jsonlite::toJSON(ru$to_list(), auto_unbox = TRUE))
  expect_equal(j, '{"maxSurge":"25%","maxUnavailable":0}')
})

test_that("JSON-schema $ref mangling preserves the wire key", {
  x <- V1JSONSchemaProps$new(`_ref` = "#/defs/Foo")
  j <- as.character(jsonlite::toJSON(x$to_list(), auto_unbox = TRUE))
  expect_equal(j, '{"$ref":"#/defs/Foo"}')
  x2 <- V1JSONSchemaProps$from_list(jsonlite::fromJSON(j, simplifyVector = FALSE))
  expect_identical(x2$`_ref`, "#/defs/Foo")
})

test_that("NULL fields are dropped from the serialized output", {
  p <- V1Pod$new(kind = "Pod")  # no metadata, spec, status, apiVersion
  j <- as.character(jsonlite::toJSON(p$to_list(), auto_unbox = TRUE))
  expect_equal(j, '{"kind":"Pod"}')
})
