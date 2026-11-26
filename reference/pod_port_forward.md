# Forward a pod port to a local TCP listener (kubectl-style)

Stands up a local TCP server bound to `127.0.0.1` and bridges every
accepted connection to a port on a pod via a
[PodPortForwardSession](https://ian-flores.github.io/rk8s/reference/PodPortForwardSession.md)
running in a `callr` child process. Returns immediately; the bridge
lives until you call `$close()`.

## Usage

``` r
pod_port_forward(client, namespace, name, remote_port, local_port = 0)
```

## Arguments

- client:

  An
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

- namespace, name:

  Pod coordinates.

- remote_port:

  Pod-side port to connect to.

- local_port:

  Local port to bind. `0` (default) picks a random ephemeral port; the
  chosen port is exposed as `$port` on the result.

## Value

A `PortForwardBridge` with fields `port` (the local port), `process`
(the `callr` background handle), and a `$close()` method.

## Details

Equivalent to `kubectl port-forward pod/<name> <local>:<remote>`.

## Examples

``` r
if (FALSE) { # \dontrun{
k <- kube()
fwd <- pod_port_forward(k$client, "default", "nginx-abc", remote_port = 80)
Sys.sleep(0.5)
httr2::request(paste0("http://127.0.0.1:", fwd$port)) |> httr2::req_perform()
fwd$close()
} # }
```
