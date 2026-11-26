# V1NFSVolumeSource

V1NFSVolumeSource

V1NFSVolumeSource

## Details

Represents an NFS mount that lasts the lifetime of a pod. NFS volumes do
not support ownership management or SELinux relabeling.

## Methods

### Public methods

- [`V1NFSVolumeSource$new()`](#method-V1NFSVolumeSource-new)

- [`V1NFSVolumeSource$to_list()`](#method-V1NFSVolumeSource-to_list)

- [`V1NFSVolumeSource$clone()`](#method-V1NFSVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NFSVolumeSource$new(path = NULL, read_only = NULL, server = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NFSVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NFSVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
