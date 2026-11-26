# Record an event about an object

Creates a core/v1 Event, which `kubectl describe` and
`kubectl get events` show next to the object. Use it to say what the
controller did or why it could not.

## Usage

``` r
kube_event(
  k,
  obj,
  reason,
  message,
  type = c("Normal", "Warning"),
  component = k$field_manager %||% "rk8s"
)
```

## Arguments

- k:

  A [Kube](https://ian-flores.github.io/rk8s/reference/Kube.md) session.

- obj:

  The object the event is about, as returned by
  [`kube_get()`](https://ian-flores.github.io/rk8s/reference/kube_get.md).

- reason:

  A short CamelCase reason, e.g. `"Created"`, `"Failed"`.

- message:

  A human-readable sentence.

- type:

  `"Normal"` or `"Warning"`.

- component:

  Who is reporting (default: the session's field manager).

## Value

The created Event.

## Examples

``` r
if (FALSE) { # \dontrun{
kube_event(k, site, "Deployed", "Deployment blog is ready")
kube_event(k, site, "InvalidSpec", "spec.replicas must be positive",
           type = "Warning")
} # }
```
