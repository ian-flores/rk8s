test_that("DynamicResource computes collection and item paths correctly", {
  ac <- ApiClient$new(Configuration$new(host = "https://x"))
  dc <- DynamicClient$new(ac)

  # Short-circuit discovery by seeding the cache directly.
  dc$.__enclos_env__$private$.discovery[["v1"]] <- list(resources = list(
    list(kind = "Pod", name = "pods", namespaced = TRUE, verbs = list("get","list"))
  ))
  dc$.__enclos_env__$private$.discovery[["apps/v1"]] <- list(resources = list(
    list(kind = "Deployment", name = "deployments", namespaced = TRUE)
  ))

  pods <- dc$resource("v1", "Pod")
  expect_equal(pods$.__enclos_env__$private$collection_path("kube-system"),
               "/api/v1/namespaces/kube-system/pods")
  expect_equal(pods$.__enclos_env__$private$item_path("x", "kube-system"),
               "/api/v1/namespaces/kube-system/pods/x")

  deps <- dc$resource("apps/v1", "Deployment")
  expect_equal(deps$.__enclos_env__$private$collection_path("default"),
               "/apis/apps/v1/namespaces/default/deployments")
})
