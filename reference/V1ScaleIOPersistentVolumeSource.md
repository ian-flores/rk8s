# V1ScaleIOPersistentVolumeSource

V1ScaleIOPersistentVolumeSource

V1ScaleIOPersistentVolumeSource

## Details

ScaleIOPersistentVolumeSource represents a persistent ScaleIO volume

## Methods

### Public methods

- [`V1ScaleIOPersistentVolumeSource$new()`](#method-V1ScaleIOPersistentVolumeSource-new)

- [`V1ScaleIOPersistentVolumeSource$to_list()`](#method-V1ScaleIOPersistentVolumeSource-to_list)

- [`V1ScaleIOPersistentVolumeSource$clone()`](#method-V1ScaleIOPersistentVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ScaleIOPersistentVolumeSource$new(
      fs_type = NULL,
      gateway = NULL,
      protection_domain = NULL,
      read_only = NULL,
      secret_ref = NULL,
      ssl_enabled = NULL,
      storage_mode = NULL,
      storage_pool = NULL,
      system = NULL,
      volume_name = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ScaleIOPersistentVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ScaleIOPersistentVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
