# V1GlusterfsVolumeSource

V1GlusterfsVolumeSource

V1GlusterfsVolumeSource

## Details

Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs
volumes do not support ownership management or SELinux relabeling.

## Methods

### Public methods

- [`V1GlusterfsVolumeSource$new()`](#method-V1GlusterfsVolumeSource-new)

- [`V1GlusterfsVolumeSource$to_list()`](#method-V1GlusterfsVolumeSource-to_list)

- [`V1GlusterfsVolumeSource$clone()`](#method-V1GlusterfsVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1GlusterfsVolumeSource$new(endpoints = NULL, path = NULL, read_only = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1GlusterfsVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1GlusterfsVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
