# Open a Kubernetes session

Returns a `Kube` object - a thin wrapper over
[ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md)
and
[DynamicClient](https://ian-flores.github.io/rk8s/reference/DynamicClient.md)
that lets you write idiomatic R against the cluster without touching the
typed `V1*` model classes:

## Usage

``` r
kube(
  config_file = NULL,
  context = NULL,
  namespace = NULL,
  client = NULL,
  field_manager = "rk8s"
)
```

## Arguments

- config_file:

  Passed to
  [`load_kube_config()`](https://ian-flores.github.io/rk8s/reference/load_kube_config.md).

- context:

  Passed to
  [`load_kube_config()`](https://ian-flores.github.io/rk8s/reference/load_kube_config.md).

- namespace:

  Default namespace for verbs that take one. `NULL` (default) uses the
  kubeconfig context's namespace, falling back to `"default"`.

- client:

  Optional pre-built
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).
  When given, `config_file` and `context` are ignored.

- field_manager:

  Field manager used by
  [`kube_apply()`](https://ian-flores.github.io/rk8s/reference/kube_apply.md)
  (defaults to `"rk8s"`).

## Value

A `Kube` object.

## Details


    k <- kube()                                   # ~/.kube/config
    kube_get(k, "pods", namespace = "default")
    kube_apply(k, "deployment.yaml")
    kube_logs(k, "nginx-abc", namespace = "default")
    kube_delete(k, "deployment/nginx", namespace = "default")
    kube_scale(k, "deployment", "nginx", replicas = 5, namespace = "default")
    kube_watch(k, "pods", on_event = function(type, obj)
                 message(type, " ", obj$metadata$name))

This is the high-level surface most users want. The typed classes
(`V1Pod`, `CoreV1Api`, ...) and the
[DynamicClient](https://ian-flores.github.io/rk8s/reference/DynamicClient.md)
still work and are there when you need them - `Kube` is built on top of
both.

Resource references can be:

- a kind alias: `"pod"`, `"pods"`, `"po"`, `"deployment"`, `"deploy"`,
  `"svc"`, ...

- `"kind/name"`: `"deployment/nginx"`

- an explicit `apiVersion+kind`: `"apps/v1:Deployment"`

- a `c(api_version, kind)` vector: `c("apps/v1", "Deployment")`

Constructed via `kube()`. Carries an
[ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md), a
[DynamicClient](https://ian-flores.github.io/rk8s/reference/DynamicClient.md),
a default namespace, and a kind-to-resource alias table.

Usually you don't call `Kube` methods directly; use the `kube_*` verbs
which dispatch into here.

## Public fields

- `client`:

  The backing
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

- `dynamic`:

  The backing
  [DynamicClient](https://ian-flores.github.io/rk8s/reference/DynamicClient.md).

- `namespace`:

  Default namespace.

- `field_manager`:

  Field manager used by
  [`kube_apply()`](https://ian-flores.github.io/rk8s/reference/kube_apply.md).

## Methods

### Public methods

- [`Kube$new()`](#method-Kube-new)

- [`Kube$resource()`](#method-Kube-resource)

- [`Kube$resource_and_name()`](#method-Kube-resource_and_name)

- [`Kube$clone()`](#method-Kube-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    Kube$new(client, namespace = "default", field_manager = "rk8s")

#### Arguments

- `client`:

  An
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

- `namespace`:

  Default namespace.

- `field_manager`:

  Field manager.

------------------------------------------------------------------------

### Method `resource()`

Resolve a resource ref to a `DynamicResource`. Accepts: `"pod"`,
`"pods"`, `"po"`, `"deployment/nginx"` (name is captured separately via
`parse_ref`), `"apps/v1:Deployment"`, or a `c(api_version, kind)`
vector.

#### Usage

    Kube$resource(ref)

#### Arguments

- `ref`:

  Resource reference.

------------------------------------------------------------------------

### Method `resource_and_name()`

Parse `ref` and return both the resource and a name (if one was embedded
as `"kind/name"`).

#### Usage

    Kube$resource_and_name(ref)

#### Arguments

- `ref`:

  Resource reference.

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    Kube$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
