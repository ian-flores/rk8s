# V1GCEPersistentDiskVolumeSource

V1GCEPersistentDiskVolumeSource

V1GCEPersistentDiskVolumeSource

## Details

Represents a Persistent Disk resource in Google Compute Engine.

A GCE PD must exist before mounting to a container. The disk must also
be in the same GCE project and zone as the kubelet. A GCE PD can only be
mounted as read/write once or read-only many times. GCE PDs support
ownership management and SELinux relabeling.

## Methods

### Public methods

- [`V1GCEPersistentDiskVolumeSource$new()`](#method-V1GCEPersistentDiskVolumeSource-new)

- [`V1GCEPersistentDiskVolumeSource$to_list()`](#method-V1GCEPersistentDiskVolumeSource-to_list)

- [`V1GCEPersistentDiskVolumeSource$clone()`](#method-V1GCEPersistentDiskVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1GCEPersistentDiskVolumeSource$new(
      fs_type = NULL,
      partition = NULL,
      pd_name = NULL,
      read_only = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1GCEPersistentDiskVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1GCEPersistentDiskVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
