# Stream pod logs

Stream pod logs

## Usage

``` r
kube_logs(
  k,
  pod,
  namespace = k$namespace,
  container = NULL,
  tail = NULL,
  follow = FALSE,
  previous = FALSE,
  since_seconds = NULL
)
```

## Arguments

- k:

  A [Kube](https://ian-flores.github.io/rk8s/reference/Kube.md) session.

- pod:

  Pod name.

- namespace:

  Namespace.

- container:

  Optional container name (required for multi-container pods).

- tail:

  Optional integer; only the last N lines.

- follow:

  If `TRUE`, stream until the pod exits or the connection drops.

- previous:

  If `TRUE`, fetch logs from a previously-terminated container.

- since_seconds:

  Only return logs newer than this many seconds.

## Value

A character string with the log content (or invisible NULL when
`follow=TRUE`, with content emitted via
[`cat()`](https://rdrr.io/r/base/cat.html)).

## Examples

``` r
if (FALSE) { # \dontrun{
k <- kube()
cat(kube_logs(k, "nginx-abc", namespace = "default", tail = 50))
} # }
```
