greeting <- function(...) {
  list(apiVersion = "rk8s.dev/v1", kind = "Greeting",
       metadata = utils::modifyList(
         list(name = "hello", namespace = "web", uid = "uid-1",
              resourceVersion = "42"), list(...)))
}

# A server that answers discovery for rk8s.dev/v1 and records every other
# request (method, path, content type, raw body), echoing the body back.
recording_app <- function() {
  app <- webfakes::new_app()
  app$locals$log <- list()
  app$get("/apis/rk8s.dev/v1", function(req, res) {
    res$send_json(list(kind = "APIResourceList", groupVersion = "rk8s.dev/v1",
                       resources = list(list(name = "greetings", namespaced = TRUE,
                                             kind = "Greeting"))),
                  auto_unbox = TRUE)
  })
  app$get("/log", function(req, res) {
    res$send_json(req$app$locals$log, auto_unbox = TRUE, null = "null")
  })
  record <- function(req, res) {
    body <- rawToChar(req$.body %||% raw(0))
    req$app$locals$log[[length(req$app$locals$log) + 1]] <- list(
      method = toupper(req$method), path = req$path,
      type = req$get_header("Content-Type") %||% "", body = body)
    res$set_type("application/json")$send(if (nzchar(body)) body else "{}")
  }
  app$patch(webfakes::new_regexp("^/(api|apis)/.*"), record)
  app$post(webfakes::new_regexp("^/(api|apis)/.*"), record)
  app
}
# The app runs in another process; keep its closures free of the test env.
environment(recording_app) <- list2env(
  list(`%||%` = function(x, y) if (is.null(x)) y else x), parent = baseenv())

recording_api <- function(.env = parent.frame()) {
  skip_if_not_installed("webfakes")
  web <- webfakes::local_app_process(recording_app(), .local_envir = .env)
  base <- sub("/$", "", web$url())
  k <- kube(client = ApiClient$new(Configuration$new(host = base)),
            namespace = "default")
  list(k = k, log = function() {
    out <- httr2::resp_body_json(httr2::req_perform(
      httr2::request(paste0(base, "/log"))))
    lapply(out, function(e) {
      e$body <- if (nzchar(e$body)) jsonlite::fromJSON(e$body, simplifyVector = FALSE)
      e
    })
  })
}

# ---- pure helpers ------------------------------------------------------------

test_that("set_owner() adds a controller owner reference and the namespace", {
  cm <- list(apiVersion = "v1", kind = "ConfigMap",
             metadata = list(name = "greeting-hello"))
  out <- set_owner(cm, greeting())
  ref <- out$metadata$ownerReferences[[1]]
  expect_equal(ref, list(apiVersion = "rk8s.dev/v1", kind = "Greeting",
                         name = "hello", uid = "uid-1", controller = TRUE,
                         blockOwnerDeletion = TRUE))
  expect_equal(out$metadata$namespace, "web")

  # Re-applying is idempotent, and other (non-controller) owners are kept.
  other <- list(apiVersion = "v1", kind = "Pod", name = "p", uid = "uid-p")
  cm$metadata$ownerReferences <- list(other)
  twice <- set_owner(set_owner(cm, greeting()), greeting())
  expect_length(twice$metadata$ownerReferences, 2)

  # Only one controller owner allowed; a manifest without a uid is refused.
  expect_error(set_owner(set_owner(cm, greeting()), greeting(uid = "uid-2", name = "x")),
               "different controller owner")
  expect_error(set_owner(cm, greeting(uid = NULL)), "no metadata\\$uid")
})

test_that("has_finalizer() and is_deleting() read metadata", {
  g <- greeting(finalizers = list("rk8s.dev/cleanup"))
  expect_true(has_finalizer(g, "rk8s.dev/cleanup"))
  expect_false(has_finalizer(g, "other"))
  expect_false(has_finalizer(greeting(), "rk8s.dev/cleanup"))
  expect_false(is_deleting(g))
  expect_true(is_deleting(greeting(deletionTimestamp = "2026-01-01T00:00:00Z")))
})

# ---- helpers that call the API --------------------------------------------

test_that("kube_patch_status() merge-patches the /status subresource", {
  api <- recording_api()
  kube_patch_status(api$k, greeting(), list(ready = TRUE, replicas = 2L))
  e <- api$log()[[1]]
  expect_equal(e$method, "PATCH")
  expect_equal(e$path, "/apis/rk8s.dev/v1/namespaces/web/greetings/hello/status")
  expect_equal(e$type, "application/merge-patch+json")
  expect_equal(e$body, list(status = list(ready = TRUE, replicas = 2L)))
})

test_that("add_finalizer()/remove_finalizer() patch the list with the resourceVersion", {
  api <- recording_api()
  add_finalizer(api$k, greeting(finalizers = list("a")), "rk8s.dev/cleanup")
  remove_finalizer(api$k, greeting(finalizers = list("rk8s.dev/cleanup")),
                   "rk8s.dev/cleanup")
  # No-ops send nothing.
  add_finalizer(api$k, greeting(finalizers = list("x")), "x")
  remove_finalizer(api$k, greeting(), "x")

  log <- api$log()
  expect_length(log, 2)
  expect_equal(log[[1]]$path, "/apis/rk8s.dev/v1/namespaces/web/greetings/hello")
  expect_equal(log[[1]]$type, "application/merge-patch+json")
  expect_equal(log[[1]]$body$metadata,
               list(finalizers = list("a", "rk8s.dev/cleanup"), resourceVersion = "42"))
  # Removing the last finalizer sends an empty list, not a missing field.
  expect_equal(log[[2]]$body$metadata, list(finalizers = list(), resourceVersion = "42"))
})

test_that("kube_event() creates an Event about the object", {
  api <- recording_api()
  kube_event(api$k, greeting(), "Created", "made a ConfigMap", type = "Normal")
  e <- api$log()[[1]]
  expect_equal(e$method, "POST")
  expect_equal(e$path, "/api/v1/namespaces/web/events")
  ev <- e$body
  expect_equal(ev$kind, "Event")
  expect_equal(ev$metadata$generateName, "hello.")
  expect_equal(ev$involvedObject[c("apiVersion", "kind", "name", "namespace", "uid")],
               list(apiVersion = "rk8s.dev/v1", kind = "Greeting", name = "hello",
                    namespace = "web", uid = "uid-1"))
  expect_equal(ev[c("reason", "message", "type")],
               list(reason = "Created", message = "made a ConfigMap", type = "Normal"))
  expect_error(kube_event(api$k, greeting(), "X", "y", type = "Bad"))
})
