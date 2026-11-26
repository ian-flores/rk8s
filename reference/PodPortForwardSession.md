# Pod port-forward session

Pod port-forward session

Pod port-forward session

## Details

Returned by
[`pod_port_forward_open()`](https://ian-flores.github.io/rk8s/reference/pod_port_forward_open.md).
Holds an open WebSocket and routes bytes between the user and the
per-port data channels.

## Public fields

- `ports`:

  Forwarded remote ports (integer vector).

- `errors`:

  Per-port error strings populated from the kubelet's error channels.
  `errors[[as.character(port)]]` is `NA` until set.

## Methods

### Public methods

- [`PodPortForwardSession$new()`](#method-PodPortForwardSession-new)

- [`PodPortForwardSession$on_data()`](#method-PodPortForwardSession-on_data)

- [`PodPortForwardSession$write()`](#method-PodPortForwardSession-write)

- [`PodPortForwardSession$close()`](#method-PodPortForwardSession-close)

- [`PodPortForwardSession$is_closed()`](#method-PodPortForwardSession-is_closed)

- [`PodPortForwardSession$pump()`](#method-PodPortForwardSession-pump)

- [`PodPortForwardSession$wait()`](#method-PodPortForwardSession-wait)

- [`PodPortForwardSession$clone()`](#method-PodPortForwardSession-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    PodPortForwardSession$new(client, namespace, name, ports)

#### Arguments

- `client`:

  An
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

- `namespace, name, ports`:

  See
  [`pod_port_forward_open()`](https://ian-flores.github.io/rk8s/reference/pod_port_forward_open.md).

------------------------------------------------------------------------

### Method `on_data()`

Register a per-port data callback.

#### Usage

    PodPortForwardSession$on_data(port, fn)

#### Arguments

- `port`:

  Remote port (must have been requested at open time).

- `fn`:

  `function(raw)` called with each chunk received.

------------------------------------------------------------------------

### Method [`write()`](https://rdrr.io/r/base/write.html)

Send bytes to a remote port.

#### Usage

    PodPortForwardSession$write(port, data)

#### Arguments

- `port`:

  Remote port.

- `data`:

  Character or raw vector.

------------------------------------------------------------------------

### Method [`close()`](https://rdrr.io/r/base/connections.html)

Close the WebSocket.

#### Usage

    PodPortForwardSession$close()

------------------------------------------------------------------------

### Method `is_closed()`

`TRUE` once the WebSocket has closed (either side).

#### Usage

    PodPortForwardSession$is_closed()

------------------------------------------------------------------------

### Method `pump()`

Dispatch frames that arrive within `timeout` seconds to the `on_data()`
callbacks.

#### Usage

    PodPortForwardSession$pump(timeout = 0)

#### Arguments

- `timeout`:

  Seconds to wait for a frame (default 0, i.e. ~1 ms).

#### Returns

`TRUE` while the session is open, invisibly.

------------------------------------------------------------------------

### Method `wait()`

Block until the WebSocket closes or `timeout` elapses, dispatching
frames in the meantime.

#### Usage

    PodPortForwardSession$wait(timeout = 60)

#### Arguments

- `timeout`:

  Seconds.

#### Returns

`TRUE` if the session ended naturally; `FALSE` on timeout.

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    PodPortForwardSession$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
