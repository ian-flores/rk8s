# V1CephFSVolumeSource

V1CephFSVolumeSource

V1CephFSVolumeSource

## Details

Represents a Ceph Filesystem mount that lasts the lifetime of a pod
Cephfs volumes do not support ownership management or SELinux
relabeling.

## Methods

### Public methods

- [`V1CephFSVolumeSource$new()`](#method-V1CephFSVolumeSource-new)

- [`V1CephFSVolumeSource$to_list()`](#method-V1CephFSVolumeSource-to_list)

- [`V1CephFSVolumeSource$clone()`](#method-V1CephFSVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CephFSVolumeSource$new(
      monitors = NULL,
      path = NULL,
      read_only = NULL,
      secret_file = NULL,
      secret_ref = NULL,
      user = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CephFSVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CephFSVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
