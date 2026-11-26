# V1PodAntiAffinity

V1PodAntiAffinity

V1PodAntiAffinity

## Details

Pod anti affinity is a group of inter pod anti affinity scheduling
rules.

## Methods

### Public methods

- [`V1PodAntiAffinity$new()`](#method-V1PodAntiAffinity-new)

- [`V1PodAntiAffinity$to_list()`](#method-V1PodAntiAffinity-to_list)

- [`V1PodAntiAffinity$clone()`](#method-V1PodAntiAffinity-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodAntiAffinity$new(
      preferred_during_scheduling_ignored_during_execution = NULL,
      required_during_scheduling_ignored_during_execution = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PodAntiAffinity$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodAntiAffinity$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
