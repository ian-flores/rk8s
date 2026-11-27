# Work queue for controllers

Work queue for controllers

Work queue for controllers

## Details

A queue of object keys (`"namespace/name"`) with the semantics of
client-go's rate-limited work queue, which is what controllers use
between their informers and their reconcile function:

- A key is queued at most once. Ten events for one object before it is
  handled still mean one reconcile.

- A key is never handed out twice at the same time. If it is added again
  while being processed, it goes back on the queue when `done()` is
  called, so the change is not lost.

- `add_after()` makes a key available after a delay (for "check again in
  a minute"). If a key is delayed twice, the earlier time wins.

- `add_rate_limited()` re-adds a key after a per-key exponential backoff
  (`base_delay`, doubling up to `max_delay`); `forget()` resets it after
  a success.

The usual loop is `key <- q$get()`, reconcile, then `q$forget(key)` on
success or `q$add_rate_limited(key)` on failure, and finally
`q$done(key)`.

## Methods

### Public methods

- [`WorkQueue$new()`](#method-WorkQueue-new)

- [`WorkQueue$add()`](#method-WorkQueue-add)

- [`WorkQueue$add_after()`](#method-WorkQueue-add_after)

- [`WorkQueue$add_rate_limited()`](#method-WorkQueue-add_rate_limited)

- [`WorkQueue$forget()`](#method-WorkQueue-forget)

- [`WorkQueue$num_requeues()`](#method-WorkQueue-num_requeues)

- [`WorkQueue$get()`](#method-WorkQueue-get)

- [`WorkQueue$done()`](#method-WorkQueue-done)

- [`WorkQueue$len()`](#method-WorkQueue-len)

- [`WorkQueue$next_ready_in()`](#method-WorkQueue-next_ready_in)

- [`WorkQueue$is_processing()`](#method-WorkQueue-is_processing)

- [`WorkQueue$keys()`](#method-WorkQueue-keys)

- [`WorkQueue$clone()`](#method-WorkQueue-clone)

------------------------------------------------------------------------

### Method `new()`

Create a queue.

#### Usage

    WorkQueue$new(
      base_delay = 0.005,
      max_delay = 1000,
      clock = function() as.numeric(Sys.time())
    )

#### Arguments

- `base_delay`:

  First retry delay for `add_rate_limited()`, seconds.

- `max_delay`:

  Upper bound on the retry delay, seconds.

- `clock`:

  Function returning the current time in seconds. Only for tests.

------------------------------------------------------------------------

### Method `add()`

Queue a key now.

#### Usage

    WorkQueue$add(key)

#### Arguments

- `key`:

  A string.

------------------------------------------------------------------------

### Method `add_after()`

Queue a key once `seconds` have passed.

#### Usage

    WorkQueue$add_after(key, seconds)

#### Arguments

- `key`:

  A string.

- `seconds`:

  Delay in seconds; `<= 0` adds now.

------------------------------------------------------------------------

### Method `add_rate_limited()`

Queue a key after its backoff delay (a failed attempt).

#### Usage

    WorkQueue$add_rate_limited(key)

#### Arguments

- `key`:

  A string.

------------------------------------------------------------------------

### Method `forget()`

Reset a key's backoff (after a success).

#### Usage

    WorkQueue$forget(key)

#### Arguments

- `key`:

  A string.

------------------------------------------------------------------------

### Method `num_requeues()`

How many times `add_rate_limited()` was called for a key since it was
last forgotten.

#### Usage

    WorkQueue$num_requeues(key)

#### Arguments

- `key`:

  A string.

------------------------------------------------------------------------

### Method [`get()`](https://rdrr.io/r/base/get.html)

Take the next key to process, or `NULL` if none is ready. The caller
must call `done()` with it afterwards.

#### Usage

    WorkQueue$get()

------------------------------------------------------------------------

### Method `done()`

Mark a key as finished. If it was added again while being processed, it
goes back on the queue.

#### Usage

    WorkQueue$done(key)

#### Arguments

- `key`:

  A string.

------------------------------------------------------------------------

### Method `len()`

Number of keys ready to be handed out now.

#### Usage

    WorkQueue$len()

------------------------------------------------------------------------

### Method `next_ready_in()`

Seconds until the next delayed key becomes ready: `0` if one is ready
now (or already queued), `Inf` if nothing is waiting.

#### Usage

    WorkQueue$next_ready_in()

------------------------------------------------------------------------

### Method `is_processing()`

Is this key being processed right now?

#### Usage

    WorkQueue$is_processing(key)

#### Arguments

- `key`:

  A string.

------------------------------------------------------------------------

### Method `keys()`

Snapshot of the queue: keys `ready` to hand out (in order),
`processing`, and `delayed`.

#### Usage

    WorkQueue$keys()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    WorkQueue$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

## Examples

``` r
q <- WorkQueue$new()
q$add("default/web"); q$add("default/web")
q$len()              # 1
#> [1] 1
key <- q$get()
q$add_rate_limited(key)   # failed: retry after base_delay
q$done(key)
q$next_ready_in()
#> [1] 0.004615545
```
