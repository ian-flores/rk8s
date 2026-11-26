# V1AzureFileVolumeSource

V1AzureFileVolumeSource

V1AzureFileVolumeSource

## Details

AzureFile represents an Azure File Service mount on the host and bind
mount to the pod.

## Methods

### Public methods

- [`V1AzureFileVolumeSource$new()`](#method-V1AzureFileVolumeSource-new)

- [`V1AzureFileVolumeSource$to_list()`](#method-V1AzureFileVolumeSource-to_list)

- [`V1AzureFileVolumeSource$clone()`](#method-V1AzureFileVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1AzureFileVolumeSource$new(
      read_only = NULL,
      secret_name = NULL,
      share_name = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1AzureFileVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1AzureFileVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
