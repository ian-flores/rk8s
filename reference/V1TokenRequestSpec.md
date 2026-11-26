# V1TokenRequestSpec

V1TokenRequestSpec

V1TokenRequestSpec

## Details

TokenRequestSpec contains client provided parameters of a token request.

## Methods

### Public methods

- [`V1TokenRequestSpec$new()`](#method-V1TokenRequestSpec-new)

- [`V1TokenRequestSpec$to_list()`](#method-V1TokenRequestSpec-to_list)

- [`V1TokenRequestSpec$clone()`](#method-V1TokenRequestSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1TokenRequestSpec$new(
      audiences = NULL,
      bound_object_ref = NULL,
      expiration_seconds = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1TokenRequestSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1TokenRequestSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
