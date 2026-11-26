# Shared Informer - local cache of a resource, kept in sync via watch

Shared Informer - local cache of a resource, kept in sync via watch

Shared Informer - local cache of a resource, kept in sync via watch

## Details

An `Informer` performs an initial list of a resource, then watches for
subsequent changes and maintains a local cache keyed by `namespace/name`
(or just `name` for cluster-scoped resources). Event handlers fire on
add/update/delete.

This is the R equivalent of client-go's `SharedIndexInformer`. Informers
are the canonical way to build controllers: one watch feeds many
handlers and many
[Lister](https://ian-flores.github.io/rk8s/reference/Lister.md) views,
without each consumer re-listing the API server.

Lifecycle:

- `$run(stop_seconds = NULL)` - block, streaming events into the cache.
  Returns when `stop_seconds` of wall-clock time elapse (whether or not
  events arrive) or `$stop()` is called from a handler. Safe to
  re-invoke; the informer resumes from the last observed
  resourceVersion.

- `$start()`, then `$poll(max_wait)` in your own loop, then `$close()` -
  the same work without blocking, so one process can drive several
  informers (and other work) from a single loop. `poll()` handles events
  that have arrived, firing handlers, and returns.

- On 410 Gone (the watch fell too far behind), the informer re-lists and
  reconciles the cache against the fresh list: objects that disappeared
  fire `on_delete`, new ones `on_add`, and changed ones (different
  `resourceVersion`) `on_update`.

- Lists are fetched in pages of `page_size` items (`limit`/`continue`).

- `$has_synced()` - `TRUE` once the initial list has been absorbed.

- `$lister()` - return a
  [Lister](https://ian-flores.github.io/rk8s/reference/Lister.md) view
  over the current cache snapshot.

## Public fields

- `client`:

  The backing
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

- `resource_path`:

  Path template (no `{namespace}`/`{name}` unresolved).

- `object_from_list`:

  Optional constructor `function(list) -> R6`; when supplied, cached
  objects are R6 instances. Otherwise raw lists.

- `resource_version`:

  Last observed resourceVersion (used to resume).

## Methods

### Public methods

- [`Informer$new()`](#method-Informer-new)

- [`Informer$add_event_handler()`](#method-Informer-add_event_handler)

- [`Informer$start()`](#method-Informer-start)

- [`Informer$poll()`](#method-Informer-poll)

- [`Informer$close()`](#method-Informer-close)

- [`Informer$run()`](#method-Informer-run)

- [`Informer$stop()`](#method-Informer-stop)

- [`Informer$has_synced()`](#method-Informer-has_synced)

- [`Informer$lister()`](#method-Informer-lister)

- [`Informer$list()`](#method-Informer-list)

- [`Informer$clone()`](#method-Informer-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    Informer$new(
      client,
      resource_path,
      query_params = list(),
      object_from_list = NULL,
      page_size = 500L
    )

#### Arguments

- `client`:

  An
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

- `resource_path`:

  Collection path, e.g. "/api/v1/namespaces/default/pods" or
  "/api/v1/pods" for all-namespaces.

- `query_params`:

  Extra query parameters (e.g. `list(labelSelector = ...)`).

- `object_from_list`:

  Optional `from_list` constructor.

- `page_size`:

  Items per list page (`limit`); `NULL` disables paging.

------------------------------------------------------------------------

### Method `add_event_handler()`

Register event handlers.

#### Usage

    Informer$add_event_handler(on_add = NULL, on_update = NULL, on_delete = NULL)

#### Arguments

- `on_add`:

  Function `function(obj)` called for each added object.

- `on_update`:

  Function `function(old, new)`.

- `on_delete`:

  Function `function(obj)`.

------------------------------------------------------------------------

### Method [`start()`](https://rdrr.io/r/stats/start.html)

List (unless the cache is already in sync) and open the watch, without
blocking. Follow with `$poll()`.

#### Usage

    Informer$start()

------------------------------------------------------------------------

### Method `poll()`

Handle the events that have arrived, firing handlers. Starts the
informer if needed. After a 410 Gone it re-lists, reconciles the cache
and re-opens the watch.

#### Usage

    Informer$poll(max_wait = 0)

#### Arguments

- `max_wait`:

  Seconds to wait when nothing is pending (default 0).

#### Returns

The number of watch events handled, invisibly.

------------------------------------------------------------------------

### Method [`close()`](https://rdrr.io/r/base/connections.html)

Close the watch opened by `$start()` / `$poll()`. The cache is kept; a
later `$start()` resumes from the last resourceVersion.

#### Usage

    Informer$close()

------------------------------------------------------------------------

### Method `run()`

Run the informer: list (or resume), notify handlers, then watch until
`stop_seconds` elapse or `$stop()` is called.

#### Usage

    Informer$run(stop_seconds = NULL)

#### Arguments

- `stop_seconds`:

  Optional wall-clock limit. `NULL` runs until `$stop()` is called from
  an event handler.

------------------------------------------------------------------------

### Method [`stop()`](https://rdrr.io/r/base/stop.html)

Make a running `$run()` return. Call from an event handler.

#### Usage

    Informer$stop()

------------------------------------------------------------------------

### Method `has_synced()`

Has the initial list completed?

#### Usage

    Informer$has_synced()

------------------------------------------------------------------------

### Method `lister()`

Return a [Lister](https://ian-flores.github.io/rk8s/reference/Lister.md)
view over the current cache.

#### Usage

    Informer$lister()

------------------------------------------------------------------------

### Method [`list()`](https://rdrr.io/r/base/list.html)

Return a list of all cached objects (snapshot).

#### Usage

    Informer$list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    Informer$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

## Examples

``` r
if (FALSE) { # \dontrun{
client <- new_client_from_config()
inf <- Informer$new(
  client,
  resource_path = "/api/v1/namespaces/default/pods",
  object_from_list = V1Pod$from_list
)
inf$add_event_handler(
  on_add    = function(obj) message("add: ", obj$metadata$name),
  on_update = function(old, new) if (!identical(old$status, new$status))
                                   message("status change on ", new$metadata$name),
  on_delete = function(obj) message("gone: ", obj$metadata$name)
)
inf$run(stop_seconds = 30)

# Or drive it yourself, e.g. alongside other informers:
inf$start()
repeat inf$poll(1)

pods <- inf$lister()
pods$get("nginx")
pods$list()
} # }
```
