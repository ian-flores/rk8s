# V1MatchResources

V1MatchResources

V1MatchResources

## Details

MatchResources decides whether to run the admission control policy on an
object based on whether it meets the match criteria. The exclude rules
take precedence over include rules (if a resource matches both, it is
excluded)

## Methods

### Public methods

- [`V1MatchResources$new()`](#method-V1MatchResources-new)

- [`V1MatchResources$to_list()`](#method-V1MatchResources-to_list)

- [`V1MatchResources$clone()`](#method-V1MatchResources-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1MatchResources$new(
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

    V1MatchResources$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1MatchResources$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
