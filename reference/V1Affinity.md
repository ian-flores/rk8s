# V1Affinity

V1Affinity

V1Affinity

## Details

Affinity is a group of affinity scheduling rules.

## Methods

### Public methods

- [`V1Affinity$new()`](#method-V1Affinity-new)

- [`V1Affinity$to_list()`](#method-V1Affinity-to_list)

- [`V1Affinity$clone()`](#method-V1Affinity-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Affinity$new(
      node_affinity = NULL,
      pod_affinity = NULL,
      pod_anti_affinity = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Affinity$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Affinity$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
