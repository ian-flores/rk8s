# Open a port-forward session to a pod

Establishes a WebSocket to
`/api/v1/namespaces/{ns}/pods/{name}/portforward` and returns a
[PodPortForwardSession](https://ian-flores.github.io/rk8s/reference/PodPortForwardSession.md).
Unlike `kubectl port-forward`, this does **not** stand up a local TCP
listener; instead it exposes a programmatic `write(port, bytes)` /
`on_data(port, fn)` API. That's the direct mapping of the websocket
protocol and matches the Python client's `PortForward`.

## Usage

``` r
pod_port_forward_open(client, namespace, name, ports)
```

## Arguments

- client:

  An
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

- namespace, name:

  Pod coordinates.

- ports:

  Integer vector of remote ports to forward (e.g. `c(80, 443)`).

## Value

A
[PodPortForwardSession](https://ian-flores.github.io/rk8s/reference/PodPortForwardSession.md).

## Details

Requires the `nanonext` package. TLS verification and authentication
work as described for
[`pod_exec_open()`](https://ian-flores.github.io/rk8s/reference/pod_exec_open.md).

## Examples

``` r
if (FALSE) { # \dontrun{
k <- kube()
pf <- pod_port_forward_open(k$client, "default", "nginx-abc", ports = 80)
pf$on_data(80, function(b) cat(rawToChar(b)))
pf$write(80, charToRaw("GET / HTTP/1.1\r\nHost: x\r\nConnection: close\r\n\r\n"))
pf$wait(timeout = 5)
pf$close()
} # }
```
