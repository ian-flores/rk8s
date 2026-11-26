# V1TopologySpreadConstraint

V1TopologySpreadConstraint

V1TopologySpreadConstraint

## Details

TopologySpreadConstraint specifies how to spread matching pods among the
given topology.

## Methods

### Public methods

- [`V1TopologySpreadConstraint$new()`](#method-V1TopologySpreadConstraint-new)

- [`V1TopologySpreadConstraint$to_list()`](#method-V1TopologySpreadConstraint-to_list)

- [`V1TopologySpreadConstraint$clone()`](#method-V1TopologySpreadConstraint-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1TopologySpreadConstraint$new(
      label_selector = NULL,
      match_label_keys = NULL,
      max_skew = NULL,
      min_domains = NULL,
      node_affinity_policy = NULL,
      node_taints_policy = NULL,
      topology_key = NULL,
      when_unsatisfiable = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1TopologySpreadConstraint$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1TopologySpreadConstraint$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
