# V1CinderPersistentVolumeSource

V1CinderPersistentVolumeSource

V1CinderPersistentVolumeSource

## Details

Represents a cinder volume resource in Openstack. A Cinder volume must
exist before mounting to a container. The volume must also be in the
same region as the kubelet. Cinder volumes support ownership management
and SELinux relabeling.

## Methods

### Public methods

- [`V1CinderPersistentVolumeSource$new()`](#method-V1CinderPersistentVolumeSource-new)

- [`V1CinderPersistentVolumeSource$to_list()`](#method-V1CinderPersistentVolumeSource-to_list)

- [`V1CinderPersistentVolumeSource$clone()`](#method-V1CinderPersistentVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CinderPersistentVolumeSource$new(
      fs_type = NULL,
      read_only = NULL,
      secret_ref = NULL,
      volume_id = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CinderPersistentVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CinderPersistentVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
