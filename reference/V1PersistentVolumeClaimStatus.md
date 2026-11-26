# V1PersistentVolumeClaimStatus

V1PersistentVolumeClaimStatus

V1PersistentVolumeClaimStatus

## Details

PersistentVolumeClaimStatus is the current status of a persistent volume
claim.

## Methods

### Public methods

- [`V1PersistentVolumeClaimStatus$new()`](#method-V1PersistentVolumeClaimStatus-new)

- [`V1PersistentVolumeClaimStatus$to_list()`](#method-V1PersistentVolumeClaimStatus-to_list)

- [`V1PersistentVolumeClaimStatus$clone()`](#method-V1PersistentVolumeClaimStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PersistentVolumeClaimStatus$new(
      access_modes = NULL,
      allocated_resource_statuses = NULL,
      allocated_resources = NULL,
      capacity = NULL,
      conditions = NULL,
      current_volume_attributes_class_name = NULL,
      modify_volume_status = NULL,
      phase = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PersistentVolumeClaimStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PersistentVolumeClaimStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
