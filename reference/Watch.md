# Watch a Kubernetes list endpoint

Watch a Kubernetes list endpoint

Watch a Kubernetes list endpoint

## Details

Streams watch events (ADDED/MODIFIED/DELETED/BOOKMARK/ERROR) from any
list endpoint that supports `?watch=true`. Mirrors the Python client's
`kubernetes.watch.Watch` and client-go's `watch.Interface`.

The server returns line-delimited JSON; each line is a `WatchEvent` with
`type` and `object` fields. The `object`'s `resourceVersion` is tracked
so the stream can be resumed after a 410 Gone.

There are two ways to consume a watch:

- `$stream()` blocks and calls a callback for each event.

- `$open()`, then `$poll()` repeatedly, then `$close()`. `poll()`
  returns the events that have arrived (waiting at most `max_wait`
  seconds), so a single R process can drive several watches from one
  loop. When the server ends a connection normally, `poll()` reconnects
  from the last resourceVersion, so callers see one continuous stream.

## Public fields

- `resource_version`:

  Last observed resourceVersion. Used to resume.

- `stop_requested`:

  Set to TRUE by `$stop()` to break the loop.

- `end_reason`:

  Why the watch ended: `"stop"` (the callback returned `FALSE`, or
  `$stop()` / `$close()` was called), `"timeout"` (`timeout_seconds`
  elapsed), or `"gone"` (410 Gone with `return_on_gone = TRUE`). `NULL`
  while the watch is open.

## Methods

### Public methods

- [`Watch$stream()`](#method-Watch-stream)

- [`Watch$open()`](#method-Watch-open)

- [`Watch$poll()`](#method-Watch-poll)

- [`Watch$is_open()`](#method-Watch-is_open)

- [`Watch$close()`](#method-Watch-close)

- [`Watch$stop()`](#method-Watch-stop)

- [`Watch$clone()`](#method-Watch-clone)

------------------------------------------------------------------------

### Method `stream()`

Stream events to a callback.

#### Usage

    Watch$stream(
      client,
      resource_path,
      query_params = list(),
      callback,
      timeout_seconds = NULL,
      resource_version = NULL,
      return_on_gone = FALSE
    )

#### Arguments

- `client`:

  An
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

- `resource_path`:

  Path template for the list endpoint, with path parameters already
  substituted (e.g. "/api/v1/namespaces/default/pods").

- `query_params`:

  Additional query parameters (label selectors etc.). `watch=true` is
  added automatically.

- `callback`:

  Function `function(type, object)` invoked for each event. Return
  `FALSE` to stop the stream.

- `timeout_seconds`:

  Total wall-clock budget for the whole call. The stream reconnects
  after normal server hang-ups while time remains and returns once it is
  spent, even if no events arrive. `NULL` (default) watches until the
  callback returns `FALSE` or `$stop()` is called.

- `resource_version`:

  Starting resourceVersion (defaults to last seen).

- `return_on_gone`:

  If `TRUE`, return with `end_reason = "gone"` on 410 Gone so the caller
  can re-list (this is what
  [Informer](https://ian-flores.github.io/rk8s/reference/Informer.md)
  does). If `FALSE` (default), restart the watch without a
  resourceVersion, which replays the current state as `ADDED` events but
  cannot report objects deleted while the watch was disconnected.

------------------------------------------------------------------------

### Method [`open()`](https://rdrr.io/r/base/connections.html)

Open the watch for polling with `$poll()`.

#### Usage

    Watch$open(
      client,
      resource_path,
      query_params = list(),
      resource_version = NULL,
      timeout_seconds = NULL,
      server_timeout = NULL,
      return_on_gone = FALSE
    )

#### Arguments

- `client, resource_path, query_params, resource_version, return_on_gone`:

  As for `$stream()`.

- `timeout_seconds`:

  Optional overall limit; once it passes, `poll()` closes the watch with
  `end_reason = "timeout"`.

- `server_timeout`:

  Optional `timeoutSeconds` for each connection. The server ends the
  connection after this long and `poll()` reconnects. `NULL` leaves it
  to the server (usually 30-60 minutes).

------------------------------------------------------------------------

### Method `poll()`

Return the events that have arrived, waiting up to `max_wait` seconds
for the first one.

#### Usage

    Watch$poll(max_wait = 0)

#### Arguments

- `max_wait`:

  Seconds to wait when nothing is pending (default 0: just collect what
  is already there).

#### Returns

A list of events, each `list(type, object, resource_version)`. Empty
when nothing arrived or the watch is closed.

------------------------------------------------------------------------

### Method `is_open()`

Is the watch open (for polling)?

#### Usage

    Watch$is_open()

------------------------------------------------------------------------

### Method [`close()`](https://rdrr.io/r/base/connections.html)

Close a watch opened with `$open()`.

#### Usage

    Watch$close()

------------------------------------------------------------------------

### Method [`stop()`](https://rdrr.io/r/base/stop.html)

Ask the watch to end: `$stream()` returns after the current event, and
the next `$poll()` closes the watch.

#### Usage

    Watch$stop()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    Watch$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

## Examples

``` r
if (FALSE) { # \dontrun{
client <- new_client_from_config()
w <- Watch$new()
w$stream(
  client,
  resource_path = "/api/v1/namespaces/default/pods",
  callback = function(type, object) {
    cat(type, object$metadata$name, "\n")
    TRUE  # keep watching
  },
  timeout_seconds = 30
)

# Polling
w <- Watch$new()
w$open(client, "/api/v1/namespaces/default/pods")
repeat {
  for (e in w$poll(1)) cat(e$type, e$object$metadata$name, "\n")
}
} # }
```
