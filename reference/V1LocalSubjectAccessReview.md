# V1LocalSubjectAccessReview

V1LocalSubjectAccessReview

V1LocalSubjectAccessReview

## Details

LocalSubjectAccessReview checks whether or not a user or group can
perform an action in a given namespace. Having a namespace scoped
resource makes it much easier to grant namespace scoped policy that
includes permissions checking.

## Methods

### Public methods

- [`V1LocalSubjectAccessReview$new()`](#method-V1LocalSubjectAccessReview-new)

- [`V1LocalSubjectAccessReview$to_list()`](#method-V1LocalSubjectAccessReview-to_list)

- [`V1LocalSubjectAccessReview$clone()`](#method-V1LocalSubjectAccessReview-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1LocalSubjectAccessReview$new(
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

    V1LocalSubjectAccessReview$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1LocalSubjectAccessReview$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
