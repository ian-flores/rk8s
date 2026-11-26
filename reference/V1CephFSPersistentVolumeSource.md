# V1CephFSPersistentVolumeSource

V1CephFSPersistentVolumeSource

V1CephFSPersistentVolumeSource

## Details

Represents a Ceph Filesystem mount that lasts the lifetime of a pod
Cephfs volumes do not support ownership management or SELinux
relabeling.

## Methods

### Public methods

- [`V1CephFSPersistentVolumeSource$new()`](#method-V1CephFSPersistentVolumeSource-new)

- [`V1CephFSPersistentVolumeSource$to_list()`](#method-V1CephFSPersistentVolumeSource-to_list)

- [`V1CephFSPersistentVolumeSource$clone()`](#method-V1CephFSPersistentVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CephFSPersistentVolumeSource$new(
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

    V1CephFSPersistentVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CephFSPersistentVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
