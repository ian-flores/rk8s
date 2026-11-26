# V1ISCSIPersistentVolumeSource

V1ISCSIPersistentVolumeSource

V1ISCSIPersistentVolumeSource

## Details

ISCSIPersistentVolumeSource represents an ISCSI disk. ISCSI volumes can
only be mounted as read/write once. ISCSI volumes support ownership
management and SELinux relabeling.

## Methods

### Public methods

- [`V1ISCSIPersistentVolumeSource$new()`](#method-V1ISCSIPersistentVolumeSource-new)

- [`V1ISCSIPersistentVolumeSource$to_list()`](#method-V1ISCSIPersistentVolumeSource-to_list)

- [`V1ISCSIPersistentVolumeSource$clone()`](#method-V1ISCSIPersistentVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ISCSIPersistentVolumeSource$new(
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

    V1ISCSIPersistentVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ISCSIPersistentVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
