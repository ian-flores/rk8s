# Read-only indexed view over an Informer's cache

Read-only indexed view over an Informer's cache

Read-only indexed view over an Informer's cache

## Details

A `Lister` is a cheap read-only wrapper over the cache an
[Informer](https://ian-flores.github.io/rk8s/reference/Informer.md)
maintains. Use it in controllers to answer "does an object by this name
already exist?" without hitting the API server on every tick.

Mirrors client-go's `Lister` / `NamespaceLister` interfaces.

## Methods

### Public methods

- [`Lister$new()`](#method-Lister-new)

- [`Lister$list()`](#method-Lister-list)

- [`Lister$namespace()`](#method-Lister-namespace)

- [`Lister$get()`](#method-Lister-get)

- [`Lister$clone()`](#method-Lister-clone)

------------------------------------------------------------------------

### Method `new()`

Construct (usually via `Informer$lister()`).

#### Usage

    Lister$new(store)

#### Arguments

- `store`:

  An environment holding `namespace/name -> object`.

------------------------------------------------------------------------

### Method [`list()`](https://rdrr.io/r/base/list.html)

All objects in the cache.

#### Usage

    Lister$list()

------------------------------------------------------------------------

### Method `namespace()`

Objects scoped to a namespace.

#### Usage

    Lister$namespace(namespace)

#### Arguments

- `namespace`:

  Namespace to filter on.

------------------------------------------------------------------------

### Method [`get()`](https://rdrr.io/r/base/get.html)

Fetch a single object by name.

#### Usage

    Lister$get(name, namespace = NULL)

#### Arguments

- `name`:

  Object name.

- `namespace`:

  Optional namespace (for namespaced resources).

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    Lister$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
