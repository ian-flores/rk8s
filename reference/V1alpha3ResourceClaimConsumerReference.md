# V1alpha3ResourceClaimConsumerReference

V1alpha3ResourceClaimConsumerReference

V1alpha3ResourceClaimConsumerReference

## Details

ResourceClaimConsumerReference contains enough information to let you
locate the consumer of a ResourceClaim. The user must be a resource in
the same namespace as the ResourceClaim.

## Methods

### Public methods

- [`V1alpha3ResourceClaimConsumerReference$new()`](#method-V1alpha3ResourceClaimConsumerReference-new)

- [`V1alpha3ResourceClaimConsumerReference$to_list()`](#method-V1alpha3ResourceClaimConsumerReference-to_list)

- [`V1alpha3ResourceClaimConsumerReference$clone()`](#method-V1alpha3ResourceClaimConsumerReference-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha3ResourceClaimConsumerReference$new(
      api_group = NULL,
      name = NULL,
      resource = NULL,
      uid = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha3ResourceClaimConsumerReference$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha3ResourceClaimConsumerReference$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
