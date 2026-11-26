# V1ScaleIOVolumeSource

V1ScaleIOVolumeSource

V1ScaleIOVolumeSource

## Details

ScaleIOVolumeSource represents a persistent ScaleIO volume

## Methods

### Public methods

- [`V1ScaleIOVolumeSource$new()`](#method-V1ScaleIOVolumeSource-new)

- [`V1ScaleIOVolumeSource$to_list()`](#method-V1ScaleIOVolumeSource-to_list)

- [`V1ScaleIOVolumeSource$clone()`](#method-V1ScaleIOVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ScaleIOVolumeSource$new(
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

    V1ScaleIOVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ScaleIOVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
