# V1PolicyRule

V1PolicyRule

V1PolicyRule

## Details

PolicyRule holds information that describes a policy rule, but does not
contain information about who the rule applies to or which namespace the
rule applies to.

## Methods

### Public methods

- [`V1PolicyRule$new()`](#method-V1PolicyRule-new)

- [`V1PolicyRule$to_list()`](#method-V1PolicyRule-to_list)

- [`V1PolicyRule$clone()`](#method-V1PolicyRule-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PolicyRule$new(
      api_groups = NULL,
      non_resource_ur_ls = NULL,
      resource_names = NULL,
      resources = NULL,
      verbs = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PolicyRule$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PolicyRule$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
