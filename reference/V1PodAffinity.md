# V1PodAffinity

V1PodAffinity

V1PodAffinity

## Details

Pod affinity is a group of inter pod affinity scheduling rules.

## Methods

### Public methods

- [`V1PodAffinity$new()`](#method-V1PodAffinity-new)

- [`V1PodAffinity$to_list()`](#method-V1PodAffinity-to_list)

- [`V1PodAffinity$clone()`](#method-V1PodAffinity-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodAffinity$new(
      preferred_during_scheduling_ignored_during_execution = NULL,
      required_during_scheduling_ignored_during_execution = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PodAffinity$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodAffinity$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
