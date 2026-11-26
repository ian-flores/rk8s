# Getting started with rk8s

This guide walks through the parts of rk8s you’ll use most: connecting,
the verbs, watches and informers, exec and port-forward, leader
election, and the generated API underneath. None of the code runs when
the vignette is built, since it needs a cluster. The examples assume a
pod called `nginx-abc` and, once you get to the apply section, a
Deployment called `nginx`.

## Installing

``` r

# install.packages("remotes")
remotes::install_github("ian-flores/rk8s")
```

## Connecting

``` r

library(rk8s)
k <- kube()                                   # $KUBECONFIG or ~/.kube/config
# k <- kube(context = "my-dev")
# k <- kube(config_file = "~/configs/prod.yaml")
# k <- kube(namespace = "my-app")             # override the context namespace
```

From a pod running as a ServiceAccount:

``` r

k <- kube(client = ApiClient$new(load_incluster_config()))
```

[`kube()`](https://ian-flores.github.io/rk8s/reference/Kube.md) calls
[`load_kube_config()`](https://ian-flores.github.io/rk8s/reference/load_kube_config.md),
which handles the kubeconfig features you’re likely to meet.
`KUBECONFIG` can list several files; they’re merged and the first
definition of a name wins. Each context’s default namespace is used.
Users can authenticate with a token or token file, basic auth, or a
client certificate (inline, or a file path relative to the kubeconfig it
appears in). Exec plugins work too: EKS’s `aws-iam-authenticator`, GKE’s
`gke-gcloud-auth-plugin`, AKS’s `kubelogin` and any OIDC helper. So does
the older `oidc` auth-provider, including refreshing its token. Clusters
can set `proxy-url`, `tls-server-name` and `insecure-skip-tls-verify`.

If the API server throttles you (429), the request is retried whatever
its method. Server errors (500 to 504) and dropped connections are
retried only for reads, since retrying a write could apply it twice.
`Configuration$max_retries` sets the limit; the default is 3.

## The verbs

You can refer to a resource type in several ways:

- by kind or alias: `"pod"`, `"pods"`, `"po"`, `"deploy"`, `"svc"`,
  `"ing"`, `"crd"` and so on
- with a name attached: `"deployment/nginx"`
- by API version and kind: `"apps/v1:Deployment"`
- as a vector: `c("apps/v1", "Deployment")`

### Getting and listing

``` r

kube_get(k, "pods", namespace = "default")              # list
kube_get(k, "pod", "nginx-abc")                          # single
kube_get(k, "deployment/nginx")                          # alt syntax
kube_get(k, "pods", label_selector = "app=nginx")
kube_get(k, "apps/v1:Deployment", "nginx")               # explicit GVK
```

You get back an `rk8s_object` for a single resource and an `rk8s_list`
for a collection.
[`kube_list()`](https://ian-flores.github.io/rk8s/reference/kube_list.md)
always returns a list, and pages through large collections for you. To
look at a list as a table, use
[`as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html):

``` r

pods <- kube_get(k, "pods")
head(as.data.frame(pods))
#>     namespace                    name kind     age   status
#> 1     default                  nginx-1  Pod    12m  Running
#> 2     default                  nginx-2  Pod    12m  Running
#> 3 kube-system          coredns-abc-xyz  Pod      4h  Running
```

### Applying

[`kube_apply()`](https://ian-flores.github.io/rk8s/reference/kube_apply.md)
does a server-side apply. Give it a file, a YAML or JSON string, an R
list, or one of the generated model objects. A YAML string can hold
several documents, and each goes to the right endpoint:

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

Changes are recorded under the field manager `"rk8s"` unless you pass
`field_manager`.

### Scaling, logs, watching and deleting

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

`timeout_seconds` is measured on the clock. The API server ends watches
on its own schedule; rk8s reconnects when that happens and returns once
your time is up.

### Custom resources

Custom resources need no setup. rk8s finds them through API discovery,
so the verbs take any `apiVersion` and `kind` the cluster knows about. A
small reconcile loop over a made-up `Foo` resource looks like this:

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

## Informers

Listing everything on every pass gets expensive. An informer lists once,
then keeps a local copy current from a watch and calls your handlers as
things change. If the watch falls too far behind, the API server answers
410 Gone; the informer then lists again, works out what changed while it
was away, and fires `on_delete` for anything that disappeared.

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

[`pod_exec()`](https://ian-flores.github.io/rk8s/reference/pod_exec.md)
runs a command and gives you its output and exit code:

``` r

r <- pod_exec(k$client, "default", "nginx-abc", c("ls", "-la", "/"))
cat(r$stdout)
r$exit_code

# With stdin
pod_exec(k$client, "default", "nginx-abc", "cat", stdin_data = "hi\n")$stdout
```

For something interactive,
[`pod_exec_open()`](https://ian-flores.github.io/rk8s/reference/pod_exec_open.md)
returns a `PodExecSession` you can write to with `write_stdin()` and
read from with `on_stdout()`. Output only arrives while `wait()` or
`pump()` is running.

[`pod_port_forward()`](https://ian-flores.github.io/rk8s/reference/pod_port_forward.md)
works like `kubectl port-forward`:

``` r

fwd <- pod_port_forward(k$client, "default", "nginx-abc", remote_port = 80)
httr2::request(paste0("http://127.0.0.1:", fwd$port)) |> httr2::req_perform()
fwd$close()
```

Both need the `nanonext` package. They check the API server’s
certificate against the CA in your kubeconfig (or the system’s, if the
kubeconfig has none), and they log in with a token. Kind, minikube and
kubeadm give their default user a client certificate and no token, so
with those you’ll get an error until you use a token instead:

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

When you run more than one replica of a controller, you want only one of
them doing the work:

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

While your callback runs, a background process (started with `callr`)
keeps renewing the lease. If another replica takes the lease, or
renewals keep failing, the next `leader$check()` signals an
`rk8s_leadership_lost` condition.
[`run_as_leader()`](https://ian-flores.github.io/rk8s/reference/run_as_leader.md)
catches it, releases the lease and calls `on_stopped_leading`. Call
`leader$check()` at least once per `renew_deadline_seconds`; that’s what
keeps two replicas from acting as leader at the same time. If you’d
rather test than be interrupted, `leader$is_leader()` returns `TRUE` or
`FALSE`.

## Errors

When the API server returns an error, rk8s signals an `rk8s_api_error`
condition. Its `exception` field is an `ApiException` holding the HTTP
status, reason, headers and the parsed `Status` object.

``` r

pod <- tryCatch(
  kube_get(k, "pod", "nope"),
  rk8s_api_error = function(e) {
    if (e$exception$status == 404L) NULL else stop(e)
  }
)
```

## The generated API

The verbs cover common work. For everything else there are the generated
classes, one per API group and version, with methods named after the
official Python client’s. They all take the session’s `ApiClient`:

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

## Regenerating for a newer Kubernetes

The generated code comes from the OpenAPI spec in `tools/gen/spec/`. To
move to another release, download its spec and run the generator:

``` bash
curl -L -o tools/gen/spec/swagger.json \
  https://raw.githubusercontent.com/kubernetes/kubernetes/release-1.31/api/openapi-spec/swagger.json
Rscript tools/gen/generate.R tools/gen/spec/swagger.json R
R CMD build .
```

It writes about 700 R files of R6 classes and updates the generated part
of NAMESPACE (the lines between the sentinel comments).
