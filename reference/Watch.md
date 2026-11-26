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

## Public fields

- `resource_version`:

  Last observed resourceVersion. Used to resume.

- `stop_requested`:

  Set to TRUE by `$stop()` to break the loop.

- `end_reason`:

  Why the last `stream()` call returned: `"stop"` (callback returned
  `FALSE` or `$stop()` was called), `"timeout"` (`timeout_seconds`
  elapsed), or `"gone"` (410 Gone with `return_on_gone = TRUE`).

## Methods

### Public methods

- [`Watch$stream()`](#method-Watch-stream)

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

### Method [`stop()`](https://rdrr.io/r/base/stop.html)

Ask the current `stream()` call to return.

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
} # }
```
