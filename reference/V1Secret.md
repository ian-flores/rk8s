# V1Secret

V1Secret

V1Secret

## Details

Secret holds secret data of a certain type. The total bytes of the
values in the Data field must be less than MaxSecretSize bytes.

## Methods

### Public methods

- [`V1Secret$new()`](#method-V1Secret-new)

- [`V1Secret$to_list()`](#method-V1Secret-to_list)

- [`V1Secret$clone()`](#method-V1Secret-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Secret$new(
      api_version = NULL,
      data = NULL,
      immutable = NULL,
      kind = NULL,
      metadata = NULL,
      string_data = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Secret$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Secret$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
