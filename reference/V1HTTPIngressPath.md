# V1HTTPIngressPath

V1HTTPIngressPath

V1HTTPIngressPath

## Details

HTTPIngressPath associates a path with a backend. Incoming urls matching
the path are forwarded to the backend.

## Methods

### Public methods

- [`V1HTTPIngressPath$new()`](#method-V1HTTPIngressPath-new)

- [`V1HTTPIngressPath$to_list()`](#method-V1HTTPIngressPath-to_list)

- [`V1HTTPIngressPath$clone()`](#method-V1HTTPIngressPath-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1HTTPIngressPath$new(backend = NULL, path = NULL, path_type = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1HTTPIngressPath$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1HTTPIngressPath$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
