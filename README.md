# rk8s

[![R-CMD-check](https://github.com/ian-flores/rk8s/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ian-flores/rk8s/actions/workflows/R-CMD-check.yaml)

A Kubernetes client for R.

```r
library(rk8s)
k <- kube()
kube_get(k, "pods")
```

rk8s reads your kubeconfig the way kubectl does, so if `kubectl get pods`
works, so does the code above.

Most of the time you'll use a handful of verbs: `kube_get()`,
`kube_apply()`, `kube_logs()`, `kube_scale()`, `kube_watch()` and
`kube_delete()`. They take manifests as YAML or plain R lists. Behind them
is a client generated from the Kubernetes OpenAPI spec (`CoreV1Api`,
`V1Pod` and so on, 944 operations in all) for anything the verbs don't
cover.

There's also what you need to run a controller in R: watches, an
informer cache, and leader election on a Lease.

## Installation

rk8s isn't on CRAN yet. Install it from GitHub:

```r
remotes::install_github("ian-flores/rk8s")
```

For `pod_exec()` and `pod_port_forward()` you also need `nanonext`, and
for leader election `callr`.

## Usage

`kube()` uses `$KUBECONFIG` (or `~/.kube/config`) and the current context.
Its `context`, `config_file` and `namespace` arguments change that.

```r
k <- kube()

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

kube_get(k, "deployment/nginx")
as.data.frame(kube_get(k, "pods"))

kube_scale(k, "deployment", "nginx", replicas = 5)
cat(kube_logs(k, "nginx-abc", tail = 50))
kube_delete(k, "deployment/nginx")
```

`kube_apply()` does a server-side apply, and also takes a file path or an
R list:

```r
kube_apply(k, "deployment.yaml")
kube_apply(k, list(
  apiVersion = "v1", kind = "ConfigMap",
  metadata = list(name = "demo"),
  data = list(hello = "world")
))
```

You can name a resource as `"pods"`, `"pod"`, `"po"`,
`"deployment/nginx"`, `"apps/v1:Deployment"` or
`c("apps/v1", "Deployment")`. Custom resources work the same way; rk8s
looks up where they live through API discovery.

### Watching

```r
kube_watch(k, "pods", timeout_seconds = 30, on_event = function(type, obj) {
  message(type, " ", obj$metadata$name)
  TRUE   # return FALSE to stop
})
```

For a controller you usually want an informer instead. It lists once,
keeps a local copy up to date from a watch, and calls your handlers:

```r
inf <- Informer$new(k$client,
  resource_path = "/api/v1/namespaces/default/pods",
  object_from_list = V1Pod$from_list)

inf$add_event_handler(
  on_add    = function(obj) message("add: ", obj$metadata$name),
  on_update = function(old, new) message("update: ", new$metadata$name),
  on_delete = function(obj) message("delete: ", obj$metadata$name))

inf$run(stop_seconds = 120)
inf$lister()$get("nginx", namespace = "default")
```

### Leader election

If you run several copies of a controller, only one should act at a
time:

```r
run_as_leader(k$client,
  lease_name = "my-controller",
  lease_namespace = "kube-system",
  identity = paste0(Sys.info()[["nodename"]], "-", Sys.getpid()),
  on_started_leading = function(leader) {
    repeat {
      leader$check()
      reconcile_once()
      Sys.sleep(5)
    }
  },
  on_stopped_leading = function() message("stopped"))
```

A background process keeps renewing the lease. `leader$check()` throws as
soon as the lease is lost, which ends your loop before another replica
takes over, so call it often.

### Exec and port-forward

```r
r <- pod_exec(k$client, "default", "nginx-abc", c("ls", "/"))
cat(r$stdout)
r$exit_code

fwd <- pod_port_forward(k$client, "default", "nginx-abc", remote_port = 80)
httr2::req_perform(httr2::request(paste0("http://127.0.0.1:", fwd$port)))
fwd$close()
```

These run over a WebSocket, which has to authenticate with a token.
The default users that kind, minikube and kubeadm create only have a
client certificate, so with those you'll need a ServiceAccount token:

```r
# kubectl create serviceaccount rk8s-dev
# kubectl create clusterrolebinding rk8s-dev --clusterrole=edit \
#   --serviceaccount=default:rk8s-dev
cfg <- load_kube_config()
cfg$api_key <- list(authorization = paste(
  "Bearer", system("kubectl create token rk8s-dev", intern = TRUE)))
k <- kube(client = ApiClient$new(cfg))
```

### The generated API

When the verbs don't have what you need, use the generated classes
directly. Their method names match the official Python client.

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

## Authentication

rk8s supports what's commonly found in kubeconfig files: tokens and token
files, client certificates, basic auth, exec plugins (EKS, GKE,
kubelogin and others), the `oidc` auth-provider, `proxy-url`,
`tls-server-name`, `insecure-skip-tls-verify`, and a `KUBECONFIG` that
lists several files. Inside a pod, use the ServiceAccount instead:

```r
k <- kube(client = ApiClient$new(load_incluster_config()))
```

## Development

The classes in `R/gen_*.R` are generated from the OpenAPI spec pinned in
`tools/gen/spec/`. To target a newer Kubernetes release, replace the
spec and regenerate:

```bash
Rscript tools/gen/generate.R tools/gen/spec/swagger.json R
```

The unit tests run against fake API servers. The integration tests in
`tests/integration/` need a cluster you don't mind writing to (kind
works):

```bash
RK8S_E2E=1 Rscript tests/integration/run.R
```

## License

Apache 2.0
