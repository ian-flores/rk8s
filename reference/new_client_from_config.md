# Shorthand for loading config + constructing an [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

Shorthand for loading config + constructing an
[ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

## Usage

``` r
new_client_from_config(config_file = NULL, context = NULL)
```

## Arguments

- config_file:

  Path to a kubeconfig. Defaults to `$KUBECONFIG` (merged as described
  above) or `~/.kube/config`.

- context:

  Context name. Defaults to the kubeconfig's `current-context`.

## Value

An
[ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

## Examples

``` r
if (FALSE) { # \dontrun{
client <- new_client_from_config()
CoreV1Api$new(client)$list_namespace()
} # }
```
