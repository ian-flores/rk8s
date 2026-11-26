# Kubernetes client configuration

Kubernetes client configuration

Kubernetes client configuration

## Details

A transport + authentication bundle. Populated by
[`load_kube_config()`](https://ian-flores.github.io/rk8s/reference/load_kube_config.md)
or
[`load_incluster_config()`](https://ian-flores.github.io/rk8s/reference/load_incluster_config.md),
or constructed directly for tests.

Mirrors `kubernetes.client.Configuration` from the Python client and the
`rest.Config` struct from client-go.

## Public fields

- `host`:

  API server URL (e.g. "https://10.0.0.1:6443").

- `api_key`:

  Named list of API-key-style headers, e.g.
  `list(authorization = "Bearer ...")`.

- `username`:

  HTTP basic auth username.

- `password`:

  HTTP basic auth password.

- `ssl_ca_cert`:

  Path to a PEM CA bundle.

- `cert_file`:

  Path to a PEM client cert.

- `key_file`:

  Path to the PEM client key.

- `verify_ssl`:

  Verify server TLS certs (logical).

- `proxy`:

  Optional proxy URL.

- `user_agent`:

  User-Agent header.

- `exec`:

  Optional `list(command, args, env, apiVersion)` exec plugin.

- `token_file`:

  Optional path to a file holding a bearer token (reread on each request
  to handle rotation - matches in-cluster behaviour).

- `context_name`:

  Name of the kubeconfig context used, for reference.

- `timeout`:

  Optional per-request timeout in seconds for ordinary (non-streaming)
  calls. Watches and log streams are not affected.

- `max_retries`:

  How many times ordinary requests are retried on HTTP 429 (any method,
  honouring `Retry-After`) and, for GET/HEAD, on 500/502/503/504 or
  connection failures, with jittered exponential backoff. `0` disables
  retries.

- `namespace`:

  Default namespace from the kubeconfig context (or the in-cluster
  service account), or `NULL`.

- `tls_server_name`:

  Server name to use for TLS SNI and certificate verification instead of
  the host in `host` (kubeconfig `tls-server-name`).

- `auth_provider`:

  OIDC `auth-provider` settings from the kubeconfig
  (`list(name = "oidc", config = ...)`), or `NULL`.

- `exec_cluster`:

  Cluster details handed to an exec plugin that sets
  `provideClusterInfo: true` (filled in by
  [`load_kube_config()`](https://ian-flores.github.io/rk8s/reference/load_kube_config.md)).

## Methods

### Public methods

- [`Configuration$new()`](#method-Configuration-new)

- [`Configuration$bearer_token()`](#method-Configuration-bearer_token)

- [`Configuration$client_cert()`](#method-Configuration-client_cert)

- [`Configuration$refresh_credentials()`](#method-Configuration-refresh_credentials)

- [`Configuration$clone()`](#method-Configuration-clone)

------------------------------------------------------------------------

### Method `new()`

Construct a Configuration. All arguments are optional.

#### Usage

    Configuration$new(
      host = NULL,
      api_key = NULL,
      username = NULL,
      password = NULL,
      ssl_ca_cert = NULL,
      cert_file = NULL,
      key_file = NULL,
      verify_ssl = TRUE,
      proxy = NULL,
      user_agent = "rk8s/0.2.0",
      exec = NULL,
      token_file = NULL,
      context_name = NULL,
      timeout = NULL
    )

#### Arguments

- `host, api_key, username, password, ssl_ca_cert, cert_file, key_file`:

  See fields of the same name.

- `verify_ssl, proxy, user_agent, exec, token_file, context_name, timeout`:

  Likewise.

------------------------------------------------------------------------

### Method `bearer_token()`

Return the current bearer token, refreshing via the exec plugin or token
file if configured.

#### Usage

    Configuration$bearer_token()

------------------------------------------------------------------------

### Method `client_cert()`

Client certificate and key files to present, if any. An exec plugin that
returns a certificate takes precedence over `cert_file`/`key_file`.

#### Usage

    Configuration$client_cert()

#### Returns

`list(cert_file, key_file)`; elements may be `NULL`.

------------------------------------------------------------------------

### Method `refresh_credentials()`

Drop cached exec-plugin credentials so the next request runs the plugin
again (called automatically on HTTP 401).

#### Usage

    Configuration$refresh_credentials()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    Configuration$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

## Examples

``` r
# In-memory config - typical tests or ad-hoc use against a known endpoint.
cfg <- Configuration$new(
  host = "https://10.0.0.1:6443",
  api_key = list(authorization = "Bearer <token>"),
  verify_ssl = FALSE
)
cfg$bearer_token()
#> [1] "<token>"
```
