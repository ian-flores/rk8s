# V1PodAffinityTerm

V1PodAffinityTerm

V1PodAffinityTerm

## Details

Defines a set of pods (namely those matching the labelSelector relative
to the given namespace(s)) that this pod should be co-located (affinity)
or not co-located (anti-affinity) with, where co-located is defined as
running on a node whose value of the label with key \<topologyKey\>
matches that of any node on which a pod of the set of pods is running

## Methods

### Public methods

- [`V1PodAffinityTerm$new()`](#method-V1PodAffinityTerm-new)

- [`V1PodAffinityTerm$to_list()`](#method-V1PodAffinityTerm-to_list)

- [`V1PodAffinityTerm$clone()`](#method-V1PodAffinityTerm-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodAffinityTerm$new(
      label_selector = NULL,
      match_label_keys = NULL,
      mismatch_label_keys = NULL,
      namespace_selector = NULL,
      namespaces = NULL,
      topology_key = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PodAffinityTerm$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodAffinityTerm$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
