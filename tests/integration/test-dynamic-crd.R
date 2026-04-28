test_that("DynamicClient handles CustomResourceDefinitions end-to-end", {
  k <- kube()
  crd_yaml <- "
apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata: {name: widgets.rk8s.test}
spec:
  group: rk8s.test
  scope: Namespaced
  names: {plural: widgets, singular: widget, kind: Widget, listKind: WidgetList}
  versions:
    - name: v1
      served: true
      storage: true
      schema:
        openAPIV3Schema:
          type: object
          properties:
            spec:
              type: object
              properties:
                color: {type: string}
"
  withr::defer(try(kube_delete(k, "crd/widgets.rk8s.test"), silent = TRUE))
  kube_apply(k, crd_yaml)

  # CRD takes a moment to be Established.
  for (i in seq_len(30)) {
    crd <- tryCatch(kube_get(k, "crd/widgets.rk8s.test"),
                     rk8s_api_error = function(e) NULL)
    conds <- if (!is.null(crd)) crd$status$conditions else NULL
    est <- any(vapply(conds %||% list(), function(c)
      identical(c$type, "Established") && identical(c$status, "True"),
      logical(1)))
    if (isTRUE(est)) break
    Sys.sleep(1)
  }
  expect_true(isTRUE(est))

  # Invalidate dynamic client cache so it sees the new CR.
  k$dynamic$invalidate_cache()

  withr::defer(try(kube_delete(k, "rk8s.test/v1:Widget", "blue", namespace = "default"),
                     silent = TRUE))
  kube_apply(k, list(
    apiVersion = "rk8s.test/v1", kind = "Widget",
    metadata = list(name = "blue", namespace = "default"),
    spec = list(color = "blue")
  ))

  w <- kube_get(k, "rk8s.test/v1:Widget", "blue", namespace = "default")
  expect_equal(w$spec$color, "blue")
})
