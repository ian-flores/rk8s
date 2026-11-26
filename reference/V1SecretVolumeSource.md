# V1SecretVolumeSource

V1SecretVolumeSource

V1SecretVolumeSource

## Details

Adapts a Secret into a volume.

The contents of the target Secret's Data field will be presented in a
volume as files using the keys in the Data field as the file names.
Secret volumes support ownership management and SELinux relabeling.

## Methods

### Public methods

- [`V1SecretVolumeSource$new()`](#method-V1SecretVolumeSource-new)

- [`V1SecretVolumeSource$to_list()`](#method-V1SecretVolumeSource-to_list)

- [`V1SecretVolumeSource$clone()`](#method-V1SecretVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1SecretVolumeSource$new(
      default_mode = NULL,
      items = NULL,
      optional = NULL,
      secret_name = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1SecretVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1SecretVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
