# Dynamic (untyped) Kubernetes client

Dynamic (untyped) Kubernetes client

Dynamic (untyped) Kubernetes client

## Details

Discovers the API surface at runtime (GVR -\> REST path) via `/api` and
`/apis/*` discovery endpoints and exposes CRUD for any resource,
including CustomResourceDefinitions. Mirrors
`kubernetes.dynamic.DynamicClient` in the Python client and
`dynamic.Interface` in client-go.

Discovery is cached on first access.

## Public fields

- `client`:

  The underlying
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

## Methods

### Public methods

- [`DynamicClient$new()`](#method-DynamicClient-new)

- [`DynamicClient$resource()`](#method-DynamicClient-resource)

- [`DynamicClient$invalidate_cache()`](#method-DynamicClient-invalidate_cache)

- [`DynamicClient$clone()`](#method-DynamicClient-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    DynamicClient$new(client)

#### Arguments

- `client`:

  An
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

------------------------------------------------------------------------

### Method `resource()`

Look up a resource by apiVersion+kind. Returns a `DynamicResource`
object with `get/list/create/patch/replace/delete` methods.

#### Usage

    DynamicClient$resource(api_version, kind)

#### Arguments

- `api_version`:

  E.g. "v1", "apps/v1", "example.com/v1".

- `kind`:

  E.g. "Pod", "Deployment", "MyCustomResource".

------------------------------------------------------------------------

### Method `invalidate_cache()`

Invalidate the discovery cache.

#### Usage

    DynamicClient$invalidate_cache()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    DynamicClient$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

## Examples

``` r
if (FALSE) { # \dontrun{
client <- new_client_from_config()
dc <- DynamicClient$new(client)

# Built-in:
pods <- dc$resource("v1", "Pod")
pods$list(namespace = "kube-system")

# CustomResource:
foos <- dc$resource("example.com/v1", "Foo")
foos$get("my-foo", namespace = "default")
} # }
```
