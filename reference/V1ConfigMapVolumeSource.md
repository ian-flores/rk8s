# V1ConfigMapVolumeSource

V1ConfigMapVolumeSource

V1ConfigMapVolumeSource

## Details

Adapts a ConfigMap into a volume.

The contents of the target ConfigMap's Data field will be presented in a
volume as files using the keys in the Data field as the file names,
unless the items element is populated with specific mappings of keys to
paths. ConfigMap volumes support ownership management and SELinux
relabeling.

## Methods

### Public methods

- [`V1ConfigMapVolumeSource$new()`](#method-V1ConfigMapVolumeSource-new)

- [`V1ConfigMapVolumeSource$to_list()`](#method-V1ConfigMapVolumeSource-to_list)

- [`V1ConfigMapVolumeSource$clone()`](#method-V1ConfigMapVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ConfigMapVolumeSource$new(
      default_mode = NULL,
      items = NULL,
      name = NULL,
      optional = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ConfigMapVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ConfigMapVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
