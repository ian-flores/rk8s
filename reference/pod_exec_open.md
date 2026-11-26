# Open an interactive exec session on a pod

Establishes a WebSocket to `/api/v1/namespaces/{ns}/pods/{name}/exec`
using the `v4.channel.k8s.io` subprotocol and returns a
[PodExecSession](https://ian-flores.github.io/rk8s/reference/PodExecSession.md)
you can write to / read from.

## Usage

``` r
pod_exec_open(
  client,
  namespace,
  name,
  command,
  container = NULL,
  stdin = FALSE,
  stdout = TRUE,
  stderr = TRUE,
  tty = FALSE
)
```

## Arguments

- client:

  An
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md)
  (typically `kube()$client`).

- namespace:

  Namespace of the pod.

- name:

  Pod name.

- command:

  Character vector: the command and its arguments.

- container:

  Optional container name (required if the pod has more than one
  container).

- stdin, stdout, stderr:

  Logical; which streams to enable (default stdout+stderr only).

- tty:

  Logical; allocate a TTY (combines stdout+stderr; supports terminal
  resize events).

## Value

A
[PodExecSession](https://ian-flores.github.io/rk8s/reference/PodExecSession.md).

## Details

Requires the `nanonext` package (a Suggests dependency). The API
server's certificate is verified against the kubeconfig CA (or the
system CA bundle) and its hostname is checked, unless the kubeconfig
sets `insecure-skip-tls-verify`. Authentication is a bearer token sent
in the `Authorization` header (token, token file, exec plugin or OIDC
users); users with only a client certificate get an error explaining the
alternatives, because the WebSocket client cannot present one.

## Examples

``` r
if (FALSE) { # \dontrun{
k <- kube()
s <- pod_exec_open(k$client, "default", "nginx-abc", c("/bin/sh"),
                    stdin = TRUE)
s$on_stdout(function(b) cat(rawToChar(b)))
s$write_stdin("ls -la\n")
s$close()
} # }
```
