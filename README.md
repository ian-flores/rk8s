# rk8s — Kubernetes client for R

[![R-CMD-check](https://github.com/ian-flores/rk8s/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ian-flores/rk8s/actions/workflows/R-CMD-check.yaml)

`rk8s` gives R first-class access to the Kubernetes API. Two layers:

1. **A high-level verb API** — `kube_get()`, `kube_apply()`,
   `kube_logs()`, `kube_watch()`, `kube_scale()`, `kube_delete()`. The
   surface most users want — never write `V1Deployment$new(...)` to do
   ordinary work.
2. **A typed / generated API** — `CoreV1Api`, `AppsV1Api`, `V1Pod`,
   `V1Deployment`, … 944 operations and 635 model classes generated
   from the Kubernetes OpenAPI spec, mirroring the official Python
   client and Go client-go. Use it when you want full fidelity.

Watch helpers, an Informer + Lister cache, a DynamicClient for
CustomResources, and a coordination.k8s.io/Lease-backed leader
election round it out.

## Install

```r
# remotes::install_github("ian-flores/rk8s")
install.packages("rk8s_0.2.0.tar.gz", repos = NULL)
```

Depends on `R6`, `httr2`, `jsonlite`, `yaml`, `openssl`, `base64enc`.

## Quickstart

```r
library(rk8s)
k <- kube()                             # ~/.kube/config; or kube(context=…)

# List, get, table-ize
kube_get(k, "pods", namespace = "default")
kube_get(k, "deployment/nginx")
as.data.frame(kube_get(k, "pods"))      # tibble-like flattening

# Apply manifests (server-side apply, force optional)
kube_apply(k, "deployment.yaml")
kube_apply(k, list(
  apiVersion = "v1", kind = "ConfigMap",
  metadata = list(name = "demo"),
  data = list(hello = "world")
))
kube_apply(k, "
  apiVersion: apps/v1
  kind: Deployment
  metadata: {name: nginx}
  spec:
    replicas: 3
    selector: {matchLabels: {app: nginx}}
    template:
      metadata: {labels: {app: nginx}}
      spec:
        containers: [{name: nginx, image: nginx:1.25}]
")

# Logs, scale, delete, watch
cat(kube_logs(k, "nginx-abc", tail = 50))
kube_scale(k, "deployment", "nginx", replicas = 5)
kube_delete(k, "deployment/nginx")
kube_watch(k, "pods", on_event = function(type, obj) {
  message(type, " ", obj$metadata$name); TRUE
})
```

Resource refs accept any of: `"pods"`, `"pod"`, `"po"`,
`"deployment/nginx"`, `"apps/v1:Deployment"`, `c("apps/v1", "Deployment")`.

CustomResources work out of the box — `kube_apply()` and `kube_get()`
discover the REST path for any `apiVersion+kind`.

## Authentication

`load_kube_config()` understands everything `kubectl` does:

- bearer tokens (`users.user.token` / `tokenFile`)
- basic auth (`username` / `password`)
- inline base64 client certs (`*-data` keys)
- on-disk PEM files (absolute, or relative to the kubeconfig)
- `exec` credential plugins with output caching (EKS, GKE, OIDC)
- `insecure-skip-tls-verify`

Inside a pod:

```r
k <- kube(client = ApiClient$new(load_incluster_config()))
```

## Informers + Listers (controllers)

Build a controller without re-listing every tick:

```r
inf <- Informer$new(k$client,
  resource_path = "/api/v1/namespaces/default/pods",
  object_from_list = V1Pod$from_list)

inf$add_event_handler(
  on_add    = function(obj) message("add: ", obj$metadata$name),
  on_update = function(old, new) message("upd: ", new$metadata$name),
  on_delete = function(obj) message("del: ", obj$metadata$name))

inf$run(stop_seconds = 120)
inf$lister()$get("nginx")            # O(1) cache lookup
```

## Leader election

```r
run_as_leader(k$client,
  lease_name = "my-controller",
  lease_namespace = "kube-system",
  identity = paste0(Sys.info()[["nodename"]], "-", Sys.getpid()),
  on_started_leading = function() controller_loop(),
  on_stopped_leading = function() message("stopped"))
```

## When you need the full API surface

Drop down to typed classes any time:

```r
core <- CoreV1Api$new(k$client)
pods <- V1PodList$from_list(core$list_pod_for_all_namespaces())

dep <- V1Deployment$new(
  api_version = "apps/v1", kind = "Deployment",
  metadata = V1ObjectMeta$new(name = "nginx"),
  spec = V1DeploymentSpec$new(
    replicas = 3L,
    selector = V1LabelSelector$new(match_labels = list(app = "nginx")),
    template = V1PodTemplateSpec$new(
      metadata = V1ObjectMeta$new(labels = list(app = "nginx")),
      spec = V1PodSpec$new(containers = list(
        V1Container$new(name = "nginx", image = "nginx:1.25"))))))

AppsV1Api$new(k$client)$create_namespaced_deployment(
  namespace = "default", body = dep)
```

## Architecture

| Concern                   | Hand-written (`R/*.R`)                            | Generated (`R/gen_*.R`)               |
| ------------------------- | ------------------------------------------------- | ------------------------------------- |
| Verb API                  | `kube`, `kube_get/apply/delete/scale/logs/watch`  | —                                     |
| Transport / auth          | `ApiClient`, `Configuration`                      | —                                     |
| Config loading            | `load_kube_config`, `_incluster`, exec plugin     | —                                     |
| Errors                    | `ApiException`                                    | —                                     |
| Watch                     | `Watch`                                           | —                                     |
| Cache                     | `Informer`, `Lister`                              | —                                     |
| Dynamic / discovery       | `DynamicClient`, `DynamicResource`                | —                                     |
| Leader election           | `run_as_leader`                                   | —                                     |
| YAML apply / quantity     | `create_from_yaml`, `parse_quantity`              | —                                     |
| Typed API classes         | —                                                 | `CoreV1Api`, `AppsV1Api`, … (62)      |
| Model classes             | —                                                 | `V1Pod`, `V1Deployment`, … (635)      |

The generator in `tools/gen/` reads the Kubernetes OpenAPI v2
swagger.json (pinned in `tools/gen/spec/`) and emits the typed
classes — same architectural split as the Python client. To update
to a newer cluster version, swap the spec and re-run:

```bash
Rscript tools/gen/generate.R tools/gen/spec/swagger.json R
```

## License

Apache 2.0.
