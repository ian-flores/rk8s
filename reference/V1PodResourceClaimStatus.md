# V1PodResourceClaimStatus

V1PodResourceClaimStatus

V1PodResourceClaimStatus

## Details

PodResourceClaimStatus is stored in the PodStatus for each
PodResourceClaim which references a ResourceClaimTemplate. It stores the
generated name for the corresponding ResourceClaim.

## Methods

### Public methods

- [`V1PodResourceClaimStatus$new()`](#method-V1PodResourceClaimStatus-new)

- [`V1PodResourceClaimStatus$to_list()`](#method-V1PodResourceClaimStatus-to_list)

- [`V1PodResourceClaimStatus$clone()`](#method-V1PodResourceClaimStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodResourceClaimStatus$new(name = NULL, resource_claim_name = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PodResourceClaimStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodResourceClaimStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
