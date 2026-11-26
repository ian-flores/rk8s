# V1SubjectAccessReviewSpec

V1SubjectAccessReviewSpec

V1SubjectAccessReviewSpec

## Details

SubjectAccessReviewSpec is a description of the access request. Exactly
one of ResourceAuthorizationAttributes and
NonResourceAuthorizationAttributes must be set

## Methods

### Public methods

- [`V1SubjectAccessReviewSpec$new()`](#method-V1SubjectAccessReviewSpec-new)

- [`V1SubjectAccessReviewSpec$to_list()`](#method-V1SubjectAccessReviewSpec-to_list)

- [`V1SubjectAccessReviewSpec$clone()`](#method-V1SubjectAccessReviewSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1SubjectAccessReviewSpec$new(
      extra = NULL,
      groups = NULL,
      non_resource_attributes = NULL,
      resource_attributes = NULL,
      uid = NULL,
      user = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1SubjectAccessReviewSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1SubjectAccessReviewSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
