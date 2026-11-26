# V1StorageClass

V1StorageClass

V1StorageClass

## Details

StorageClass describes the parameters for a class of storage for which
PersistentVolumes can be dynamically provisioned.

StorageClasses are non-namespaced; the name of the storage class
according to etcd is in ObjectMeta.Name.

## Methods

### Public methods

- [`V1StorageClass$new()`](#method-V1StorageClass-new)

- [`V1StorageClass$to_list()`](#method-V1StorageClass-to_list)

- [`V1StorageClass$clone()`](#method-V1StorageClass-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1StorageClass$new(
      allow_volume_expansion = NULL,
      allowed_topologies = NULL,
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      mount_options = NULL,
      parameters = NULL,
      provisioner = NULL,
      reclaim_policy = NULL,
      volume_binding_mode = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1StorageClass$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1StorageClass$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
