# V1ClusterRole

V1ClusterRole

V1ClusterRole

## Details

ClusterRole is a cluster level, logical grouping of PolicyRules that can
be referenced as a unit by a RoleBinding or ClusterRoleBinding.

## Methods

### Public methods

- [`V1ClusterRole$new()`](#method-V1ClusterRole-new)

- [`V1ClusterRole$to_list()`](#method-V1ClusterRole-to_list)

- [`V1ClusterRole$clone()`](#method-V1ClusterRole-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ClusterRole$new(
      aggregation_rule = NULL,
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      rules = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ClusterRole$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ClusterRole$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
