# V1CSIStorageCapacity

V1CSIStorageCapacity

V1CSIStorageCapacity

## Details

CSIStorageCapacity stores the result of one CSI GetCapacity call. For a
given StorageClass, this describes the available capacity in a
particular topology segment. This can be used when considering where to
instantiate new PersistentVolumes.

For example this can express things like: - StorageClass "standard" has
"1234 GiB" available in "topology.kubernetes.io/zone=us-east1" -
StorageClass "localssd" has "10 GiB" available in
"kubernetes.io/hostname=knode-abc123"

The following three cases all imply that no capacity is available for a
certain combination: - no object exists with suitable topology and
storage class name - such an object exists, but the capacity is unset -
such an object exists, but the capacity is zero

The producer of these objects can decide which approach is more
suitable.

They are consumed by the kube-scheduler when a CSI driver opts into
capacity-aware scheduling with CSIDriverSpec.StorageCapacity. The
scheduler compares the MaximumVolumeSize against the requested size of
pending volumes to filter out unsuitable nodes. If MaximumVolumeSize is
unset, it falls back to a comparison against the less precise Capacity.
If that is also unset, the scheduler assumes that capacity is
insufficient and tries some other node.

## Methods

### Public methods

- [`V1CSIStorageCapacity$new()`](#method-V1CSIStorageCapacity-new)

- [`V1CSIStorageCapacity$to_list()`](#method-V1CSIStorageCapacity-to_list)

- [`V1CSIStorageCapacity$clone()`](#method-V1CSIStorageCapacity-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CSIStorageCapacity$new(
      api_version = NULL,
      capacity = NULL,
      kind = NULL,
      maximum_volume_size = NULL,
      metadata = NULL,
      node_topology = NULL,
      storage_class_name = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CSIStorageCapacity$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CSIStorageCapacity$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
