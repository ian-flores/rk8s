# V1HostPathVolumeSource

V1HostPathVolumeSource

V1HostPathVolumeSource

## Details

Represents a host path mapped into a pod. Host path volumes do not
support ownership management or SELinux relabeling.

## Methods

### Public methods

- [`V1HostPathVolumeSource$new()`](#method-V1HostPathVolumeSource-new)

- [`V1HostPathVolumeSource$to_list()`](#method-V1HostPathVolumeSource-to_list)

- [`V1HostPathVolumeSource$clone()`](#method-V1HostPathVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1HostPathVolumeSource$new(path = NULL, type = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1HostPathVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1HostPathVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
