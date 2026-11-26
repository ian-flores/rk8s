# V1NodeAffinity

V1NodeAffinity

V1NodeAffinity

## Details

Node affinity is a group of node affinity scheduling rules.

## Methods

### Public methods

- [`V1NodeAffinity$new()`](#method-V1NodeAffinity-new)

- [`V1NodeAffinity$to_list()`](#method-V1NodeAffinity-to_list)

- [`V1NodeAffinity$clone()`](#method-V1NodeAffinity-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NodeAffinity$new(
      preferred_during_scheduling_ignored_during_execution = NULL,
      required_during_scheduling_ignored_during_execution = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NodeAffinity$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NodeAffinity$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
