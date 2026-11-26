# Run as the leader under a Kubernetes Lease

Acquire-and-renew leader election against a `coordination.k8s.io/v1`
Lease object. At most one caller across a cluster holds the lease at a
time; leadership passes to another caller when the holder stops renewing
(within `lease_duration_seconds`).

## Usage

``` r
run_as_leader(
  client,
  lease_name,
  lease_namespace,
  identity,
  on_started_leading,
  on_stopped_leading = function() NULL,
  on_new_leader = NULL,
  lease_duration_seconds = 15,
  renew_deadline_seconds = 10,
  retry_period_seconds = 2,
  release_on_exit = TRUE,
  on_wait = NULL
)
```

## Arguments

- client:

  An
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

- lease_name:

  Name of the Lease object (created if missing).

- lease_namespace:

  Namespace of the Lease.

- identity:

  Unique identifier for this caller (hostname + PID is a common choice).
  Two callers with the same identity are considered the same holder and
  will never contest each other.

- on_started_leading:

  Function called once when this caller acquires the lease, with a
  leader handle (see Details) as its only argument.

- on_stopped_leading:

  Function called once, with no arguments, when this caller loses the
  lease (always paired with `on_started_leading`).

- on_new_leader:

  Optional `function(identity)` called whenever the observed leader
  changes (including this caller becoming leader).

- lease_duration_seconds:

  How long a successful acquire is valid (default 15s). Other callers
  will consider the lease expired after this interval of no renewal.

- renew_deadline_seconds:

  How long to keep trying to renew before giving up and calling
  `on_stopped_leading` (default 10s).

- retry_period_seconds:

  Interval between acquire attempts and between renewals (default 2s).

- release_on_exit:

  Release the lease when leadership ends, so a successor does not have
  to wait for it to expire (default `TRUE`).

- on_wait:

  Optional `function(seconds)` called instead of
  [`Sys.sleep()`](https://rdrr.io/r/base/Sys.sleep.html) between
  attempts while waiting for the lease. Use it to keep doing other work
  (such as answering health checks) on a standby replica; it may signal
  a condition to stop waiting.

  Requires
  `lease_duration_seconds > renew_deadline_seconds > retry_period_seconds`,
  as in client-go.

## Value

Invisibly, `TRUE` once this caller has held and given up leadership.

## Details

Mirrors `kubernetes.leaderelection.LeaderElection` (Python) and
`client-go/tools/leaderelection`.

`run_as_leader()` blocks until the lease is acquired, then starts a
background renewer (a `callr` child process) and calls
`on_started_leading(leader)`. Because R cannot interrupt running code
from another thread, **your callback must check in periodically** by
calling `leader$check()`. It returns invisibly while this caller is
still the leader and signals a condition of class `rk8s_leadership_lost`
once leadership is gone (the lease was taken over, or no renewal has
succeeded within `renew_deadline_seconds`). `run_as_leader()` catches
that condition. `leader$is_leader()` returns the same information as a
logical.

When the callback returns, errors, or loses leadership, the renewer is
stopped, the lease is released (so a successor can take over
immediately, unless `release_on_exit = FALSE`), and
`on_stopped_leading()` is called. Errors other than lost leadership are
re-raised after this cleanup.

A callback that takes no arguments is still supported, but it then has
no way to learn that leadership was lost while it runs.

## Examples

``` r
if (FALSE) { # \dontrun{
client <- new_client_from_config()
run_as_leader(
  client,
  lease_name = "my-controller",
  lease_namespace = "kube-system",
  identity = paste0(Sys.info()[["nodename"]], "-", Sys.getpid()),
  on_started_leading = function(leader) {
    repeat {
      leader$check()          # returns, or unwinds once leadership is lost
      reconcile_once()
      Sys.sleep(1)
    }
  },
  on_stopped_leading = function() message("stopped leading")
)
} # }
```
