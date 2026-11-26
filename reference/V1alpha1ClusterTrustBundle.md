# V1alpha1ClusterTrustBundle

V1alpha1ClusterTrustBundle

V1alpha1ClusterTrustBundle

## Details

ClusterTrustBundle is a cluster-scoped container for X.509 trust anchors
(root certificates).

ClusterTrustBundle objects are considered to be readable by any
authenticated user in the cluster, because they can be mounted by pods
using the \`clusterTrustBundle\` projection. All service accounts have
read access to ClusterTrustBundles by default. Users who only have
namespace-level access to a cluster can read ClusterTrustBundles by
impersonating a serviceaccount that they have access to.

It can be optionally associated with a particular assigner, in which
case it contains one valid set of trust anchors for that signer. Signers
may have multiple associated ClusterTrustBundles; each is an independent
set of trust anchors for that signer. Admission control is used to
enforce that only users with permissions on the signer can create or
modify the corresponding bundle.

## Methods

### Public methods

- [`V1alpha1ClusterTrustBundle$new()`](#method-V1alpha1ClusterTrustBundle-new)

- [`V1alpha1ClusterTrustBundle$to_list()`](#method-V1alpha1ClusterTrustBundle-to_list)

- [`V1alpha1ClusterTrustBundle$clone()`](#method-V1alpha1ClusterTrustBundle-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha1ClusterTrustBundle$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha1ClusterTrustBundle$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha1ClusterTrustBundle$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
