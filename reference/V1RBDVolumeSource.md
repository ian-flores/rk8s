# V1RBDVolumeSource

V1RBDVolumeSource

V1RBDVolumeSource

## Details

Represents a Rados Block Device mount that lasts the lifetime of a pod.
RBD volumes support ownership management and SELinux relabeling.

## Methods

### Public methods

- [`V1RBDVolumeSource$new()`](#method-V1RBDVolumeSource-new)

- [`V1RBDVolumeSource$to_list()`](#method-V1RBDVolumeSource-to_list)

- [`V1RBDVolumeSource$clone()`](#method-V1RBDVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1RBDVolumeSource$new(
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

    V1RBDVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1RBDVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
