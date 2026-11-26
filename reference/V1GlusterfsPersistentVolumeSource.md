# V1GlusterfsPersistentVolumeSource

V1GlusterfsPersistentVolumeSource

V1GlusterfsPersistentVolumeSource

## Details

Represents a Glusterfs mount that lasts the lifetime of a pod. Glusterfs
volumes do not support ownership management or SELinux relabeling.

## Methods

### Public methods

- [`V1GlusterfsPersistentVolumeSource$new()`](#method-V1GlusterfsPersistentVolumeSource-new)

- [`V1GlusterfsPersistentVolumeSource$to_list()`](#method-V1GlusterfsPersistentVolumeSource-to_list)

- [`V1GlusterfsPersistentVolumeSource$clone()`](#method-V1GlusterfsPersistentVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1GlusterfsPersistentVolumeSource$new(
      endpoints = NULL,
      endpoints_namespace = NULL,
      path = NULL,
      read_only = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1GlusterfsPersistentVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1GlusterfsPersistentVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
