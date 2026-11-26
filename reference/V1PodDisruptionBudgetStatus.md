# V1PodDisruptionBudgetStatus

V1PodDisruptionBudgetStatus

V1PodDisruptionBudgetStatus

## Details

PodDisruptionBudgetStatus represents information about the status of a
PodDisruptionBudget. Status may trail the actual state of a system.

## Methods

### Public methods

- [`V1PodDisruptionBudgetStatus$new()`](#method-V1PodDisruptionBudgetStatus-new)

- [`V1PodDisruptionBudgetStatus$to_list()`](#method-V1PodDisruptionBudgetStatus-to_list)

- [`V1PodDisruptionBudgetStatus$clone()`](#method-V1PodDisruptionBudgetStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodDisruptionBudgetStatus$new(
      conditions = NULL,
      current_healthy = NULL,
      desired_healthy = NULL,
      disrupted_pods = NULL,
      disruptions_allowed = NULL,
      expected_pods = NULL,
      observed_generation = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PodDisruptionBudgetStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodDisruptionBudgetStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
