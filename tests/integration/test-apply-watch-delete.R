test_that("kube_apply creates a Deployment, watch sees it, kube_delete removes it", {
  k <- kube(namespace = "default")
  withr::defer(try(kube_delete(k, "deployment/rk8s-it-nginx"), silent = TRUE))

  kube_apply(k, "
apiVersion: apps/v1
kind: Deployment
metadata: {name: rk8s-it-nginx}
spec:
  replicas: 1
  selector: {matchLabels: {app: rk8s-it-nginx}}
  template:
    metadata: {labels: {app: rk8s-it-nginx}}
    spec:
      containers:
        - {name: nginx, image: nginx:1.25-alpine, ports: [{containerPort: 80}]}
")

  # Poll for readiness with a generous timeout (kind pulls the image).
  ready <- FALSE
  for (i in seq_len(60)) {
    d <- tryCatch(kube_get(k, "deployment/rk8s-it-nginx"),
                   rk8s_api_error = function(e) NULL)
    if (!is.null(d) && isTRUE(d$status$readyReplicas >= 1)) { ready <- TRUE; break }
    Sys.sleep(2)
  }
  expect_true(ready, info = "Deployment never reached readyReplicas >= 1")

  # Watch should see at least one event for our deployment within 5s.
  saw <- FALSE
  kube_watch(k, "deployments",
    timeout_seconds = 5,
    on_event = function(type, obj) {
      if (identical(obj$metadata$name, "rk8s-it-nginx")) saw <<- TRUE
      !saw  # stop as soon as we see ours
    }
  )
  expect_true(saw)

  kube_delete(k, "deployment/rk8s-it-nginx")
  for (i in seq_len(30)) {
    gone <- tryCatch({
      kube_get(k, "deployment/rk8s-it-nginx"); FALSE
    }, rk8s_api_error = function(e) e$exception$status == 404L)
    if (gone) break
    Sys.sleep(1)
  }
  expect_true(gone)
})
