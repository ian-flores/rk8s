# V1SelfSubjectAccessReviewSpec

V1SelfSubjectAccessReviewSpec

V1SelfSubjectAccessReviewSpec

## Details

SelfSubjectAccessReviewSpec is a description of the access request.
Exactly one of ResourceAuthorizationAttributes and
NonResourceAuthorizationAttributes must be set

## Methods

### Public methods

- [`V1SelfSubjectAccessReviewSpec$new()`](#method-V1SelfSubjectAccessReviewSpec-new)

- [`V1SelfSubjectAccessReviewSpec$to_list()`](#method-V1SelfSubjectAccessReviewSpec-to_list)

- [`V1SelfSubjectAccessReviewSpec$clone()`](#method-V1SelfSubjectAccessReviewSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1SelfSubjectAccessReviewSpec$new(
      non_resource_attributes = NULL,
      resource_attributes = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1SelfSubjectAccessReviewSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1SelfSubjectAccessReviewSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
