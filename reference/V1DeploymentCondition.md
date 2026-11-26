# V1DeploymentCondition

V1DeploymentCondition

V1DeploymentCondition

## Details

DeploymentCondition describes the state of a deployment at a certain
point.

## Methods

### Public methods

- [`V1DeploymentCondition$new()`](#method-V1DeploymentCondition-new)

- [`V1DeploymentCondition$to_list()`](#method-V1DeploymentCondition-to_list)

- [`V1DeploymentCondition$clone()`](#method-V1DeploymentCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1DeploymentCondition$new(
      last_transition_time = NULL,
      last_update_time = NULL,
      message = NULL,
      reason = NULL,
      status = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1DeploymentCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1DeploymentCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
