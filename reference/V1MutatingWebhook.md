# V1MutatingWebhook

V1MutatingWebhook

V1MutatingWebhook

## Details

MutatingWebhook describes an admission webhook and the resources and
operations it applies to.

## Methods

### Public methods

- [`V1MutatingWebhook$new()`](#method-V1MutatingWebhook-new)

- [`V1MutatingWebhook$to_list()`](#method-V1MutatingWebhook-to_list)

- [`V1MutatingWebhook$clone()`](#method-V1MutatingWebhook-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1MutatingWebhook$new(
      admission_review_versions = NULL,
      client_config = NULL,
      failure_policy = NULL,
      match_conditions = NULL,
      match_policy = NULL,
      name = NULL,
      namespace_selector = NULL,
      object_selector = NULL,
      reinvocation_policy = NULL,
      rules = NULL,
      side_effects = NULL,
      timeout_seconds = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1MutatingWebhook$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1MutatingWebhook$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
