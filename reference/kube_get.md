# Get one or many Kubernetes resources

If `name` is given (or embedded in `ref` as `"kind/name"`), returns a
single object. Otherwise lists the collection.

## Usage

``` r
kube_get(
  k,
  ref,
  name = NULL,
  namespace = k$namespace,
  label_selector = NULL,
  field_selector = NULL,
  ...
)
```

## Arguments

- k:

  A [Kube](https://ian-flores.github.io/rk8s/reference/Kube.md) session.

- ref:

  Resource ref - kind alias (`"pods"`), `"kind/name"`, or explicit
  `"apiVersion:Kind"` / `c(apiVersion, Kind)`.

- name:

  Optional resource name (overrides any name in `ref`).

- namespace:

  Namespace (defaults to `k$namespace`).

- label_selector, field_selector:

  Optional selectors for list calls.

- ...:

  Extra query parameters passed through to the API.

## Value

A list (one object when fetching by name; a `*List` envelope otherwise)
carrying the server response. Wrap with
[`as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html) or
[`tibble::as_tibble()`](https://tibble.tidyverse.org/reference/as_tibble.html)
for tabular display.

## Examples

``` r
if (FALSE) { # \dontrun{
k <- kube()
kube_get(k, "pods", namespace = "default")
kube_get(k, "pod", "nginx-abc", namespace = "default")
kube_get(k, "deployment/nginx", namespace = "default")
kube_get(k, "apps/v1:Deployment", namespace = "default")
} # }
```
