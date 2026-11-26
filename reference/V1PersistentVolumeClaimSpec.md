# V1PersistentVolumeClaimSpec

V1PersistentVolumeClaimSpec

V1PersistentVolumeClaimSpec

## Details

PersistentVolumeClaimSpec describes the common attributes of storage
devices and allows a Source for provider-specific attributes

## Methods

### Public methods

- [`V1PersistentVolumeClaimSpec$new()`](#method-V1PersistentVolumeClaimSpec-new)

- [`V1PersistentVolumeClaimSpec$to_list()`](#method-V1PersistentVolumeClaimSpec-to_list)

- [`V1PersistentVolumeClaimSpec$clone()`](#method-V1PersistentVolumeClaimSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PersistentVolumeClaimSpec$new(
      access_modes = NULL,
      data_source = NULL,
      data_source_ref = NULL,
      resources = NULL,
      selector = NULL,
      storage_class_name = NULL,
      volume_attributes_class_name = NULL,
      volume_mode = NULL,
      volume_name = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PersistentVolumeClaimSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PersistentVolumeClaimSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
