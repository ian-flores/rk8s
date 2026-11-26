# V2HPAScalingRules

V2HPAScalingRules

V2HPAScalingRules

## Details

HPAScalingRules configures the scaling behavior for one direction. These
Rules are applied after calculating DesiredReplicas from metrics for the
HPA. They can limit the scaling velocity by specifying scaling policies.
They can prevent flapping by specifying the stabilization window, so
that the number of replicas is not set instantly, instead, the safest
value from the stabilization window is chosen.

## Methods

### Public methods

- [`V2HPAScalingRules$new()`](#method-V2HPAScalingRules-new)

- [`V2HPAScalingRules$to_list()`](#method-V2HPAScalingRules-to_list)

- [`V2HPAScalingRules$clone()`](#method-V2HPAScalingRules-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2HPAScalingRules$new(
      policies = NULL,
      select_policy = NULL,
      stabilization_window_seconds = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2HPAScalingRules$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2HPAScalingRules$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
