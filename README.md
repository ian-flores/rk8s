# rk8s — Kubernetes client for R

`rk8s` is an R port of the official [Kubernetes Python client][py] and
[Go `client-go`][go]. Like those, it combines a hand-written runtime
(configuration, authentication, watch, dynamic client, utilities) with
typed API and model classes code-generated from the Kubernetes OpenAPI
spec.

- **635 model classes** (`V1Pod`, `V1Deployment`, `V1ConfigMap`, …) with
  `to_list()` / `from_list()` round-tripping.
- **62 typed API classes** (`CoreV1Api`, `AppsV1Api`, `BatchV1Api`,
  `NetworkingV1Api`, …) covering **944 operations**.
- **`DynamicClient`** for CustomResources and any resource you'd rather
  not import a typed class for.
- **`Watch`** for streaming list endpoints with resourceVersion
  resumption.
- **`load_kube_config()`** / **`load_incluster_config()`** with bearer
  tokens, client certificates (inline or on-disk), token files, and
  exec credential plugins (EKS / GKE).

## Install

```r
# remotes::install_github("your-org/rk8s")
install.packages("rk8s_0.1.0.tar.gz", repos = NULL)
```

Depends on `R6`, `httr2`, `jsonlite`, `yaml`, `openssl`, `base64enc`,
`curl`.

## Quickstart

```r
library(rk8s)

client <- new_client_from_config()          # reads ~/.kube/config
core   <- CoreV1Api$new(client)

# List pods across all namespaces
pods <- V1PodList$from_list(core$list_pod_for_all_namespaces())
for (p in pods$items) {
  cat(p$metadata$namespace, "/", p$metadata$name, " - ",
      p$status$phase, "\n", sep = "")
}

# Create a Deployment
apps <- AppsV1Api$new(client)
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
apps$create_namespaced_deployment(namespace = "default", body = dep)
```

See [`inst/examples/`](inst/examples/) for more: `list_pods.R`,
`create_deployment.R`, `watch_pods.R`, `dynamic_crd.R`, `apply_yaml.R`.

## Authentication

`load_kube_config()` understands everything `kubectl` does:

- bearer tokens (`users.user.token` / `users.user.tokenFile`)
- basic auth (`users.user.username` / `password`)
- inline base64 client certs (`client-certificate-data`, `client-key-data`,
  `certificate-authority-data`)
- on-disk PEM files (absolute, or relative to the kubeconfig dir)
- `exec` credential plugins with output caching (EKS, GKE, OIDC, etc.)
- `insecure-skip-tls-verify`

For in-cluster workloads:

```r
client <- ApiClient$new(load_incluster_config())
```

## Watching

```r
w <- Watch$new()
w$stream(
  client,
  resource_path = "/api/v1/namespaces/default/pods",
  callback = function(type, object) {
    cat(type, object$metadata$name, "\n")
    TRUE
  }
)
```

Reconnects automatically on 410 Gone; the loop exits when the callback
returns `FALSE` or `$stop()` is called.

## Dynamic client

For CustomResources or when you want to avoid importing a typed class:

```r
dc <- DynamicClient$new(client)
foos <- dc$resource("example.com/v1", "Foo")
foos$list(namespace = "default")
foos$get("my-foo", namespace = "default")
foos$create(list(apiVersion = "example.com/v1", kind = "Foo",
                  metadata = list(name = "my-foo"),
                  spec = list(bar = 1)),
             namespace = "default")
```

## Regenerating from the OpenAPI spec

The typed classes under `R/gen_model_*.R` and `R/gen_api_*.R` are
produced from the Kubernetes OpenAPI v2 specification by the generator
in [`tools/gen/`](tools/gen/). **Do not hand-edit generated files.** To
update to a newer Kubernetes version:

```bash
# Fetch the desired spec (example: release-1.31)
curl -L -o tools/gen/spec/swagger.json \
  https://raw.githubusercontent.com/kubernetes/kubernetes/release-1.31/api/openapi-spec/swagger.json

# Regenerate
Rscript tools/gen/generate.R tools/gen/spec/swagger.json R

# Rebuild
R CMD build .
```

The generator is ~430 lines of R; the architectural split (hand-written
runtime vs. generated API/models) matches the Python client, so the same
OpenAPI spec that drives `kubernetes-client/python` drives `rk8s`.

## Design

| Concern                | Hand-written (`R/*.R`)                 | Generated (`R/gen_*.R`)               |
| ---------------------- | -------------------------------------- | ------------------------------------- |
| HTTP transport / auth  | `ApiClient`, `Configuration`           | —                                     |
| Config loading         | `load_kube_config`, `_incluster`, exec | —                                     |
| Exceptions             | `ApiException`                         | —                                     |
| Watch                  | `Watch`                                | —                                     |
| Dynamic / discovery    | `DynamicClient`, `DynamicResource`     | —                                     |
| YAML apply / quantity  | `create_from_yaml`, `parse_quantity`   | —                                     |
| Typed API classes      | —                                      | `CoreV1Api`, `AppsV1Api`, … (62)     |
| Model classes          | —                                      | `V1Pod`, `V1Deployment`, … (635)     |

## License

Apache 2.0.

[py]: https://github.com/kubernetes-client/python
[go]: https://github.com/kubernetes/client-go
