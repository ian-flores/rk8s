# V1TokenReview

V1TokenReview

V1TokenReview

## Details

TokenReview attempts to authenticate a token to a known user. Note:
TokenReview requests may be cached by the webhook token authenticator
plugin in the kube-apiserver.

## Methods

### Public methods

- [`V1TokenReview$new()`](#method-V1TokenReview-new)

- [`V1TokenReview$to_list()`](#method-V1TokenReview-to_list)

- [`V1TokenReview$clone()`](#method-V1TokenReview-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1TokenReview$new(
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

    V1TokenReview$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1TokenReview$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
