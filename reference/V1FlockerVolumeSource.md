# V1FlockerVolumeSource

V1FlockerVolumeSource

V1FlockerVolumeSource

## Details

Represents a Flocker volume mounted by the Flocker agent. One and only
one of datasetName and datasetUUID should be set. Flocker volumes do not
support ownership management or SELinux relabeling.

## Methods

### Public methods

- [`V1FlockerVolumeSource$new()`](#method-V1FlockerVolumeSource-new)

- [`V1FlockerVolumeSource$to_list()`](#method-V1FlockerVolumeSource-to_list)

- [`V1FlockerVolumeSource$clone()`](#method-V1FlockerVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1FlockerVolumeSource$new(dataset_name = NULL, dataset_uuid = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1FlockerVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1FlockerVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
