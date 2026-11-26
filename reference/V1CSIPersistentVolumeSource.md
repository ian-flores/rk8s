# V1CSIPersistentVolumeSource

V1CSIPersistentVolumeSource

V1CSIPersistentVolumeSource

## Details

Represents storage that is managed by an external CSI volume driver
(Beta feature)

## Methods

### Public methods

- [`V1CSIPersistentVolumeSource$new()`](#method-V1CSIPersistentVolumeSource-new)

- [`V1CSIPersistentVolumeSource$to_list()`](#method-V1CSIPersistentVolumeSource-to_list)

- [`V1CSIPersistentVolumeSource$clone()`](#method-V1CSIPersistentVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CSIPersistentVolumeSource$new(
      controller_expand_secret_ref = NULL,
      controller_publish_secret_ref = NULL,
      driver = NULL,
      fs_type = NULL,
      node_expand_secret_ref = NULL,
      node_publish_secret_ref = NULL,
      node_stage_secret_ref = NULL,
      read_only = NULL,
      volume_attributes = NULL,
      volume_handle = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CSIPersistentVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CSIPersistentVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
