test_that("KIND_ALIASES covers common kubectl-style aliases", {
  expect_equal(rk8s:::KIND_ALIASES[["pod"]]$kind, "Pod")
  expect_equal(rk8s:::KIND_ALIASES[["po"]]$kind, "Pod")
  expect_equal(rk8s:::KIND_ALIASES[["pods"]]$apiVersion, "v1")
  expect_equal(rk8s:::KIND_ALIASES[["deploy"]]$apiVersion, "apps/v1")
  expect_equal(rk8s:::KIND_ALIASES[["deployment"]]$kind, "Deployment")
  expect_equal(rk8s:::KIND_ALIASES[["svc"]]$kind, "Service")
  expect_equal(rk8s:::KIND_ALIASES[["ing"]]$apiVersion, "networking.k8s.io/v1")
  expect_equal(rk8s:::KIND_ALIASES[["crd"]]$kind, "CustomResourceDefinition")
})

test_that("parse_ref handles bare kind, kind/name, apiVersion:Kind, and GVK list", {
  expect_equal(rk8s:::parse_ref("pods"), list(alias = "pods", name = NULL))
  expect_equal(rk8s:::parse_ref("deployment/nginx"),
               list(alias = "deployment", name = "nginx"))

  p <- rk8s:::parse_ref("apps/v1:Deployment")
  expect_equal(p$api_version_kind$apiVersion, "apps/v1")
  expect_equal(p$api_version_kind$kind, "Deployment")
  expect_null(p$name)

  p2 <- rk8s:::parse_ref(c("v1", "Pod"))
  expect_equal(p2$api_version_kind, list(apiVersion = "v1", kind = "Pod"))
})

test_that("normalize_manifest accepts list, multi-doc YAML string, and single-doc list", {
  one <- rk8s:::normalize_manifest(
    list(apiVersion = "v1", kind = "ConfigMap",
         metadata = list(name = "a"), data = list(x = "y"))
  )
  expect_length(one, 1)
  expect_equal(one[[1]]$kind, "ConfigMap")

  two <- rk8s:::normalize_manifest('
apiVersion: v1
kind: ConfigMap
metadata: {name: a}
---
apiVersion: v1
kind: ConfigMap
metadata: {name: b}
')
  expect_length(two, 2)
  expect_equal(two[[1]]$metadata$name, "a")
  expect_equal(two[[2]]$metadata$name, "b")
})

test_that("Kube class wires up dynamic + namespace + field_manager", {
  ac <- ApiClient$new(Configuration$new(host = "https://x"))
  k <- Kube$new(ac, namespace = "my-ns", field_manager = "tester")
  expect_identical(k$client, ac)
  expect_s3_class(k$dynamic, "DynamicClient")
  expect_equal(k$namespace, "my-ns")
  expect_equal(k$field_manager, "tester")
})

test_that("as.data.frame.rk8s_list flattens items into a name/namespace/age table", {
  lst <- structure(
    list(kind = "PodList", metadata = list(resourceVersion = "1"),
         items = list(
           list(kind = "Pod", metadata = list(name = "a", namespace = "ns",
                                                creationTimestamp = "2026-04-23T13:00:00Z"),
                status = list(phase = "Running")),
           list(kind = "Pod", metadata = list(name = "b", namespace = "ns",
                                                creationTimestamp = "2026-04-23T12:00:00Z"),
                status = list(phase = "Pending"))
         )),
    class = c("rk8s_list", "list"))
  df <- as.data.frame(lst)
  expect_equal(nrow(df), 2)
  expect_setequal(df$name, c("a", "b"))
  expect_setequal(df$status, c("Running", "Pending"))
  expect_true(all(grepl("[0-9]+[smhd]", df$age)))
})
