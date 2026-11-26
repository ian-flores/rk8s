# An end-to-end controller against a real API server: a Greeting custom
# resource, reconciled into a ConfigMap it owns.

greeting_crd <- list(
  apiVersion = "apiextensions.k8s.io/v1", kind = "CustomResourceDefinition",
  metadata = list(name = "greetings.rk8s.dev"),
  spec = list(
    group = "rk8s.dev", scope = "Namespaced",
    names = list(plural = "greetings", singular = "greeting", kind = "Greeting"),
    versions = list(list(
      name = "v1", served = TRUE, storage = TRUE,
      schema = list(openAPIV3Schema = list(
        type = "object",
        properties = list(spec = list(
          type = "object",
          properties = list(message = list(type = "string"))))))))))

greeting <- function(name, message) {
  list(apiVersion = "rk8s.dev/v1", kind = "Greeting",
       metadata = list(name = name, namespace = "default"),
       spec = list(message = message))
}

get_or_null <- function(k, ref, name) {
  tryCatch(kube_get(k, ref, name, namespace = "default"),
           rk8s_api_error = function(e) NULL)
}

test_that("a Manager reconciles a custom resource into an owned ConfigMap", {
  k <- kube(namespace = "default")
  kube_apply(k, greeting_crd)
  withr::defer(try(kube_delete(k, "apiextensions.k8s.io/v1:CustomResourceDefinition",
                               "greetings.rk8s.dev"), silent = TRUE))
  # Wait for the CRD to be served.
  t0 <- Sys.time()
  repeat {
    ok <- tryCatch({ kube_list(k, "rk8s.dev/v1:Greeting"); TRUE },
                   error = function(e) FALSE)
    if (ok || Sys.time() - t0 > 30) break
    Sys.sleep(0.5)
  }
  k <- kube(namespace = "default")   # fresh discovery cache

  reconciles <- 0
  mgr <- Manager$new(k)
  mgr$controller(
    "rk8s.dev/v1:Greeting", namespace = "default", owns = "configmaps",
    reconcile = function(req, k) {
      reconciles <<- reconciles + 1
      g <- get_or_null(k, "rk8s.dev/v1:Greeting", req$name)
      if (is.null(g)) return(NULL)
      kube_apply(k, list(
        apiVersion = "v1", kind = "ConfigMap",
        metadata = list(
          name = paste0("greeting-", req$name), namespace = req$namespace,
          ownerReferences = list(list(
            apiVersion = "rk8s.dev/v1", kind = "Greeting",
            name = g$metadata$name, uid = g$metadata$uid,
            controller = TRUE, blockOwnerDeletion = TRUE))),
        data = list(message = g$spec$message)), force = TRUE)
      NULL
    })
  mgr$start()
  withr::defer(mgr$close())
  withr::defer(try(kube_delete(k, "rk8s.dev/v1:Greeting", "hello"), silent = TRUE))

  wait_for <- function(cond, budget = 15) {
    t0 <- Sys.time()
    while (Sys.time() - t0 < budget) {
      mgr$step(0.2)
      if (isTRUE(tryCatch(cond(), error = function(e) FALSE))) return(TRUE)
    }
    FALSE
  }
  message_of <- function() get_or_null(k, "configmap", "greeting-hello")$data$message

  kube_apply(k, greeting("hello", "hi"))
  expect_true(wait_for(function() identical(message_of(), "hi")))

  kube_apply(k, greeting("hello", "good morning"))
  expect_true(wait_for(function() identical(message_of(), "good morning")))

  # A manual edit to the owned ConfigMap is put back.
  kube_apply(k, list(apiVersion = "v1", kind = "ConfigMap",
                     metadata = list(name = "greeting-hello", namespace = "default"),
                     data = list(message = "tampered")),
             field_manager = "someone-else", force = TRUE)
  expect_true(wait_for(function() identical(message_of(), "good morning")))

  # Deleting the Greeting garbage-collects the ConfigMap via its owner ref.
  kube_delete(k, "rk8s.dev/v1:Greeting", "hello")
  expect_true(wait_for(function() is.null(get_or_null(k, "configmap", "greeting-hello")),
                       budget = 30))
  expect_gt(reconciles, 3)
})
