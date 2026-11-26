# V1IngressClassParametersReference

V1IngressClassParametersReference

V1IngressClassParametersReference

## Details

IngressClassParametersReference identifies an API object. This can be
used to specify a cluster or namespace-scoped resource.

## Methods

### Public methods

- [`V1IngressClassParametersReference$new()`](#method-V1IngressClassParametersReference-new)

- [`V1IngressClassParametersReference$to_list()`](#method-V1IngressClassParametersReference-to_list)

- [`V1IngressClassParametersReference$clone()`](#method-V1IngressClassParametersReference-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1IngressClassParametersReference$new(
      api_group = NULL,
      kind = NULL,
      name = NULL,
      namespace = NULL,
      scope = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1IngressClassParametersReference$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1IngressClassParametersReference$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
