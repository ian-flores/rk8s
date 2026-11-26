# V1PodResourceClaim

V1PodResourceClaim

V1PodResourceClaim

## Details

PodResourceClaim references exactly one ResourceClaim, either directly
or by naming a ResourceClaimTemplate which is then turned into a
ResourceClaim for the pod.

It adds a name to it that uniquely identifies the ResourceClaim inside
the Pod. Containers that need access to the ResourceClaim reference it
with this name.

## Methods

### Public methods

- [`V1PodResourceClaim$new()`](#method-V1PodResourceClaim-new)

- [`V1PodResourceClaim$to_list()`](#method-V1PodResourceClaim-to_list)

- [`V1PodResourceClaim$clone()`](#method-V1PodResourceClaim-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodResourceClaim$new(
      name = NULL,
      resource_claim_name = NULL,
      resource_claim_template_name = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PodResourceClaim$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodResourceClaim$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
