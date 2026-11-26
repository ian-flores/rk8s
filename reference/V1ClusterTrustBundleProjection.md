# V1ClusterTrustBundleProjection

V1ClusterTrustBundleProjection

V1ClusterTrustBundleProjection

## Details

ClusterTrustBundleProjection describes how to select a set of
ClusterTrustBundle objects and project their contents into the pod
filesystem.

## Methods

### Public methods

- [`V1ClusterTrustBundleProjection$new()`](#method-V1ClusterTrustBundleProjection-new)

- [`V1ClusterTrustBundleProjection$to_list()`](#method-V1ClusterTrustBundleProjection-to_list)

- [`V1ClusterTrustBundleProjection$clone()`](#method-V1ClusterTrustBundleProjection-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ClusterTrustBundleProjection$new(
      label_selector = NULL,
      name = NULL,
      optional = NULL,
      path = NULL,
      signer_name = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ClusterTrustBundleProjection$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ClusterTrustBundleProjection$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
