# V1RBDPersistentVolumeSource

V1RBDPersistentVolumeSource

V1RBDPersistentVolumeSource

## Details

Represents a Rados Block Device mount that lasts the lifetime of a pod.
RBD volumes support ownership management and SELinux relabeling.

## Methods

### Public methods

- [`V1RBDPersistentVolumeSource$new()`](#method-V1RBDPersistentVolumeSource-new)

- [`V1RBDPersistentVolumeSource$to_list()`](#method-V1RBDPersistentVolumeSource-to_list)

- [`V1RBDPersistentVolumeSource$clone()`](#method-V1RBDPersistentVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1RBDPersistentVolumeSource$new(
      fs_type = NULL,
      image = NULL,
      keyring = NULL,
      monitors = NULL,
      pool = NULL,
      read_only = NULL,
      secret_ref = NULL,
      user = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1RBDPersistentVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1RBDPersistentVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
