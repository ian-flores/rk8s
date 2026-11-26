# V1ContainerStateTerminated

V1ContainerStateTerminated

V1ContainerStateTerminated

## Details

ContainerStateTerminated is a terminated state of a container.

## Methods

### Public methods

- [`V1ContainerStateTerminated$new()`](#method-V1ContainerStateTerminated-new)

- [`V1ContainerStateTerminated$to_list()`](#method-V1ContainerStateTerminated-to_list)

- [`V1ContainerStateTerminated$clone()`](#method-V1ContainerStateTerminated-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ContainerStateTerminated$new(
      container_id = NULL,
      exit_code = NULL,
      finished_at = NULL,
      message = NULL,
      reason = NULL,
      signal = NULL,
      started_at = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ContainerStateTerminated$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ContainerStateTerminated$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
