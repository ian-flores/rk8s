# V1PodDisruptionBudgetSpec

V1PodDisruptionBudgetSpec

V1PodDisruptionBudgetSpec

## Details

PodDisruptionBudgetSpec is a description of a PodDisruptionBudget.

## Methods

### Public methods

- [`V1PodDisruptionBudgetSpec$new()`](#method-V1PodDisruptionBudgetSpec-new)

- [`V1PodDisruptionBudgetSpec$to_list()`](#method-V1PodDisruptionBudgetSpec-to_list)

- [`V1PodDisruptionBudgetSpec$clone()`](#method-V1PodDisruptionBudgetSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodDisruptionBudgetSpec$new(
      max_unavailable = NULL,
      min_available = NULL,
      selector = NULL,
      unhealthy_pod_eviction_policy = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PodDisruptionBudgetSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodDisruptionBudgetSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
