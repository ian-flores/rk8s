# Pod exec session

Pod exec session

Pod exec session

## Details

Returned by
[`pod_exec_open()`](https://ian-flores.github.io/rk8s/reference/pod_exec_open.md).
Carries an open WebSocket; demuxes the v4.channel.k8s.io subprotocol;
routes server-to-client frames to user callbacks; sends client-to-server
frames via `write_stdin()`/`resize()`. Incoming frames are dispatched
while `wait()` or `pump()` runs.

## Public fields

- `exit_code`:

  Exit code reported by the kubelet on `error` channel, or `NA_integer_`
  if the session ended without one.

- `error`:

  Last error condition (a `metav1.Status` parsed list), or `NULL`.

## Methods

### Public methods

- [`PodExecSession$new()`](#method-PodExecSession-new)

- [`PodExecSession$on_stdout()`](#method-PodExecSession-on_stdout)

- [`PodExecSession$on_stderr()`](#method-PodExecSession-on_stderr)

- [`PodExecSession$on_error()`](#method-PodExecSession-on_error)

- [`PodExecSession$on_close()`](#method-PodExecSession-on_close)

- [`PodExecSession$write_stdin()`](#method-PodExecSession-write_stdin)

- [`PodExecSession$resize()`](#method-PodExecSession-resize)

- [`PodExecSession$close_stdin()`](#method-PodExecSession-close_stdin)

- [`PodExecSession$close()`](#method-PodExecSession-close)

- [`PodExecSession$pump()`](#method-PodExecSession-pump)

- [`PodExecSession$wait()`](#method-PodExecSession-wait)

- [`PodExecSession$clone()`](#method-PodExecSession-clone)

------------------------------------------------------------------------

### Method `new()`

Construct. Usually you call
[`pod_exec_open()`](https://ian-flores.github.io/rk8s/reference/pod_exec_open.md)
instead.

#### Usage

    PodExecSession$new(
      client,
      namespace,
      name,
      command,
      container,
      stdin,
      stdout,
      stderr,
      tty
    )

#### Arguments

- `client`:

  An
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

- `namespace, name, command, container, stdin, stdout, stderr, tty`:

  See
  [`pod_exec_open()`](https://ian-flores.github.io/rk8s/reference/pod_exec_open.md).

------------------------------------------------------------------------

### Method `on_stdout()`

Register a stdout callback; receives raw chunks.

#### Usage

    PodExecSession$on_stdout(fn)

#### Arguments

- `fn`:

  `function(raw)`: the byte payload (no channel prefix).

------------------------------------------------------------------------

### Method `on_stderr()`

Register a stderr callback.

#### Usage

    PodExecSession$on_stderr(fn)

#### Arguments

- `fn`:

  `function(raw)`.

------------------------------------------------------------------------

### Method `on_error()`

Register a callback fired when the kubelet's `error` channel reports a
`metav1.Status` (typically at session end with the exit code; or earlier
on container failure).

#### Usage

    PodExecSession$on_error(fn)

#### Arguments

- `fn`:

  `function(status_list)`.

------------------------------------------------------------------------

### Method `on_close()`

Register a close callback; fired once the WebSocket transitions to
closed.

#### Usage

    PodExecSession$on_close(fn)

#### Arguments

- `fn`:

  `function()`.

------------------------------------------------------------------------

### Method `write_stdin()`

Send bytes to the remote stdin.

#### Usage

    PodExecSession$write_stdin(data)

#### Arguments

- `data`:

  Character or raw vector.

------------------------------------------------------------------------

### Method `resize()`

Resize the remote TTY. Only meaningful when `tty=TRUE`.

#### Usage

    PodExecSession$resize(width, height)

#### Arguments

- `width, height`:

  Integers (columns and rows).

------------------------------------------------------------------------

### Method `close_stdin()`

Signal EOF on the remote stdin. Needs the `v5.channel.k8s.io`
subprotocol (Kubernetes 1.29+), which is offered first; servers that
only speak v4 have no way to close stdin and ignore the message, so a
command reading stdin to EOF keeps running until the session is closed.

#### Usage

    PodExecSession$close_stdin()

------------------------------------------------------------------------

### Method [`close()`](https://rdrr.io/r/base/connections.html)

Close the WebSocket.

#### Usage

    PodExecSession$close()

------------------------------------------------------------------------

### Method `pump()`

Dispatch frames that arrive within `timeout` seconds to the registered
callbacks. Returns as soon as the first frame (and any already queued
behind it) has been handled, or after `timeout`.

#### Usage

    PodExecSession$pump(timeout = 0)

#### Arguments

- `timeout`:

  Seconds to wait for a frame (default 0, i.e. ~1 ms).

#### Returns

`TRUE` while the session is open, invisibly.

------------------------------------------------------------------------

### Method `wait()`

Block until the session closes or `timeout` elapses, dispatching frames
in the meantime.

#### Usage

    PodExecSession$wait(timeout = 60)

#### Arguments

- `timeout`:

  Seconds (default 60).

#### Returns

`TRUE` if the session ended naturally; `FALSE` on timeout.

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    PodExecSession$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
