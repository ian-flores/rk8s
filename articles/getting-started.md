# Getting started with rk8s

rk8s is an R client for the Kubernetes API. It has two layers:

- **A high-level verb API** —
  [`kube_get()`](https://ian-flores.github.io/rk8s/reference/kube_get.md),
  [`kube_apply()`](https://ian-flores.github.io/rk8s/reference/kube_apply.md),
  [`kube_logs()`](https://ian-flores.github.io/rk8s/reference/kube_logs.md),
  [`kube_watch()`](https://ian-flores.github.io/rk8s/reference/kube_watch.md),
  … This is what most users want. You never have to type
  `V1Deployment$new(...)` to do everyday work.
- **A low-level typed/generated API** — `CoreV1Api`, `AppsV1Api`,
  `V1Pod`, `V1Deployment`, … 944 operations and 635 model classes
  generated from the Kubernetes OpenAPI spec, mirroring the official
  Python client and Go client-go. There when you need it.

A `Watch` helper, `Informer`/`Lister` for client-go-style controllers,
`DynamicClient` for CustomResources,
[`pod_exec()`](https://ian-flores.github.io/rk8s/reference/pod_exec.md)
/
[`pod_port_forward()`](https://ian-flores.github.io/rk8s/reference/pod_port_forward.md),
and
[`run_as_leader()`](https://ian-flores.github.io/rk8s/reference/run_as_leader.md)
for leader election sit alongside both layers.

## Installing

``` r

# install.packages("remotes")
remotes::install_github("ian-flores/rk8s")
```

## Authenticating

``` r

library(rk8s)
k <- kube()                                   # $KUBECONFIG or ~/.kube/config
# k <- kube(context = "my-dev")
# k <- kube(config_file = "~/configs/prod.yaml")
# k <- kube(namespace = "my-app")             # override the context namespace
```

Inside a pod running as a ServiceAccount:

``` r

k <- kube(client = ApiClient$new(load_incluster_config()))
```

[`load_kube_config()`](https://ian-flores.github.io/rk8s/reference/load_kube_config.md)
reads kubeconfigs the way `kubectl` does: a `KUBECONFIG` list of several
files (merged, first definition wins), the context’s default namespace,
bearer tokens and token files, basic auth, client certificates (inline
or as files relative to the kubeconfig that names them), `exec`
credential plugins (EKS’s `aws-iam-authenticator`, GKE’s
`gke-gcloud-auth-plugin`, AKS’s `kubelogin`, any OIDC helper), the
`oidc` auth-provider with token refresh, `proxy-url`, `tls-server-name`
and `insecure-skip-tls-verify`.

Requests that hit API throttling (429) are retried for any method;
server errors (500-504) and dropped connections are retried for reads
only. Set `Configuration$max_retries` (default 3) to change this.

## The verb API

Resource references can be:

- a kind alias: `"pod"`, `"pods"`, `"po"`, `"deploy"`, `"svc"`, `"ing"`,
  `"crd"`, …
- `"kind/name"`: `"deployment/nginx"`
- explicit `"apiVersion:Kind"`: `"apps/v1:Deployment"`
- a `c(apiVersion, Kind)` vector: `c("apps/v1", "Deployment")`

The examples below assume a pod called `nginx-abc` and, after the apply
section, a Deployment called `nginx`.

### Get / list

``` r

kube_get(k, "pods", namespace = "default")              # list
kube_get(k, "pod", "nginx-abc")                          # single
kube_get(k, "deployment/nginx")                          # alt syntax
kube_get(k, "pods", label_selector = "app=nginx")
kube_get(k, "apps/v1:Deployment", "nginx")               # explicit GVK
```

[`kube_get()`](https://ian-flores.github.io/rk8s/reference/kube_get.md)
returns an `rk8s_object` (single) or `rk8s_list` (collection).
[`kube_list()`](https://ian-flores.github.io/rk8s/reference/kube_list.md)
pages through large collections for you. A built-in
[`as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html) method
gives you a tabular view:

``` r

pods <- kube_get(k, "pods")
head(as.data.frame(pods))
#>     namespace                    name kind     age   status
#> 1     default                  nginx-1  Pod    12m  Running
#> 2     default                  nginx-2  Pod    12m  Running
#> 3 kube-system          coredns-abc-xyz  Pod      4h  Running
```

### Apply (server-side apply)

[`kube_apply()`](https://ian-flores.github.io/rk8s/reference/kube_apply.md)
accepts a path, a YAML/JSON string, an R `list`, or a generated model.
Multi-document YAML works — each document is routed to the correct
endpoint via discovery:

``` r

# From a file
kube_apply(k, "deployment.yaml")

# From an R list (the most natural form for programmatic generation)
kube_apply(k, list(
  apiVersion = "v1", kind = "ConfigMap",
  metadata = list(name = "demo"),
  data = list(hello = "world")
))

# From a multi-doc YAML string
kube_apply(k, "
apiVersion: v1
kind: ConfigMap
metadata: {name: demo-cm}
data: {greeting: hello}
---
apiVersion: v1
kind: Service
metadata: {name: demo-svc}
spec:
  selector: {app: demo}
  ports: [{port: 80, targetPort: 8080}]
")

# Force-take ownership of conflicting fields (server-side apply force):
kube_apply(k, "deployment.yaml", force = TRUE)
```

Field manager defaults to `"rk8s"`; override with `field_manager =`.

### Delete, scale, logs, watch

``` r

kube_scale(k, "deployment", "nginx", replicas = 5)
kube_scale(k, "statefulset/postgres", replicas = 3)

cat(kube_logs(k, "nginx-abc", tail = 50))
kube_logs(k, "nginx-abc", container = "sidecar", follow = TRUE)

w <- kube_watch(k, "pods",
  on_event = function(type, obj) {
    message(type, " ", obj$metadata$name)
    TRUE  # keep watching; return FALSE to stop
  },
  timeout_seconds = 30
)
w$end_reason   # "stop", "timeout" or "gone" (resourceVersion too old)

kube_delete(k, "pod", "nginx-abc")
kube_delete(k, "deployment/nginx", grace_period = 0)
```

`timeout_seconds` is a wall-clock limit: the watch reconnects after
server-side timeouts but returns once the time is up.

### Anything custom

[`kube_apply()`](https://ian-flores.github.io/rk8s/reference/kube_apply.md)
works for CRs out of the box (any `apiVersion+kind`), and
[`kube_get()`](https://ian-flores.github.io/rk8s/reference/kube_get.md)
resolves them via the dynamic client. So a typical controller is:

``` r

foos <- kube_list(k, "example.com/v1:Foo", namespace = "default")
for (f in foos$items) {
  if (is.null(f$status$ready) || !isTRUE(f$status$ready)) {
    kube_apply(k, list(
      apiVersion = "example.com/v1", kind = "Foo",
      metadata = list(name = f$metadata$name),
      status = list(ready = TRUE)
    ))
  }
}
```

## Watching with a local cache: Informer + Lister

When you want to react to changes without re-listing the API server
every tick, use `Informer`. One watch feeds an in-memory cache plus your
event handlers; `Lister` gives you O(1) lookups. The initial list is
paged, and if the watch falls too far behind (410 Gone) the informer
lists again and reconciles its cache, firing `on_delete` for anything
removed in the meantime.

``` r

inf <- Informer$new(
  k$client,
  resource_path = "/api/v1/namespaces/default/pods",
  object_from_list = V1Pod$from_list
)
inf$add_event_handler(
  on_add    = function(obj) message("add: ", obj$metadata$name),
  on_update = function(old, new) {
    if (!identical(old$status$phase, new$status$phase))
      message(new$metadata$name, ": ",
              old$status$phase, " -> ", new$status$phase)
  },
  on_delete = function(obj) message("gone: ", obj$metadata$name)
)
inf$run(stop_seconds = 120)

pods <- inf$lister()
pods$get("nginx-abc", namespace = "default")   # cache lookup, no API call
pods$list()
```

## Exec and port-forward

Run a command in a pod and collect its output:

``` r

r <- pod_exec(k$client, "default", "nginx-abc", c("ls", "-la", "/"))
cat(r$stdout)
r$exit_code

# With stdin
pod_exec(k$client, "default", "nginx-abc", "cat", stdin_data = "hi\n")$stdout
```

For an interactive session use
[`pod_exec_open()`](https://ian-flores.github.io/rk8s/reference/pod_exec_open.md),
which returns a `PodExecSession` with `write_stdin()`, `on_stdout()` and
friends. Incoming output is delivered while `wait()` or `pump()` runs.

Forward a pod port to a local one, like `kubectl port-forward`:

``` r

fwd <- pod_port_forward(k$client, "default", "nginx-abc", remote_port = 80)
httr2::request(paste0("http://127.0.0.1:", fwd$port)) |> httr2::req_perform()
fwd$close()
```

Both need the `nanonext` package. They verify the API server’s
certificate against the kubeconfig CA (or the system CA bundle) and
check its hostname, and authenticate with a bearer token. A kubeconfig
whose user has only a client certificate, as kind, minikube and kubeadm
create by default, gets an error explaining this; use a token instead:

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

For controllers that need exactly one active replica:

``` r

run_as_leader(
  k$client,
  lease_name = "my-controller",
  lease_namespace = "kube-system",
  identity = paste0(Sys.info()[["nodename"]], "-", Sys.getpid()),
  on_started_leading = function(leader) {
    message("leading")
    repeat {
      leader$check()      # signals once leadership is lost
      reconcile_once()
      Sys.sleep(5)
    }
  },
  on_stopped_leading = function() message("stopped leading")
)
```

A background process (via `callr`) renews the lease. `leader$check()`
signals an `rk8s_leadership_lost` condition as soon as the lease is
taken or renewals stop succeeding;
[`run_as_leader()`](https://ian-flores.github.io/rk8s/reference/run_as_leader.md)
then stops the callback, releases the lease and calls
`on_stopped_leading`. Call it often, at least once per
`renew_deadline_seconds`, so two replicas never act as leader at the
same time. `leader$is_leader()` is the non-signalling version.

## Errors

API failures surface as `rk8s_api_error` conditions whose `$exception`
is an `ApiException` with the HTTP status, reason, headers, and parsed
`metav1.Status`.

``` r

pod <- tryCatch(
  kube_get(k, "pod", "nope"),
  rk8s_api_error = function(e) {
    if (e$exception$status == 404L) NULL else stop(e)
  }
)
```

## Dropping to the typed/generated layer

Any time `kube_*` doesn’t expose what you need, drop down. The verb
client carries the underlying `ApiClient` and `DynamicClient`:

``` r

# Typed:
core <- CoreV1Api$new(k$client)
pods <- V1PodList$from_list(core$list_pod_for_all_namespaces())

# Or build a typed model explicitly:
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

## Regenerating from a newer Kubernetes spec

``` bash
curl -L -o tools/gen/spec/swagger.json \
  https://raw.githubusercontent.com/kubernetes/kubernetes/release-1.31/api/openapi-spec/swagger.json
Rscript tools/gen/generate.R tools/gen/spec/swagger.json R
R CMD build .
```

The generator (`tools/gen/`) reads OpenAPI v2 JSON and emits R6 model
classes plus per-tag API classes — about 700 R files. NAMESPACE entries
between sentinel lines are managed automatically.
