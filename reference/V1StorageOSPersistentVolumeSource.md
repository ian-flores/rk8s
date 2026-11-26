# V1StorageOSPersistentVolumeSource

V1StorageOSPersistentVolumeSource

V1StorageOSPersistentVolumeSource

## Details

Represents a StorageOS persistent volume resource.

## Methods

### Public methods

- [`V1StorageOSPersistentVolumeSource$new()`](#method-V1StorageOSPersistentVolumeSource-new)

- [`V1StorageOSPersistentVolumeSource$to_list()`](#method-V1StorageOSPersistentVolumeSource-to_list)

- [`V1StorageOSPersistentVolumeSource$clone()`](#method-V1StorageOSPersistentVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1StorageOSPersistentVolumeSource$new(
      fs_type = NULL,
      read_only = NULL,
      secret_ref = NULL,
      volume_name = NULL,
      volume_namespace = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1StorageOSPersistentVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1StorageOSPersistentVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
