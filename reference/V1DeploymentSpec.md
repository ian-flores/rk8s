# V1DeploymentSpec

V1DeploymentSpec

V1DeploymentSpec

## Details

DeploymentSpec is the specification of the desired behavior of the
Deployment.

## Methods

### Public methods

- [`V1DeploymentSpec$new()`](#method-V1DeploymentSpec-new)

- [`V1DeploymentSpec$to_list()`](#method-V1DeploymentSpec-to_list)

- [`V1DeploymentSpec$clone()`](#method-V1DeploymentSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1DeploymentSpec$new(
      min_ready_seconds = NULL,
      paused = NULL,
      progress_deadline_seconds = NULL,
      replicas = NULL,
      revision_history_limit = NULL,
      selector = NULL,
      strategy = NULL,
      template = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1DeploymentSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1DeploymentSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
