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

test_that("operator helpers work against a real API server", {
  k <- kube(namespace = "default")
  crd <- list(
    apiVersion = "apiextensions.k8s.io/v1", kind = "CustomResourceDefinition",
    metadata = list(name = "notes.rk8s.dev"),
    spec = list(
      group = "rk8s.dev", scope = "Namespaced",
      names = list(plural = "notes", singular = "note", kind = "Note"),
      versions = list(list(
        name = "v1", served = TRUE, storage = TRUE,
        subresources = list(status = structure(list(), names = character())),
        schema = list(openAPIV3Schema = list(
          type = "object", `x-kubernetes-preserve-unknown-fields` = TRUE))))))
  kube_apply(k, crd)
  withr::defer(try(kube_delete(k, "apiextensions.k8s.io/v1:CustomResourceDefinition",
                               "notes.rk8s.dev"), silent = TRUE))
  t0 <- Sys.time()
  repeat {
    ok <- tryCatch({ kube_list(k, "rk8s.dev/v1:Note"); TRUE }, error = function(e) FALSE)
    if (ok || Sys.time() - t0 > 30) break
    Sys.sleep(0.5)
  }
  k <- kube(namespace = "default")

  cleaned_up <- character()
  fin <- "rk8s.dev/cleanup"
  mgr <- Manager$new(k)
  mgr$controller(
    "rk8s.dev/v1:Note", namespace = "default", owns = "configmaps",
    reconcile = function(req, k) {
      note <- get_or_null(k, "rk8s.dev/v1:Note", req$name)
      if (is.null(note)) return(NULL)
      if (is_deleting(note)) {
        cleaned_up <<- c(cleaned_up, req$name)     # external cleanup goes here
        remove_finalizer(k, note, fin)
        return(NULL)
      }
      note <- add_finalizer(k, note, fin)
      cm <- set_owner(list(apiVersion = "v1", kind = "ConfigMap",
                           metadata = list(name = paste0("note-", req$name)),
                           data = list(text = note$spec$text)), note)
      kube_apply(k, cm, force = TRUE)
      if (!identical(note$status$configMap, cm$metadata$name)) {
        kube_patch_status(k, note, list(configMap = cm$metadata$name))
        kube_event(k, note, "Synced", paste("wrote ConfigMap", cm$metadata$name))
      }
      NULL
    })
  mgr$start()
  withr::defer(mgr$close())
  withr::defer({
    n <- get_or_null(k, "rk8s.dev/v1:Note", "n1")
    if (!is.null(n)) try(remove_finalizer(k, n, fin), silent = TRUE)
    try(kube_delete(k, "rk8s.dev/v1:Note", "n1"), silent = TRUE)
  })
  wait_for <- function(cond, budget = 20) {
    t0 <- Sys.time()
    while (Sys.time() - t0 < budget) {
      mgr$step(0.2)
      if (isTRUE(tryCatch(cond(), error = function(e) FALSE))) return(TRUE)
    }
    FALSE
  }

  kube_apply(k, list(apiVersion = "rk8s.dev/v1", kind = "Note",
                     metadata = list(name = "n1", namespace = "default"),
                     spec = list(text = "remember the milk")))
  expect_true(wait_for(function() {
    identical(get_or_null(k, "rk8s.dev/v1:Note", "n1")$status$configMap, "note-n1")
  }))
  note <- get_or_null(k, "rk8s.dev/v1:Note", "n1")
  expect_true(has_finalizer(note, fin))
  cm <- get_or_null(k, "configmap", "note-n1")
  expect_equal(cm$data$text, "remember the milk")
  expect_equal(cm$metadata$ownerReferences[[1]]$uid, note$metadata$uid)
  events <- kube_list(k, "events", field_selector = "involvedObject.name=n1")
  expect_true(any(vapply(events$items, function(e) identical(e$reason, "Synced"), TRUE)))

  # Deleting waits for the finalizer: the controller cleans up, removes it,
  # and then the Note and its ConfigMap go away.
  kube_delete(k, "rk8s.dev/v1:Note", "n1")
  expect_true(wait_for(function() is.null(get_or_null(k, "rk8s.dev/v1:Note", "n1"))))
  expect_equal(cleaned_up, "n1")
  expect_true(wait_for(function() is.null(get_or_null(k, "configmap", "note-n1")),
                       budget = 30))
})

test_that("workers reconcile in parallel against a real API server", {
  skip_if_not_installed("mirai")
  k <- kube(namespace = "default")
  names <- paste0("rk8s-it-w", 1:3)
  withr::defer(for (n in c(names, paste0(names, "-copy"))) {
    try(kube_delete(k, "configmap", n), silent = TRUE)
  })
  for (n in names) {
    kube_apply(k, list(apiVersion = "v1", kind = "ConfigMap",
                       metadata = list(name = n, labels = list(`rk8s-it` = "workers")),
                       data = list(v = n)))
  }
  mgr <- Manager$new(k)
  mgr$controller(
    "configmaps", namespace = "default", label_selector = "rk8s-it=workers",
    workers = 3,
    reconcile = function(req, k) {
      Sys.sleep(1)       # pretend to be slow
      src <- kube_get(k, "configmap", req$name, namespace = req$namespace)
      kube_apply(k, list(apiVersion = "v1", kind = "ConfigMap",
                         metadata = list(name = paste0(req$name, "-copy"),
                                         namespace = req$namespace),
                         data = src$data))
      NULL
    })
  t0 <- Sys.time()
  mgr$start()
  withr::defer(mgr$close())
  copies <- function() vapply(names, function(n) {
    !is.null(tryCatch(kube_get(k, "configmap", paste0(n, "-copy")),
                      rk8s_api_error = function(e) NULL))
  }, TRUE)
  while (!all(copies()) && Sys.time() - t0 < 30) mgr$step(0.1)
  expect_true(all(copies()))
  # Sequential would take 3s of sleeping alone; in parallel well under that
  # (start-up of the worker processes included).
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 2.9)
})
