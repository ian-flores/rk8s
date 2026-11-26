# V1IngressSpec

V1IngressSpec

V1IngressSpec

## Details

IngressSpec describes the Ingress the user wishes to exist.

## Methods

### Public methods

- [`V1IngressSpec$new()`](#method-V1IngressSpec-new)

- [`V1IngressSpec$to_list()`](#method-V1IngressSpec-to_list)

- [`V1IngressSpec$clone()`](#method-V1IngressSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1IngressSpec$new(
      default_backend = NULL,
      ingress_class_name = NULL,
      rules = NULL,
      tls = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1IngressSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1IngressSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
