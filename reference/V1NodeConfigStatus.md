# V1NodeConfigStatus

V1NodeConfigStatus

V1NodeConfigStatus

## Details

NodeConfigStatus describes the status of the config assigned by
Node.Spec.ConfigSource.

## Methods

### Public methods

- [`V1NodeConfigStatus$new()`](#method-V1NodeConfigStatus-new)

- [`V1NodeConfigStatus$to_list()`](#method-V1NodeConfigStatus-to_list)

- [`V1NodeConfigStatus$clone()`](#method-V1NodeConfigStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NodeConfigStatus$new(
      active = NULL,
      assigned = NULL,
      error = NULL,
      last_known_good = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NodeConfigStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NodeConfigStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
