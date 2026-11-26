# V1ComponentStatusList

V1ComponentStatusList

V1ComponentStatusList

## Details

Status of all the conditions for the component as a list of
ComponentStatus objects. Deprecated: This API is deprecated in v1.19+

## Methods

### Public methods

- [`V1ComponentStatusList$new()`](#method-V1ComponentStatusList-new)

- [`V1ComponentStatusList$to_list()`](#method-V1ComponentStatusList-to_list)

- [`V1ComponentStatusList$clone()`](#method-V1ComponentStatusList-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ComponentStatusList$new(
      api_version = NULL,
      items = NULL,
      kind = NULL,
      metadata = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ComponentStatusList$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ComponentStatusList$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
