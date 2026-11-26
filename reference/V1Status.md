# V1Status

V1Status

V1Status

## Details

Status is a return value for calls that don't return other objects.

## Methods

### Public methods

- [`V1Status$new()`](#method-V1Status-new)

- [`V1Status$to_list()`](#method-V1Status-to_list)

- [`V1Status$clone()`](#method-V1Status-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Status$new(
      api_version = NULL,
      code = NULL,
      details = NULL,
      kind = NULL,
      message = NULL,
      metadata = NULL,
      reason = NULL,
      status = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Status$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Status$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
