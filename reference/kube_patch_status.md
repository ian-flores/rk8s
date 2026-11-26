# Update an object's status

Sends a JSON merge patch of `list(status = status)` to the object's
`/status` subresource. Only the fields you pass change; set a field to
`NA` to remove it. Custom resources need `subresources: {status: {}}` in
their CRD for this endpoint to exist; without it, status is part of the
main object and is written with
[`kube_apply()`](https://ian-flores.github.io/rk8s/reference/kube_apply.md).

## Usage

``` r
kube_patch_status(k, obj, status)
```

## Arguments

- k:

  A [Kube](https://ian-flores.github.io/rk8s/reference/Kube.md) session.

- obj:

  The object, as returned by
  [`kube_get()`](https://ian-flores.github.io/rk8s/reference/kube_get.md)
  (needs `apiVersion`, `kind` and `metadata$name`).

- status:

  A list of status fields.

## Value

The updated object.

## Examples

``` r
if (FALSE) { # \dontrun{
site <- kube_get(k, "example.com/v1:Site", "blog")
kube_patch_status(k, site, list(ready = TRUE, url = "https://blog.example"))
} # }
```
