# Load configuration from a kubeconfig file

Mirrors `kubernetes.config.load_kube_config()` from the Python client.
Reads the kubeconfig YAML, selects a context, and returns a populated
[Configuration](https://ian-flores.github.io/rk8s/reference/Configuration.md).

## Usage

``` r
load_kube_config(config_file = NULL, context = NULL, persist_config = FALSE)
```

## Arguments

- config_file:

  Path to a kubeconfig. Defaults to `$KUBECONFIG` (merged as described
  above) or `~/.kube/config`.

- context:

  Context name. Defaults to the kubeconfig's `current-context`.

- persist_config:

  If `TRUE`, write refreshed OIDC tokens back to the kubeconfig file
  that defined the user (like the Python client). The default `FALSE`
  never modifies kubeconfig files.

## Value

A
[Configuration](https://ian-flores.github.io/rk8s/reference/Configuration.md).

## Details

Like `kubectl`, a `$KUBECONFIG` holding several paths (separated by `:`,
or `;` on Windows) is merged: for clusters, users and contexts the first
file that defines a name wins, `current-context` comes from the first
file that sets it, and relative paths resolve against the file they
appear in. Missing files in the list are ignored.

Supported authentication: bearer `token` / `tokenFile`, client
certificates (file or inline data), basic auth, `exec` credential
plugins (including `provideClusterInfo`), and the `oidc` `auth-provider`
(the id-token is refreshed with the refresh-token when it expires). The
cluster's `proxy-url`, `tls-server-name` and `insecure-skip-tls-verify`
and the context's `namespace` are honoured.

## Examples

``` r
if (FALSE) { # \dontrun{
cfg <- load_kube_config()                        # ~/.kube/config
cfg <- load_kube_config(context = "my-dev")      # pick a context
cfg <- load_kube_config("~/configs/prod.yaml")   # alternate file
client <- ApiClient$new(cfg)
} # }
```
