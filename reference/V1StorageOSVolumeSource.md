# V1StorageOSVolumeSource

V1StorageOSVolumeSource

V1StorageOSVolumeSource

## Details

Represents a StorageOS persistent volume resource.

## Methods

### Public methods

- [`V1StorageOSVolumeSource$new()`](#method-V1StorageOSVolumeSource-new)

- [`V1StorageOSVolumeSource$to_list()`](#method-V1StorageOSVolumeSource-to_list)

- [`V1StorageOSVolumeSource$clone()`](#method-V1StorageOSVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1StorageOSVolumeSource$new(
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

    V1StorageOSVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1StorageOSVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
