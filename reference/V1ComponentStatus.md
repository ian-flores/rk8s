# V1ComponentStatus

V1ComponentStatus

V1ComponentStatus

## Details

ComponentStatus (and ComponentStatusList) holds the cluster validation
info. Deprecated: This API is deprecated in v1.19+

## Methods

### Public methods

- [`V1ComponentStatus$new()`](#method-V1ComponentStatus-new)

- [`V1ComponentStatus$to_list()`](#method-V1ComponentStatus-to_list)

- [`V1ComponentStatus$clone()`](#method-V1ComponentStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ComponentStatus$new(
      api_version = NULL,
      conditions = NULL,
      kind = NULL,
      metadata = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ComponentStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ComponentStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
