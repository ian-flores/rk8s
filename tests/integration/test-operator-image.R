# The whole path from use_operator() to a running operator: scaffold, build
# the image from this source tree, load it into kind, install it with the
# generated manifests, reconcile a custom resource from inside the cluster,
# and fail over between two replicas.
#
# Slow (builds an image), so opt-in:
#   RK8S_E2E=1 RK8S_E2E_IMAGE=1 RK8S_KIND_CLUSTER=<name> Rscript tests/integration/run.R

kubectl <- function(...) {
  out <- suppressWarnings(system2("kubectl", c(...), stdout = TRUE, stderr = TRUE))
  structure(out, status = attr(out, "status") %||% 0L)
}

test_that("a scaffolded operator image runs, reconciles and fails over in kind", {
  skip_if_not(identical(Sys.getenv("RK8S_E2E_IMAGE"), "1"), "RK8S_E2E_IMAGE not set")
  cluster <- Sys.getenv("RK8S_KIND_CLUSTER")
  skip_if(!nzchar(cluster), "RK8S_KIND_CLUSTER not set")
  skip_if(!nzchar(Sys.which("docker")) || !nzchar(Sys.which("kind")) ||
            !nzchar(Sys.which("kubectl")), "docker, kind and kubectl are needed")

  dir <- withr::local_tempdir()
  src <- normalizePath(testthat::test_path("..", ".."))
  withr::with_dir(dir, system2("R", c("CMD", "build", "--no-build-vignettes",
                                     shQuote(src)), stdout = FALSE, stderr = FALSE))
  tarball <- Sys.glob(file.path(dir, "rk8s_*.tar.gz"))
  expect_length(tarball, 1)

  op <- file.path(dir, "op")
  image <- "rk8s-e2e-operator:test"
  use_operator(op, name = "e2e-operator", group = "e2e.rk8s.dev", kind = "Widget",
               replicas = 2, image = image, rk8s_source = tarball)
  expect_equal(system2("docker", c("build", "-q", "-t", image, op),
                       stdout = FALSE, stderr = FALSE), 0L)
  expect_equal(system2("kind", c("load", "docker-image", image, "--name", cluster),
                       stdout = FALSE, stderr = FALSE), 0L)

  deploy <- file.path(op, "deploy")
  withr::defer({
    kubectl("delete", "widgets.e2e.rk8s.dev", "--all", "-n", "default", "--wait=false")
    kubectl("delete", "-f", deploy, "--ignore-not-found", "--wait=false")
  })
  kubectl("apply", "-f", deploy)
  rollout <- kubectl("rollout", "status", "deploy/e2e-operator", "--timeout=240s")
  expect_equal(attr(rollout, "status"), 0L)

  k <- kube(namespace = "default")
  widget <- function(name) list(apiVersion = "e2e.rk8s.dev/v1", kind = "Widget",
                                metadata = list(name = name, namespace = "default"),
                                spec = list(size = name))
  config_of <- function(name) tryCatch(
    kube_get(k, "configmap", paste0(name, "-spec"))$data$spec,
    rk8s_api_error = function(e) NULL)
  wait_for <- function(cond, budget) {
    t0 <- Sys.time()
    while (Sys.time() - t0 < budget) {
      if (isTRUE(tryCatch(cond(), error = function(e) FALSE))) return(TRUE)
      Sys.sleep(1)
    }
    FALSE
  }
  holder <- function() tryCatch(
    kube_get(k, "coordination.k8s.io/v1:Lease", "e2e-operator")$spec$holderIdentity,
    rk8s_api_error = function(e) NULL)

  k <- kube(namespace = "default")    # discovery now includes the CRD
  kube_apply(k, widget("one"))
  expect_true(wait_for(function() identical(config_of("one"), '{"size":"one"}'), 60))
  w <- kube_get(k, "e2e.rk8s.dev/v1:Widget", "one")
  expect_equal(w$status$observedGeneration, w$metadata$generation)

  # Kill the leader: the standby must take over within about one lease
  # period (15s) plus a retry, and keep reconciling.
  old <- holder()
  expect_false(is.null(old))
  kubectl("delete", "pod", sub("-[0-9]+$", "", old), "--wait=false")
  t0 <- Sys.time()
  expect_true(wait_for(function() { h <- holder(); !is.null(h) && h != old }, 60))
  expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 30)
  kube_apply(k, widget("two"))
  expect_true(wait_for(function() identical(config_of("two"), '{"size":"two"}'), 60))
})
