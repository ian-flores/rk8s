# V1alpha3ResourceClaim

V1alpha3ResourceClaim

V1alpha3ResourceClaim

## Details

ResourceClaim describes a request for access to resources in the
cluster, for use by workloads. For example, if a workload needs an
accelerator device with specific properties, this is how that request is
expressed. The status stanza tracks whether this claim has been
satisfied and what specific resources have been allocated.

This is an alpha type and requires enabling the
DynamicResourceAllocation feature gate.

## Methods

### Public methods

- [`V1alpha3ResourceClaim$new()`](#method-V1alpha3ResourceClaim-new)

- [`V1alpha3ResourceClaim$to_list()`](#method-V1alpha3ResourceClaim-to_list)

- [`V1alpha3ResourceClaim$clone()`](#method-V1alpha3ResourceClaim-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha3ResourceClaim$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL,
      status = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha3ResourceClaim$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha3ResourceClaim$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
