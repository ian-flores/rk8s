# V1PodDisruptionBudget

V1PodDisruptionBudget

V1PodDisruptionBudget

## Details

PodDisruptionBudget is an object to define the max disruption that can
be caused to a collection of pods

## Methods

### Public methods

- [`V1PodDisruptionBudget$new()`](#method-V1PodDisruptionBudget-new)

- [`V1PodDisruptionBudget$to_list()`](#method-V1PodDisruptionBudget-to_list)

- [`V1PodDisruptionBudget$clone()`](#method-V1PodDisruptionBudget-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodDisruptionBudget$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL,
      status = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PodDisruptionBudget$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodDisruptionBudget$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
