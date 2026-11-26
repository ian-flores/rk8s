# V1ValidatingWebhook

V1ValidatingWebhook

V1ValidatingWebhook

## Details

ValidatingWebhook describes an admission webhook and the resources and
operations it applies to.

## Methods

### Public methods

- [`V1ValidatingWebhook$new()`](#method-V1ValidatingWebhook-new)

- [`V1ValidatingWebhook$to_list()`](#method-V1ValidatingWebhook-to_list)

- [`V1ValidatingWebhook$clone()`](#method-V1ValidatingWebhook-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ValidatingWebhook$new(
      admission_review_versions = NULL,
      client_config = NULL,
      failure_policy = NULL,
      match_conditions = NULL,
      match_policy = NULL,
      name = NULL,
      namespace_selector = NULL,
      object_selector = NULL,
      rules = NULL,
      side_effects = NULL,
      timeout_seconds = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ValidatingWebhook$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ValidatingWebhook$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
