# Reconcile results

Return one of these from a
[Manager](https://ian-flores.github.io/rk8s/reference/Manager.md)
reconcile function. Returning `NULL` means the object is in the desired
state.

## Usage

``` r
requeue()

requeue_after(seconds)
```

## Arguments

- seconds:

  Delay before the next reconcile.

## Value

A reconcile result.

## Details

- `requeue()`: reconcile this object again soon, with per-key
  exponential backoff (for "not ready yet, try again").

- `requeue_after(seconds)`: reconcile it again after `seconds`, without
  backoff (for periodic checks).
