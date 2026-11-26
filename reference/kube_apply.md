# Server-side apply a manifest

Accepts a YAML/JSON file path, a YAML/JSON string, an R `list`, or a
generated model (e.g. `V1Deployment`). Sends a PATCH with
`Content-Type: application/apply-patch+yaml`, which is k8s "server-side
apply". Multi-document YAML is supported.

## Usage

``` r
kube_apply(
  k,
  manifest,
  namespace = k$namespace,
  field_manager = k$field_manager,
  force = FALSE
)
```

## Arguments

- k:

  A [Kube](https://ian-flores.github.io/rk8s/reference/Kube.md) session.

- manifest:

  Path, string, list, or model object.

- namespace:

  Default namespace for documents that don't specify one.

- field_manager:

  Field manager (defaults to `k$field_manager`).

- force:

  Resolve conflicts by overwriting other field managers.

## Value

Invisibly, a list of server responses (one per document).

## Examples

``` r
if (FALSE) { # \dontrun{
k <- kube()
kube_apply(k, "deployment.yaml")
kube_apply(k, list(
  apiVersion = "v1", kind = "ConfigMap",
  metadata = list(name = "demo"),
  data = list(hello = "world")
))
} # }
```
