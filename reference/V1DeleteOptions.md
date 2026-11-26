# V1DeleteOptions

V1DeleteOptions

V1DeleteOptions

## Details

DeleteOptions may be provided when deleting an API object.

## Methods

### Public methods

- [`V1DeleteOptions$new()`](#method-V1DeleteOptions-new)

- [`V1DeleteOptions$to_list()`](#method-V1DeleteOptions-to_list)

- [`V1DeleteOptions$clone()`](#method-V1DeleteOptions-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1DeleteOptions$new(
      api_version = NULL,
      dry_run = NULL,
      grace_period_seconds = NULL,
      kind = NULL,
      orphan_dependents = NULL,
      preconditions = NULL,
      propagation_policy = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1DeleteOptions$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1DeleteOptions$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
