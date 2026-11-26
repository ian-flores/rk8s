# V1EmptyDirVolumeSource

V1EmptyDirVolumeSource

V1EmptyDirVolumeSource

## Details

Represents an empty directory for a pod. Empty directory volumes support
ownership management and SELinux relabeling.

## Methods

### Public methods

- [`V1EmptyDirVolumeSource$new()`](#method-V1EmptyDirVolumeSource-new)

- [`V1EmptyDirVolumeSource$to_list()`](#method-V1EmptyDirVolumeSource-to_list)

- [`V1EmptyDirVolumeSource$clone()`](#method-V1EmptyDirVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1EmptyDirVolumeSource$new(medium = NULL, size_limit = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1EmptyDirVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1EmptyDirVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
