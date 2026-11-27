# Writing an operator in R

An operator is a program that runs in the cluster and looks after a kind
of resource you define. You add a custom resource type (say, `Site`),
people create `Site` objects, and the operator makes the cluster match
what each one asks for: it creates Deployments, ConfigMaps, DNS records,
whatever a site needs, and fixes them when they drift.

This guide builds one with rk8s, from an empty directory to two replicas
running in a kind cluster. None of the code runs when the guide is
built; it needs a cluster and Docker.

## The idea: reconcile

The core of an operator is a single function. rk8s calls it with the
name of an object that may need attention, and the function reads the
object, works out what should exist, and makes it so. It doesn’t get
told what changed, only which object to look at, so it has to work from
the current state every time. That makes it safe to call as often as you
like, which is what lets the rest of the machinery be simple.

rk8s calls it when the object is created, changed or deleted, when one
of the objects it created changes, and after any delay you ask for. If
the function fails, it’s retried with backoff.

## Scaffolding

[`use_operator()`](https://ian-flores.github.io/rk8s/reference/use_operator.md)
writes a working operator to start from:

``` r

library(rk8s)
use_operator("site-operator", name = "site-operator",
             group = "example.com", kind = "Site")
```

    site-operator/
      operator.R              the controller
      Dockerfile              builds the image
      deploy/crd.yaml         the Site resource type
      deploy/rbac.yaml        what the operator may touch
      deploy/deployment.yaml  how it runs in the cluster

The generated controller keeps, for each `Site`, a ConfigMap holding the
site’s spec. That’s not useful on its own, but it exercises every part
of the machinery, and you replace it with your own logic.

## The controller

Here is `operator.R`, a little shortened:

``` r

library(rk8s)

k <- if (nzchar(Sys.getenv("KUBERNETES_SERVICE_HOST"))) {
  kube(client = ApiClient$new(load_incluster_config()))   # running in a pod
} else {
  kube()                                                   # local development
}

reconcile <- function(req, k) {
  obj <- tryCatch(
    kube_get(k, "example.com/v1:Site", req$name, namespace = req$namespace),
    rk8s_api_error = function(e) {
      if (e$exception$status == 404L) NULL else stop(e)
    })
  if (is.null(obj)) return(NULL)

  spec <- as.character(jsonlite::toJSON(obj$spec, auto_unbox = TRUE))
  config <- list(
    apiVersion = "v1", kind = "ConfigMap",
    metadata = list(name = paste0(req$name, "-spec")),
    data = list(spec = spec))
  kube_apply(k, set_owner(config, obj), force = TRUE)

  if (!identical(obj$status$observedGeneration, obj$metadata$generation)) {
    kube_patch_status(k, obj, list(observedGeneration = obj$metadata$generation))
    kube_event(k, obj, "Reconciled", paste("updated ConfigMap", config$metadata$name))
  }
  NULL
}

mgr <- Manager$new(k)
mgr$controller("example.com/v1:Site", owns = "configmaps", reconcile = reconcile)
mgr$run(leader_election = "site-operator", health_port = 8081L)
```

Going through it:

- `req` has the object’s `namespace` and `name` (and `key`, the two
  joined with a slash). If the object is gone, there’s usually nothing
  to do; see [Cleaning up](#cleaning-up) for when there is.
- [`kube_apply()`](https://ian-flores.github.io/rk8s/reference/kube_apply.md)
  does a server-side apply, so applying the same ConfigMap again changes
  nothing. Write the reconcile as “this is what should exist” and apply
  it every time, rather than checking first.
- [`set_owner()`](https://ian-flores.github.io/rk8s/reference/set_owner.md)
  marks the ConfigMap as belonging to the `Site`. Two things follow.
  Kubernetes deletes the ConfigMap when the `Site` is deleted. And
  because the controller `owns = "configmaps"`, any change to that
  ConfigMap, including someone editing it by hand, reconciles the
  `Site`, which puts the ConfigMap back.
- [`kube_patch_status()`](https://ian-flores.github.io/rk8s/reference/kube_patch_status.md)
  writes to the object’s status, which is how an operator reports back.
  `observedGeneration` is the common convention for “I have seen this
  version of the spec”.
- [`kube_event()`](https://ian-flores.github.io/rk8s/reference/kube_event.md)
  records an event that shows up in `kubectl describe site`.
- Returning `NULL` means the object is in the state it should be.

The return value controls what happens next:

| Return | Meaning |
|----|----|
| `NULL` | Done until something changes |
| [`requeue()`](https://ian-flores.github.io/rk8s/reference/requeue.md) | Not ready yet; try again soon, backing off each time |
| `requeue_after(300)` | Look again in five minutes (for things outside the cluster) |
| an error | Logged and retried with backoff |

## Running it locally

While you’re writing the reconcile, run it on your machine against a
test cluster. kind works well:

``` bash
kind create cluster
cd site-operator
kubectl apply -f deploy/crd.yaml
Rscript operator.R
```

In another terminal, create a `Site`:

``` bash
kubectl apply -f - <<'EOF'
apiVersion: example.com/v1
kind: Site
metadata: {name: blog}
spec: {domain: blog.example.com, replicas: 2}
EOF

kubectl get configmap blog-spec -o jsonpath='{.data.spec}'
#> {"domain":"blog.example.com","replicas":2}
kubectl get site blog -o jsonpath='{.status}'
#> {"observedGeneration":1}
```

Change the spec with `kubectl edit site blog` and the ConfigMap follows.
Delete the site and the ConfigMap goes with it.

You can also drive the manager step by step from an R session, which is
handy for debugging a reconcile:

``` r

mgr$start()
mgr$step(1)    # one pass: handle what has changed, run reconciles
mgr$close()
```

## Deploying it

Build the image, make it available to the cluster, and apply the
manifests:

``` bash
docker build -t site-operator:dev .
kind load docker-image site-operator:dev
kubectl apply -f deploy/
kubectl rollout status deploy/site-operator
```

With a registry instead of kind, push the image and set `image` in
`deploy/deployment.yaml` (or pass `image =` to
[`use_operator()`](https://ian-flores.github.io/rk8s/reference/use_operator.md)).

The operator runs as the `site-operator` ServiceAccount. `rbac.yaml`
lets it read and update `Site` objects and their status, manage
ConfigMaps, record events, and hold its leader Lease. When your
reconcile touches other resources, add them there; a missing permission
shows up as a 403 in the operator’s log.

## Replicas, leader election and health

Run more than one replica (`replicas = 2` in
[`use_operator()`](https://ian-flores.github.io/rk8s/reference/use_operator.md),
or edit the Deployment) and only one does any work. `leader_election`
makes the replicas compete for a Lease, and only the holder reconciles.
If the leader stops renewing, another takes over within the lease
duration (15 seconds by default). In a kind cluster, killing the leader
pod moved the work to the standby in about 16 seconds.

`health_port` serves two endpoints that the generated Deployment probes:

- `/healthz` answers while the manager’s loop is running. If a reconcile
  hangs, nothing answers, and Kubernetes restarts the pod.
- `/readyz` answers once the manager is running, or standing by for the
  lease.

The Dockerfile starts R through `tini`. Without it R would be process 1
in the container, and process 1 ignores `SIGTERM`, so every pod deletion
would wait out the full 30-second grace period before the standby could
take over.

## Cleaning up

Owner references handle anything inside the cluster. For things outside
it, such as a DNS record or a bucket, add a finalizer. Kubernetes then
keeps a deleted object around, with `metadata$deletionTimestamp` set,
until your operator removes the finalizer:

``` r

reconcile <- function(req, k) {
  site <- tryCatch(
    kube_get(k, "example.com/v1:Site", req$name, namespace = req$namespace),
    rk8s_api_error = function(e) {
      if (e$exception$status == 404L) NULL else stop(e)
    })
  if (is.null(site)) return(NULL)

  if (is_deleting(site)) {
    delete_dns_record(site$spec$domain)        # your cleanup
    remove_finalizer(k, site, "example.com/dns")
    return(NULL)
  }
  site <- add_finalizer(k, site, "example.com/dns")
  ensure_dns_record(site$spec$domain)          # your normal work
  NULL
}
```

[`add_finalizer()`](https://ian-flores.github.io/rk8s/reference/finalizers.md)
does nothing if the finalizer is already there. Both it and
[`remove_finalizer()`](https://ian-flores.github.io/rk8s/reference/finalizers.md)
fail with a conflict if the object changed since you read it, and the
manager simply retries with fresh data.

## Things to keep in mind

- By default reconciles run one at a time, so a slow one holds up the
  others. Keep them short, push slow waiting into
  [`requeue_after()`](https://ian-flores.github.io/rk8s/reference/requeue.md),
  or run several at once with `workers` (next section).
- Write reconciles to be repeatable. They run after restarts, failovers
  and resyncs, and may see the same state many times.
- The operator authenticates in the cluster with its ServiceAccount
  token. When developing locally with a kubeconfig, it uses whatever
  your `kubectl` uses.
- One `Manager` can run several controllers; call `mgr$controller()`
  once for each resource type.

## Running reconciles in parallel

If each reconcile spends time waiting, on an API outside the cluster for
example, let several run at once:

``` r

mgr$controller("example.com/v1:Site", owns = "configmaps",
               reconcile = reconcile, workers = 4)
```

The reconciles then run in four background R processes (this needs the
`mirai` package), while the manager keeps handling events and health
checks. One `Site` is still never reconciled twice at the same time; a
change that arrives while it is being reconciled leads to one more
reconcile afterwards.

Each worker is a separate R process with its own session, built from the
manager’s connection settings. Packages you attached with
[`library()`](https://rdrr.io/r/base/library.html) are attached there
too, and so are the helper functions and values the reconcile uses from
your script. What workers don’t share is state: assigning to a variable
with `<<-` inside a reconcile changes the worker’s copy, not the
manager’s. Keep anything that must be shared in the cluster, where it
belongs anyway, for example in the object’s status.
