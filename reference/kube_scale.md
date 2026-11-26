# Scale a workload (Deployment, StatefulSet, ReplicaSet, ReplicationController)

Scale a workload (Deployment, StatefulSet, ReplicaSet,
ReplicationController)

## Usage

``` r
kube_scale(k, ref, name = NULL, replicas, namespace = k$namespace)
```

## Arguments

- k:

  A [Kube](https://ian-flores.github.io/rk8s/reference/Kube.md) session.

- ref:

  Resource ref - kind alias (`"pods"`), `"kind/name"`, or explicit
  `"apiVersion:Kind"` / `c(apiVersion, Kind)`.

- name:

  Optional resource name (overrides any name in `ref`).

- replicas:

  New replica count.

- namespace:

  Namespace (defaults to `k$namespace`).

## Value

The updated `Scale` subresource response.
