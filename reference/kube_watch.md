# Watch a resource

Watch a resource

## Usage

``` r
kube_watch(
  k,
  ref,
  on_event,
  namespace = k$namespace,
  label_selector = NULL,
  field_selector = NULL,
  resource_version = NULL,
  timeout_seconds = NULL
)
```

## Arguments

- k:

  A [Kube](https://ian-flores.github.io/rk8s/reference/Kube.md) session.

- ref:

  Resource ref.

- on_event:

  Callback `function(type, object)`. Return `FALSE` to stop.

- namespace:

  Namespace (`NULL` for all-namespaces watch on namespaced resources, or
  for cluster-scoped resources).

- label_selector, field_selector:

  Optional selectors.

- resource_version:

  Starting resourceVersion.

- timeout_seconds:

  Wall-clock cap.

## Value

Invisibly, the underlying
[Watch](https://ian-flores.github.io/rk8s/reference/Watch.md) object (so
callers can `$stop()`).

## Examples

``` r
if (FALSE) { # \dontrun{
k <- kube()
kube_watch(k, "pods",
           on_event = function(type, obj) {
             message(type, " ", obj$metadata$name); TRUE
           },
           timeout_seconds = 30)
} # }
```
