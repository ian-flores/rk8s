# Run controllers: informers, a work queue and a reconcile function

Run controllers: informers, a work queue and a reconcile function

Run controllers: informers, a work queue and a reconcile function

## Details

A `Manager` runs one or more controllers in a single R process. Each
controller watches a primary resource (and optionally the resources it
creates), turns every change into a key on a
[WorkQueue](https://ian-flores.github.io/rk8s/reference/WorkQueue.md),
and calls your `reconcile` function with that key. This is the same
model as controller-runtime in Go and kopf in Python, in one loop
instead of threads.

`reconcile(req)` or `reconcile(req, k)` receives `req`, a list with
`key`, `namespace` and `name`, and (if it takes a second argument) the
[Kube](https://ian-flores.github.io/rk8s/reference/Kube.md) session. It
should read the current state, make the cluster match what the object
asks for, and return:

- `NULL` (or anything else): done until the next change.

- [`requeue()`](https://ian-flores.github.io/rk8s/reference/requeue.md):
  try again soon, with per-key exponential backoff.

- [`requeue_after()`](https://ian-flores.github.io/rk8s/reference/requeue.md)`(seconds)`:
  look again after a delay (e.g. to poll something outside the cluster).

An error is logged with
[`message()`](https://rdrr.io/r/base/message.html) and retried with
backoff; it does not stop the manager. Reconciles run one at a time, so
keep them short.

Changes to owned resources (`owns`) reconcile their owner: the object
named by an `ownerReferences` entry with `controller: true` whose kind
and API group match the primary resource.

## Public fields

- `kube`:

  The [Kube](https://ian-flores.github.io/rk8s/reference/Kube.md)
  session controllers use.

## Methods

### Public methods

- [`Manager$new()`](#method-Manager-new)

- [`Manager$controller()`](#method-Manager-controller)

- [`Manager$controllers()`](#method-Manager-controllers)

- [`Manager$start()`](#method-Manager-start)

- [`Manager$step()`](#method-Manager-step)

- [`Manager$run()`](#method-Manager-run)

- [`Manager$stop()`](#method-Manager-stop)

- [`Manager$close()`](#method-Manager-close)

- [`Manager$clone()`](#method-Manager-clone)

------------------------------------------------------------------------

### Method `new()`

Create a manager.

#### Usage

    Manager$new(k, poll_interval = 0.05)

#### Arguments

- `k`:

  A [Kube](https://ian-flores.github.io/rk8s/reference/Kube.md) session
  (from
  [`kube()`](https://ian-flores.github.io/rk8s/reference/Kube.md)).

- `poll_interval`:

  Seconds to sleep between passes when idle.

------------------------------------------------------------------------

### Method `controller()`

Add a controller.

#### Usage

    Manager$controller(
      ref,
      reconcile,
      owns = character(),
      namespace = NULL,
      label_selector = NULL,
      resync_seconds = NULL,
      name = NULL,
      base_delay = 0.25,
      max_delay = 300
    )

#### Arguments

- `ref`:

  The primary resource, as for
  [`kube_get()`](https://ian-flores.github.io/rk8s/reference/kube_get.md)
  (e.g. `"pods"`, `"example.com/v1:Site"`).

- `reconcile`:

  `function(req)` or `function(req, k)`; see Details.

- `owns`:

  Resources this controller creates (refs). Changes to them reconcile
  their owner.

- `namespace`:

  Watch only this namespace; `NULL` watches all namespaces (for
  namespaced resources).

- `label_selector`:

  Optional label selector for the primary resource.

- `resync_seconds`:

  If set, requeue every primary object this often, even without changes.

- `name`:

  Controller name used in log messages (default: the kind).

- `base_delay, max_delay`:

  Retry backoff bounds, seconds (see
  [WorkQueue](https://ian-flores.github.io/rk8s/reference/WorkQueue.md)).

#### Returns

The controller, invisibly.

------------------------------------------------------------------------

### Method `controllers()`

The controllers added so far.

#### Usage

    Manager$controllers()

------------------------------------------------------------------------

### Method [`start()`](https://rdrr.io/r/stats/start.html)

List every watched resource and open the watches. `run()` does this for
you; call it yourself to drive
[`step()`](https://rdrr.io/r/stats/step.html).

#### Usage

    Manager$start()

------------------------------------------------------------------------

### Method [`step()`](https://rdrr.io/r/stats/step.html)

One pass of the loop: handle watch events, then run the reconciles that
are ready. Waits up to `max_wait` seconds if there is nothing to do.

#### Usage

    Manager$step(max_wait = 0)

#### Arguments

- `max_wait`:

  Seconds to wait for work.

#### Returns

The number of reconciles run, invisibly.

------------------------------------------------------------------------

### Method `run()`

Run until `stop_seconds` pass or
[`stop()`](https://rdrr.io/r/base/stop.html) is called.

#### Usage

    Manager$run(
      stop_seconds = NULL,
      leader_election = NULL,
      lease_namespace = NULL,
      identity = NULL,
      ...
    )

#### Arguments

- `stop_seconds`:

  Optional time limit; `NULL` runs until
  [`stop()`](https://rdrr.io/r/base/stop.html).

- `leader_election`:

  Name of a Lease to hold while running. When set, the manager waits
  until it holds the lease, reconciles only while it does, and stops if
  the lease is lost. Use this whenever more than one replica runs.

- `lease_namespace`:

  Namespace of the Lease (default: the session's).

- `identity`:

  This replica's identity (default: host name and PID).

- `...`:

  Passed to
  [`run_as_leader()`](https://ian-flores.github.io/rk8s/reference/run_as_leader.md)
  (lease timings).

------------------------------------------------------------------------

### Method [`stop()`](https://rdrr.io/r/base/stop.html)

Make `run()` return after the current reconcile.

#### Usage

    Manager$stop()

------------------------------------------------------------------------

### Method [`close()`](https://rdrr.io/r/base/connections.html)

Close every watch.

#### Usage

    Manager$close()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    Manager$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

## Examples

``` r
if (FALSE) { # \dontrun{
k <- kube()
mgr <- Manager$new(k)
mgr$controller(
  "example.com/v1:Site",
  owns = "apps/v1:Deployment",
  reconcile = function(req, k) {
    site <- tryCatch(kube_get(k, "example.com/v1:Site", req$name,
                              namespace = req$namespace),
                     rk8s_api_error = function(e) NULL)
    if (is.null(site)) return(NULL)        # deleted; owned objects are GC'd
    # ... kube_apply() the Deployment it needs ...
    requeue_after(300)
  }
)
mgr$run(leader_election = "site-operator")
} # }
```
