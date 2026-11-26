# Make one object the controller owner of another

Adds an `ownerReferences` entry to `obj` pointing at `owner`, with
`controller: true`. Kubernetes then deletes `obj` when `owner` is
deleted, and a
[Manager](https://ian-flores.github.io/rk8s/reference/Manager.md)
controller that `owns` `obj`'s kind reconciles `owner` whenever `obj`
changes. Use it on objects before you
[`kube_apply()`](https://ian-flores.github.io/rk8s/reference/kube_apply.md)
them.

## Usage

``` r
set_owner(obj, owner, controller = TRUE, block_owner_deletion = TRUE)
```

## Arguments

- obj:

  The object to own (a manifest list).

- owner:

  The owning object, as returned by
  [`kube_get()`](https://ian-flores.github.io/rk8s/reference/kube_get.md);
  it needs `metadata$uid`.

- controller:

  Mark the owner as the controller (only one owner can be).

- block_owner_deletion:

  With foreground deletion, keep the owner until this object is gone.

## Value

`obj` with the owner reference added (an existing reference to the same
owner is replaced).

## Details

Owner references cannot cross namespaces, so if `obj` has no namespace
it gets the owner's.

## Examples

``` r
owner <- list(apiVersion = "example.com/v1", kind = "Site",
              metadata = list(name = "blog", namespace = "web", uid = "1234"))
cm <- list(apiVersion = "v1", kind = "ConfigMap",
           metadata = list(name = "blog-config"))
set_owner(cm, owner)$metadata$ownerReferences
#> [[1]]
#> [[1]]$apiVersion
#> [1] "example.com/v1"
#> 
#> [[1]]$kind
#> [1] "Site"
#> 
#> [[1]]$name
#> [1] "blog"
#> 
#> [[1]]$uid
#> [1] "1234"
#> 
#> [[1]]$controller
#> [1] TRUE
#> 
#> [[1]]$blockOwnerDeletion
#> [1] TRUE
#> 
#> 
```
