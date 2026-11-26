# V1CSIVolumeSource

V1CSIVolumeSource

V1CSIVolumeSource

## Details

Represents a source location of a volume to mount, managed by an
external CSI driver

## Methods

### Public methods

- [`V1CSIVolumeSource$new()`](#method-V1CSIVolumeSource-new)

- [`V1CSIVolumeSource$to_list()`](#method-V1CSIVolumeSource-to_list)

- [`V1CSIVolumeSource$clone()`](#method-V1CSIVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CSIVolumeSource$new(
      driver = NULL,
      fs_type = NULL,
      node_publish_secret_ref = NULL,
      read_only = NULL,
      volume_attributes = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CSIVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CSIVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
