# V1PersistentVolumeSpec

V1PersistentVolumeSpec

V1PersistentVolumeSpec

## Details

PersistentVolumeSpec is the specification of a persistent volume.

## Methods

### Public methods

- [`V1PersistentVolumeSpec$new()`](#method-V1PersistentVolumeSpec-new)

- [`V1PersistentVolumeSpec$to_list()`](#method-V1PersistentVolumeSpec-to_list)

- [`V1PersistentVolumeSpec$clone()`](#method-V1PersistentVolumeSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PersistentVolumeSpec$new(
      access_modes = NULL,
      aws_elastic_block_store = NULL,
      azure_disk = NULL,
      azure_file = NULL,
      capacity = NULL,
      cephfs = NULL,
      cinder = NULL,
      claim_ref = NULL,
      csi = NULL,
      fc = NULL,
      flex_volume = NULL,
      flocker = NULL,
      gce_persistent_disk = NULL,
      glusterfs = NULL,
      host_path = NULL,
      iscsi = NULL,
      local = NULL,
      mount_options = NULL,
      nfs = NULL,
      node_affinity = NULL,
      persistent_volume_reclaim_policy = NULL,
      photon_persistent_disk = NULL,
      portworx_volume = NULL,
      quobyte = NULL,
      rbd = NULL,
      scale_io = NULL,
      storage_class_name = NULL,
      storageos = NULL,
      volume_attributes_class_name = NULL,
      volume_mode = NULL,
      vsphere_volume = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PersistentVolumeSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PersistentVolumeSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
