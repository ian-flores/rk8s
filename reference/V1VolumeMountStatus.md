# V1VolumeMountStatus

V1VolumeMountStatus

V1VolumeMountStatus

## Details

VolumeMountStatus shows status of volume mounts.

## Methods

### Public methods

- [`V1VolumeMountStatus$new()`](#method-V1VolumeMountStatus-new)

- [`V1VolumeMountStatus$to_list()`](#method-V1VolumeMountStatus-to_list)

- [`V1VolumeMountStatus$clone()`](#method-V1VolumeMountStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1VolumeMountStatus$new(
      mount_path = NULL,
      name = NULL,
      read_only = NULL,
      recursive_read_only = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1VolumeMountStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1VolumeMountStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
