# Finalizers

A finalizer keeps a deleted object around (with
`metadata$deletionTimestamp` set) until your controller has cleaned up
whatever lives outside the cluster, then removes the finalizer so the
deletion completes. The usual reconcile is:

## Usage

``` r
has_finalizer(obj, finalizer)

is_deleting(obj)

add_finalizer(k, obj, finalizer)

remove_finalizer(k, obj, finalizer)
```

## Arguments

- obj:

  The object, as returned by
  [`kube_get()`](https://ian-flores.github.io/rk8s/reference/kube_get.md).

- finalizer:

  A finalizer name, conventionally a domain-qualified string such as
  `"example.com/cleanup"`.

- k:

  A [Kube](https://ian-flores.github.io/rk8s/reference/Kube.md) session.

## Value

`has_finalizer()` and `is_deleting()` return `TRUE`/`FALSE`;
`add_finalizer()` and `remove_finalizer()` return the updated object (or
`obj` unchanged if there was nothing to do).

## Details

- if `is_deleting(obj)`: clean up, then `remove_finalizer()`;

- otherwise: `add_finalizer()` (a no-op once present), then do the
  normal work.

`add_finalizer()` and `remove_finalizer()` patch the object with its
`resourceVersion`, so they fail with a 409 Conflict if it changed since
you read it; the
[Manager](https://ian-flores.github.io/rk8s/reference/Manager.md)
retries the reconcile with fresh data.
