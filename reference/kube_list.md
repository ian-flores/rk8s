# List a resource (always; never returns a single object)

Convenience wrapper over
[`kube_get()`](https://ian-flores.github.io/rk8s/reference/kube_get.md)
that ignores any embedded name in `ref`.

## Usage

``` r
kube_list(
  k,
  ref,
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

- namespace:

  Namespace (defaults to `k$namespace`).

- label_selector, field_selector:

  Optional selectors for list calls.

- ...:

  Extra query parameters passed through to the API.

## Value

A `*List` envelope.
