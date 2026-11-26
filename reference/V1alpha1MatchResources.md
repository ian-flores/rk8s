# V1alpha1MatchResources

V1alpha1MatchResources

V1alpha1MatchResources

## Details

MatchResources decides whether to run the admission control policy on an
object based on whether it meets the match criteria. The exclude rules
take precedence over include rules (if a resource matches both, it is
excluded)

## Methods

### Public methods

- [`V1alpha1MatchResources$new()`](#method-V1alpha1MatchResources-new)

- [`V1alpha1MatchResources$to_list()`](#method-V1alpha1MatchResources-to_list)

- [`V1alpha1MatchResources$clone()`](#method-V1alpha1MatchResources-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha1MatchResources$new(
      exclude_resource_rules = NULL,
      match_policy = NULL,
      namespace_selector = NULL,
      object_selector = NULL,
      resource_rules = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha1MatchResources$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha1MatchResources$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
