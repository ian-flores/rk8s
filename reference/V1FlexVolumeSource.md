# V1FlexVolumeSource

V1FlexVolumeSource

V1FlexVolumeSource

## Details

FlexVolume represents a generic volume resource that is
provisioned/attached using an exec based plugin.

## Methods

### Public methods

- [`V1FlexVolumeSource$new()`](#method-V1FlexVolumeSource-new)

- [`V1FlexVolumeSource$to_list()`](#method-V1FlexVolumeSource-to_list)

- [`V1FlexVolumeSource$clone()`](#method-V1FlexVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1FlexVolumeSource$new(
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

    V1FlexVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1FlexVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
