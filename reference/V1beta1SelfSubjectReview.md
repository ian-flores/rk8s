# V1beta1SelfSubjectReview

V1beta1SelfSubjectReview

V1beta1SelfSubjectReview

## Details

SelfSubjectReview contains the user information that the kube-apiserver
has about the user making this request. When using impersonation, users
will receive the user info of the user being impersonated. If
impersonation or request header authentication is used, any extra keys
will have their case ignored and returned as lowercase.

## Methods

### Public methods

- [`V1beta1SelfSubjectReview$new()`](#method-V1beta1SelfSubjectReview-new)

- [`V1beta1SelfSubjectReview$to_list()`](#method-V1beta1SelfSubjectReview-to_list)

- [`V1beta1SelfSubjectReview$clone()`](#method-V1beta1SelfSubjectReview-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1beta1SelfSubjectReview$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      status = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1beta1SelfSubjectReview$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1beta1SelfSubjectReview$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
