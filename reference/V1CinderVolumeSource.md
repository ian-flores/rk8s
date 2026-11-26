# V1CinderVolumeSource

V1CinderVolumeSource

V1CinderVolumeSource

## Details

Represents a cinder volume resource in Openstack. A Cinder volume must
exist before mounting to a container. The volume must also be in the
same region as the kubelet. Cinder volumes support ownership management
and SELinux relabeling.

## Methods

### Public methods

- [`V1CinderVolumeSource$new()`](#method-V1CinderVolumeSource-new)

- [`V1CinderVolumeSource$to_list()`](#method-V1CinderVolumeSource-to_list)

- [`V1CinderVolumeSource$clone()`](#method-V1CinderVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CinderVolumeSource$new(
      fs_type = NULL,
      read_only = NULL,
      secret_ref = NULL,
      volume_id = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CinderVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CinderVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
