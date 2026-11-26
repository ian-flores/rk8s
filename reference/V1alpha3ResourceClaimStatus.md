# V1alpha3ResourceClaimStatus

V1alpha3ResourceClaimStatus

V1alpha3ResourceClaimStatus

## Details

ResourceClaimStatus tracks whether the resource has been allocated and
what the result of that was.

## Methods

### Public methods

- [`V1alpha3ResourceClaimStatus$new()`](#method-V1alpha3ResourceClaimStatus-new)

- [`V1alpha3ResourceClaimStatus$to_list()`](#method-V1alpha3ResourceClaimStatus-to_list)

- [`V1alpha3ResourceClaimStatus$clone()`](#method-V1alpha3ResourceClaimStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha3ResourceClaimStatus$new(
      allocation = NULL,
      deallocation_requested = NULL,
      reserved_for = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha3ResourceClaimStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha3ResourceClaimStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
