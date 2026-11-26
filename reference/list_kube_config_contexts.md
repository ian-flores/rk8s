# List contexts in a kubeconfig

List contexts in a kubeconfig

## Usage

``` r
list_kube_config_contexts(config_file = NULL)
```

## Arguments

- config_file:

  Path to a kubeconfig. Defaults to `$KUBECONFIG` (merged as described
  above) or `~/.kube/config`.

## Value

A list with elements `contexts` (list of context entries) and
`current_context` (name of the current context, or `NULL`).
