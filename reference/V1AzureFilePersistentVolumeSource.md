# V1AzureFilePersistentVolumeSource

V1AzureFilePersistentVolumeSource

V1AzureFilePersistentVolumeSource

## Details

AzureFile represents an Azure File Service mount on the host and bind
mount to the pod.

## Methods

### Public methods

- [`V1AzureFilePersistentVolumeSource$new()`](#method-V1AzureFilePersistentVolumeSource-new)

- [`V1AzureFilePersistentVolumeSource$to_list()`](#method-V1AzureFilePersistentVolumeSource-to_list)

- [`V1AzureFilePersistentVolumeSource$clone()`](#method-V1AzureFilePersistentVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1AzureFilePersistentVolumeSource$new(
      read_only = NULL,
      secret_name = NULL,
      secret_namespace = NULL,
      share_name = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1AzureFilePersistentVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1AzureFilePersistentVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
