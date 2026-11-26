# V1Volume

V1Volume

V1Volume

## Details

Volume represents a named volume in a pod that may be accessed by any
container in the pod.

## Methods

### Public methods

- [`V1Volume$new()`](#method-V1Volume-new)

- [`V1Volume$to_list()`](#method-V1Volume-to_list)

- [`V1Volume$clone()`](#method-V1Volume-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Volume$new(
      aws_elastic_block_store = NULL,
      azure_disk = NULL,
      azure_file = NULL,
      cephfs = NULL,
      cinder = NULL,
      config_map = NULL,
      csi = NULL,
      downward_api = NULL,
      empty_dir = NULL,
      ephemeral = NULL,
      fc = NULL,
      flex_volume = NULL,
      flocker = NULL,
      gce_persistent_disk = NULL,
      git_repo = NULL,
      glusterfs = NULL,
      host_path = NULL,
      image = NULL,
      iscsi = NULL,
      name = NULL,
      nfs = NULL,
      persistent_volume_claim = NULL,
      photon_persistent_disk = NULL,
      portworx_volume = NULL,
      projected = NULL,
      quobyte = NULL,
      rbd = NULL,
      scale_io = NULL,
      secret = NULL,
      storageos = NULL,
      vsphere_volume = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Volume$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Volume$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
