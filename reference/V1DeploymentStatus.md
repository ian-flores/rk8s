# V1DeploymentStatus

V1DeploymentStatus

V1DeploymentStatus

## Details

DeploymentStatus is the most recently observed status of the Deployment.

## Methods

### Public methods

- [`V1DeploymentStatus$new()`](#method-V1DeploymentStatus-new)

- [`V1DeploymentStatus$to_list()`](#method-V1DeploymentStatus-to_list)

- [`V1DeploymentStatus$clone()`](#method-V1DeploymentStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1DeploymentStatus$new(
      available_replicas = NULL,
      collision_count = NULL,
      conditions = NULL,
      observed_generation = NULL,
      ready_replicas = NULL,
      replicas = NULL,
      unavailable_replicas = NULL,
      updated_replicas = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1DeploymentStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1DeploymentStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
