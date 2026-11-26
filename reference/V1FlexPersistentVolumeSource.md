# V1FlexPersistentVolumeSource

V1FlexPersistentVolumeSource

V1FlexPersistentVolumeSource

## Details

FlexPersistentVolumeSource represents a generic persistent volume
resource that is provisioned/attached using an exec based plugin.

## Methods

### Public methods

- [`V1FlexPersistentVolumeSource$new()`](#method-V1FlexPersistentVolumeSource-new)

- [`V1FlexPersistentVolumeSource$to_list()`](#method-V1FlexPersistentVolumeSource-to_list)

- [`V1FlexPersistentVolumeSource$clone()`](#method-V1FlexPersistentVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1FlexPersistentVolumeSource$new(
      driver = NULL,
      fs_type = NULL,
      options = NULL,
      read_only = NULL,
      secret_ref = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1FlexPersistentVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1FlexPersistentVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
