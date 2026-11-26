# rk8s — Kubernetes client for R

[![R-CMD-check](https://github.com/ian-flores/rk8s/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ian-flores/rk8s/actions/workflows/R-CMD-check.yaml)

`rk8s` gives R first-class access to the Kubernetes API. Two layers:

1.  **A high-level verb API** —
    [`kube_get()`](https://ian-flores.github.io/rk8s/reference/kube_get.md),
    [`kube_apply()`](https://ian-flores.github.io/rk8s/reference/kube_apply.md),
    [`kube_logs()`](https://ian-flores.github.io/rk8s/reference/kube_logs.md),
    [`kube_watch()`](https://ian-flores.github.io/rk8s/reference/kube_watch.md),
    [`kube_scale()`](https://ian-flores.github.io/rk8s/reference/kube_scale.md),
    [`kube_delete()`](https://ian-flores.github.io/rk8s/reference/kube_delete.md).
    The surface most users want — never write `V1Deployment$new(...)` to
    do ordinary work.
2.  **A typed / generated API** — `CoreV1Api`, `AppsV1Api`, `V1Pod`,
    `V1Deployment`, … 944 operations and 635 model classes generated
    from the Kubernetes OpenAPI spec, mirroring the official Python
    client and Go client-go. Use it when you want full fidelity.

Watch helpers, an Informer + Lister cache, a DynamicClient for
CustomResources, pod exec and port-forward, and a
coordination.k8s.io/Lease-backed leader election round it out.

## Install

``` r

# install.packages("remotes")
remotes::install_github("ian-flores/rk8s")
```

Depends on `R6`, `httr2` (\>= 1.1.0), `jsonlite`, `yaml`, `openssl` and
`base64enc`. Optional: `nanonext` (exec / port-forward) and `callr`
(leader election,
[`pod_port_forward()`](https://ian-flores.github.io/rk8s/reference/pod_port_forward.md)).

## Quickstart

``` r

library(rk8s)
k <- kube()                             # ~/.kube/config; or kube(context=…)

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

# List, get, table-ize
kube_get(k, "pods", namespace = "default")
kube_get(k, "deployment/nginx")
as.data.frame(kube_get(k, "pods"))      # one row per object

# Logs, scale, watch, delete
cat(kube_logs(k, "nginx-abc", tail = 50))
kube_scale(k, "deployment", "nginx", replicas = 5)
kube_watch(k, "pods", timeout_seconds = 30, on_event = function(type, obj) {
  message(type, " ", obj$metadata$name)
  TRUE                                  # FALSE stops the watch
})
kube_delete(k, "deployment/nginx")
```

Resource refs accept any of: `"pods"`, `"pod"`, `"po"`,
`"deployment/nginx"`, `"apps/v1:Deployment"`,
`c("apps/v1", "Deployment")`.

CustomResources work out of the box —
[`kube_apply()`](https://ian-flores.github.io/rk8s/reference/kube_apply.md)
and
[`kube_get()`](https://ian-flores.github.io/rk8s/reference/kube_get.md)
discover the REST path for any `apiVersion+kind`.

## Authentication

[`load_kube_config()`](https://ian-flores.github.io/rk8s/reference/load_kube_config.md)
reads kubeconfig files the way `kubectl` does:

- `KUBECONFIG` with several files, merged (first definition wins)
- the context’s default namespace (used by
  [`kube()`](https://ian-flores.github.io/rk8s/reference/Kube.md))
- bearer tokens (`token` / `tokenFile`) and basic auth
- client certificates, inline (`*-data`) or as files relative to the
  kubeconfig that names them
- `exec` credential plugins (EKS, GKE, AKS/kubelogin, …), cached until
  they expire and re-run on 401
- the `oidc` auth-provider, including refresh-token renewal
- `proxy-url`, `tls-server-name` and `insecure-skip-tls-verify`

Inside a pod:

``` r

k <- kube(client = ApiClient$new(load_incluster_config()))
```

## Informers + Listers (controllers)

Build a controller without re-listing every tick:

``` r

inf <- Informer$new(k$client,
  resource_path = "/api/v1/namespaces/default/pods",
  object_from_list = V1Pod$from_list)

inf$add_event_handler(
  on_add    = function(obj) message("add: ", obj$metadata$name),
  on_update = function(old, new) message("upd: ", new$metadata$name),
  on_delete = function(obj) message("del: ", obj$metadata$name))

inf$run(stop_seconds = 120)            # list, then watch; relists on 410
inf$lister()$get("nginx", namespace = "default")   # cache lookup
```

## Exec and port-forward

``` r

r <- pod_exec(k$client, "default", "nginx-abc", c("ls", "/"))
cat(r$stdout); r$exit_code

fwd <- pod_port_forward(k$client, "default", "nginx-abc", remote_port = 80)
httr2::req_perform(httr2::request(paste0("http://127.0.0.1:", fwd$port)))
fwd$close()
```

These use WebSockets (via `nanonext`). The API server’s certificate is
verified against the kubeconfig CA and its hostname checked. They
authenticate with a bearer token: kubeconfigs that only have a client
certificate (kind, minikube and kubeadm admin users) need a token, e.g.
from a ServiceAccount:

``` r

# kubectl create serviceaccount rk8s-dev
# kubectl create clusterrolebinding rk8s-dev --clusterrole=edit \
#   --serviceaccount=default:rk8s-dev
cfg <- load_kube_config()
cfg$api_key <- list(authorization = paste(
  "Bearer", system("kubectl create token rk8s-dev", intern = TRUE)))
k <- kube(client = ApiClient$new(cfg))
```

## Leader election

``` r

run_as_leader(k$client,
  lease_name = "my-controller",
  lease_namespace = "kube-system",
  identity = paste0(Sys.info()[["nodename"]], "-", Sys.getpid()),
  on_started_leading = function(leader) {
    repeat {
      leader$check()          # stops here once leadership is lost
      reconcile_once()
      Sys.sleep(5)
    }
  },
  on_stopped_leading = function() message("stopped"))
```

A background process renews the lease. Call `leader$check()` regularly:
it signals as soon as the lease is lost or renewals stop succeeding, so
two replicas never act as leader at the same time.

## When you need the full API surface

Drop down to typed classes any time:

``` r

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

| Concern | Hand-written (`R/*.R`) | Generated (`R/gen_*.R`) |
|----|----|----|
| Verb API | `kube`, `kube_get/apply/delete/scale/logs/watch` | — |
| Transport / auth | `ApiClient`, `Configuration` | — |
| Config loading | `load_kube_config`, `_incluster`, exec plugin | — |
| Errors | `ApiException` | — |
| Watch | `Watch` | — |
| Exec / port-forward | `pod_exec`, `pod_port_forward` | — |
| Cache | `Informer`, `Lister` | — |
| Dynamic / discovery | `DynamicClient`, `DynamicResource` | — |
| Leader election | `run_as_leader` | — |
| YAML apply / quantity | `create_from_yaml`, `parse_quantity` | — |
| Typed API classes | — | `CoreV1Api`, `AppsV1Api`, … (62) |
| Model classes | — | `V1Pod`, `V1Deployment`, … (635) |

The generator in `tools/gen/` reads the Kubernetes OpenAPI v2
swagger.json (pinned in `tools/gen/spec/`) and emits the typed classes —
same architectural split as the Python client. To update to a newer
cluster version, swap the spec and re-run:

``` bash
Rscript tools/gen/generate.R tools/gen/spec/swagger.json R
```

## License

Apache 2.0.
