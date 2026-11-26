# Delete a resource

Delete a resource

## Usage

``` r
kube_delete(
  k,
  ref,
  name = NULL,
  namespace = k$namespace,
  grace_period = NULL,
  propagation_policy = NULL
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

- grace_period:

  Optional override for the default termination grace.

- propagation_policy:

  "Orphan", "Background", or "Foreground" (the default).

## Value

The server response.
