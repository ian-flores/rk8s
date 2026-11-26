# V1PodFailurePolicyRule

V1PodFailurePolicyRule

V1PodFailurePolicyRule

## Details

PodFailurePolicyRule describes how a pod failure is handled when the
requirements are met. One of onExitCodes and onPodConditions, but not
both, can be used in each rule.

## Methods

### Public methods

- [`V1PodFailurePolicyRule$new()`](#method-V1PodFailurePolicyRule-new)

- [`V1PodFailurePolicyRule$to_list()`](#method-V1PodFailurePolicyRule-to_list)

- [`V1PodFailurePolicyRule$clone()`](#method-V1PodFailurePolicyRule-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodFailurePolicyRule$new(
      action = NULL,
      on_exit_codes = NULL,
      on_pod_conditions = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PodFailurePolicyRule$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodFailurePolicyRule$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
