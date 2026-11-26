# V1FCVolumeSource

V1FCVolumeSource

V1FCVolumeSource

## Details

Represents a Fibre Channel volume. Fibre Channel volumes can only be
mounted as read/write once. Fibre Channel volumes support ownership
management and SELinux relabeling.

## Methods

### Public methods

- [`V1FCVolumeSource$new()`](#method-V1FCVolumeSource-new)

- [`V1FCVolumeSource$to_list()`](#method-V1FCVolumeSource-to_list)

- [`V1FCVolumeSource$clone()`](#method-V1FCVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1FCVolumeSource$new(
      fs_type = NULL,
      lun = NULL,
      read_only = NULL,
      target_ww_ns = NULL,
      wwids = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1FCVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1FCVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
