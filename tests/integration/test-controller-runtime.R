# Controller-runtime pieces against a real API server: watch latency,
# timeouts on quiet resources, informer cache, and leader election with
# real Lease objects (incl. managedFields handling on PUT).

cm_body <- function(name, value) list(
  apiVersion = "v1", kind = "ConfigMap",
  metadata = list(name = name, namespace = "default",
                  labels = list(`rk8s-it` = "runtime")),
  data = list(v = value)
)

test_that("watch delivers a change promptly and timeout_seconds ends a quiet watch", {
  k <- kube(namespace = "default")
  withr::defer(try(kube_delete(k, "configmap/rk8s-it-latency"), silent = TRUE))
  kube_apply(k, cm_body("rk8s-it-latency", "1"))
  rv <- kube_get(k, "configmap/rk8s-it-latency")$metadata$resourceVersion

  # Change it from a child process 2s from now; the watch below has a 60s
  # budget, so only prompt delivery makes this finish quickly.
  bg <- callr::r_bg(function(cfg_path) {
    Sys.sleep(2)
    k <- rk8s::kube(config_file = cfg_path, namespace = "default")
    rk8s::kube_apply(k, list(apiVersion = "v1", kind = "ConfigMap",
                             metadata = list(name = "rk8s-it-latency"),
                             data = list(v = "2")))
  }, args = list(cfg_path = rk8s:::resolve_kubeconfig_paths(NULL)[1]))
  withr::defer(bg$kill())

  t0 <- Sys.time()
  got <- NULL
  kube_watch(k, "configmaps", resource_version = rv, timeout_seconds = 60,
             field_selector = "metadata.name=rk8s-it-latency",
             on_event = function(type, obj) {
               got <<- obj$data$v
               !identical(got, "2")
             })
  expect_equal(got, "2")
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 15)

  # Quiet resource: must return after ~3s.
  t0 <- Sys.time()
  w <- kube_watch(k, "configmaps", timeout_seconds = 3,
                  field_selector = "metadata.name=rk8s-it-does-not-exist",
                  on_event = function(type, obj) TRUE)
  expect_equal(w$end_reason, "timeout")
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 8)
})

test_that("Informer lists, watches and stops on time", {
  k <- kube(namespace = "default")
  withr::defer(try(kube_delete(k, "configmap/rk8s-it-inf"), silent = TRUE))
  kube_apply(k, cm_body("rk8s-it-inf", "1"))
  inf <- Informer$new(k$client, "/api/v1/namespaces/default/configmaps",
                      query_params = list(labelSelector = "rk8s-it=runtime"))
  t0 <- Sys.time()
  inf$run(stop_seconds = 3)
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 8)
  expect_false(is.null(inf$lister()$get("rk8s-it-inf", "default")))
})

test_that("run_as_leader acquires, renews, releases a real Lease", {
  k <- kube(namespace = "default")
  lease <- "/apis/coordination.k8s.io/v1/namespaces/default/leases/rk8s-it-leader"
  withr::defer(try(k$client$call_api(lease, "DELETE"), silent = TRUE))
  renewals <- character()
  run_as_leader(
    k$client, "rk8s-it-leader", "default", "it-me",
    on_started_leading = function(leader) {
      for (i in 1:12) {
        leader$check()
        renewals <<- c(renewals, k$client$call_api(lease)$spec$renewTime)
        Sys.sleep(0.5)
      }
    },
    lease_duration_seconds = 10, renew_deadline_seconds = 6,
    retry_period_seconds = 1
  )
  expect_gt(length(unique(renewals)), 2)            # renewer PUTs succeeded
  expect_null(k$client$call_api(lease)$spec$holderIdentity)  # released
})

test_that("run_as_leader notices a takeover on a real cluster", {
  k <- kube(namespace = "default")
  lease <- "/apis/coordination.k8s.io/v1/namespaces/default/leases/rk8s-it-steal"
  withr::defer(try(k$client$call_api(lease, "DELETE"), silent = TRUE))
  stopped <- FALSE
  t0 <- Sys.time()
  run_as_leader(
    k$client, "rk8s-it-steal", "default", "it-me",
    on_started_leading = function(leader) {
      stolen <- FALSE
      repeat {
        leader$check()
        if (!stolen && Sys.time() - t0 > 3) {
          l <- k$client$call_api(lease)
          l$spec$holderIdentity <- "someone-else"
          l$metadata$managedFields <- NULL
          k$client$call_api(lease, "PUT", body = l)
          stolen <- TRUE
        }
        Sys.sleep(0.2)
      }
    },
    on_stopped_leading = function() stopped <<- TRUE,
    lease_duration_seconds = 10, renew_deadline_seconds = 6,
    retry_period_seconds = 1
  )
  expect_true(stopped)
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 10)
  expect_equal(k$client$call_api(lease)$spec$holderIdentity, "someone-else")
})

test_that("one loop drives informers on two resources against a real API server", {
  k <- kube(namespace = "default")
  withr::defer({
    try(kube_delete(k, "configmap/rk8s-it-mux"), silent = TRUE)
    try(kube_delete(k, "secret/rk8s-it-mux"), silent = TRUE)
  })
  seen <- character()
  cms <- Informer$new(k$client, "/api/v1/namespaces/default/configmaps",
                      query_params = list(labelSelector = "rk8s-it=mux"))
  secrets <- Informer$new(k$client, "/api/v1/namespaces/default/secrets",
                          query_params = list(labelSelector = "rk8s-it=mux"))
  cms$add_event_handler(on_add = function(obj) seen <<- c(seen, "cm"))
  secrets$add_event_handler(on_add = function(obj) seen <<- c(seen, "secret"))
  cms$start(); secrets$start()
  withr::defer({ cms$close(); secrets$close() })

  labels <- list(`rk8s-it` = "mux")
  kube_apply(k, list(apiVersion = "v1", kind = "ConfigMap",
                     metadata = list(name = "rk8s-it-mux", labels = labels),
                     data = list(a = "1")))
  kube_apply(k, list(apiVersion = "v1", kind = "Secret",
                     metadata = list(name = "rk8s-it-mux", labels = labels),
                     stringData = list(a = "1")))
  t0 <- Sys.time()
  while (length(seen) < 2 && Sys.time() - t0 < 10) {
    cms$poll(0.1); secrets$poll(0.1)
  }
  expect_setequal(seen, c("cm", "secret"))
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 3)
})
