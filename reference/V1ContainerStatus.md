# V1ContainerStatus

V1ContainerStatus

V1ContainerStatus

## Details

ContainerStatus contains details for the current status of this
container.

## Methods

### Public methods

- [`V1ContainerStatus$new()`](#method-V1ContainerStatus-new)

- [`V1ContainerStatus$to_list()`](#method-V1ContainerStatus-to_list)

- [`V1ContainerStatus$clone()`](#method-V1ContainerStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ContainerStatus$new(
      allocated_resources = NULL,
      allocated_resources_status = NULL,
      container_id = NULL,
      image = NULL,
      image_id = NULL,
      last_state = NULL,
      name = NULL,
      ready = NULL,
      resources = NULL,
      restart_count = NULL,
      started = NULL,
      state = NULL,
      user = NULL,
      volume_mounts = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ContainerStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ContainerStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
