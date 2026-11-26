# Load configuration from the in-cluster service account

Uses the CA bundle and token mounted at
`/var/run/secrets/kubernetes.io/serviceaccount/` and the
`KUBERNETES_SERVICE_HOST`/`KUBERNETES_SERVICE_PORT` env vars, matching
the semantics of `kubernetes.config.load_incluster_config()` and
client-go's `rest.InClusterConfig()`.

## Usage

``` r
load_incluster_config()
```

## Value

A
[Configuration](https://ian-flores.github.io/rk8s/reference/Configuration.md).

## Examples

``` r
if (FALSE) { # \dontrun{
client <- ApiClient$new(load_incluster_config())
} # }
```
