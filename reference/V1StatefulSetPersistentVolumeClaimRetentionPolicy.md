# V1StatefulSetPersistentVolumeClaimRetentionPolicy

V1StatefulSetPersistentVolumeClaimRetentionPolicy

V1StatefulSetPersistentVolumeClaimRetentionPolicy

## Details

StatefulSetPersistentVolumeClaimRetentionPolicy describes the policy
used for PVCs created from the StatefulSet VolumeClaimTemplates.

## Methods

### Public methods

- [`V1StatefulSetPersistentVolumeClaimRetentionPolicy$new()`](#method-V1StatefulSetPersistentVolumeClaimRetentionPolicy-new)

- [`V1StatefulSetPersistentVolumeClaimRetentionPolicy$to_list()`](#method-V1StatefulSetPersistentVolumeClaimRetentionPolicy-to_list)

- [`V1StatefulSetPersistentVolumeClaimRetentionPolicy$clone()`](#method-V1StatefulSetPersistentVolumeClaimRetentionPolicy-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1StatefulSetPersistentVolumeClaimRetentionPolicy$new(
      when_deleted = NULL,
      when_scaled = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1StatefulSetPersistentVolumeClaimRetentionPolicy$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1StatefulSetPersistentVolumeClaimRetentionPolicy$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
