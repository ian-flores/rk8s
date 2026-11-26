# V1AzureDiskVolumeSource

V1AzureDiskVolumeSource

V1AzureDiskVolumeSource

## Details

AzureDisk represents an Azure Data Disk mount on the host and bind mount
to the pod.

## Methods

### Public methods

- [`V1AzureDiskVolumeSource$new()`](#method-V1AzureDiskVolumeSource-new)

- [`V1AzureDiskVolumeSource$to_list()`](#method-V1AzureDiskVolumeSource-to_list)

- [`V1AzureDiskVolumeSource$clone()`](#method-V1AzureDiskVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1AzureDiskVolumeSource$new(
      caching_mode = NULL,
      disk_name = NULL,
      disk_uri = NULL,
      fs_type = NULL,
      kind = NULL,
      read_only = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1AzureDiskVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1AzureDiskVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
