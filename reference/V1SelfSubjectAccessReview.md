# V1SelfSubjectAccessReview

V1SelfSubjectAccessReview

V1SelfSubjectAccessReview

## Details

SelfSubjectAccessReview checks whether or the current user can perform
an action. Not filling in a spec.namespace means "in all namespaces".
Self is a special case, because users should always be able to check
whether they can perform an action

## Methods

### Public methods

- [`V1SelfSubjectAccessReview$new()`](#method-V1SelfSubjectAccessReview-new)

- [`V1SelfSubjectAccessReview$to_list()`](#method-V1SelfSubjectAccessReview-to_list)

- [`V1SelfSubjectAccessReview$clone()`](#method-V1SelfSubjectAccessReview-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1SelfSubjectAccessReview$new(
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

    V1SelfSubjectAccessReview$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1SelfSubjectAccessReview$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
