# V1AWSElasticBlockStoreVolumeSource

V1AWSElasticBlockStoreVolumeSource

V1AWSElasticBlockStoreVolumeSource

## Details

Represents a Persistent Disk resource in AWS.

An AWS EBS disk must exist before mounting to a container. The disk must
also be in the same AWS zone as the kubelet. An AWS EBS disk can only be
mounted as read/write once. AWS EBS volumes support ownership management
and SELinux relabeling.

## Methods

### Public methods

- [`V1AWSElasticBlockStoreVolumeSource$new()`](#method-V1AWSElasticBlockStoreVolumeSource-new)

- [`V1AWSElasticBlockStoreVolumeSource$to_list()`](#method-V1AWSElasticBlockStoreVolumeSource-to_list)

- [`V1AWSElasticBlockStoreVolumeSource$clone()`](#method-V1AWSElasticBlockStoreVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1AWSElasticBlockStoreVolumeSource$new(
      fs_type = NULL,
      partition = NULL,
      read_only = NULL,
      volume_id = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1AWSElasticBlockStoreVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1AWSElasticBlockStoreVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
