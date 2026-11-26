# V1ISCSIVolumeSource

V1ISCSIVolumeSource

V1ISCSIVolumeSource

## Details

Represents an ISCSI disk. ISCSI volumes can only be mounted as
read/write once. ISCSI volumes support ownership management and SELinux
relabeling.

## Methods

### Public methods

- [`V1ISCSIVolumeSource$new()`](#method-V1ISCSIVolumeSource-new)

- [`V1ISCSIVolumeSource$to_list()`](#method-V1ISCSIVolumeSource-to_list)

- [`V1ISCSIVolumeSource$clone()`](#method-V1ISCSIVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ISCSIVolumeSource$new(
      chap_auth_discovery = NULL,
      chap_auth_session = NULL,
      fs_type = NULL,
      initiator_name = NULL,
      iqn = NULL,
      iscsi_interface = NULL,
      lun = NULL,
      portals = NULL,
      read_only = NULL,
      secret_ref = NULL,
      target_portal = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ISCSIVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ISCSIVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
