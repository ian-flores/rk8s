# V1NodeStatus

V1NodeStatus

V1NodeStatus

## Details

NodeStatus is information about the current status of a node.

## Methods

### Public methods

- [`V1NodeStatus$new()`](#method-V1NodeStatus-new)

- [`V1NodeStatus$to_list()`](#method-V1NodeStatus-to_list)

- [`V1NodeStatus$clone()`](#method-V1NodeStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NodeStatus$new(
      addresses = NULL,
      allocatable = NULL,
      capacity = NULL,
      conditions = NULL,
      config = NULL,
      daemon_endpoints = NULL,
      features = NULL,
      images = NULL,
      node_info = NULL,
      phase = NULL,
      runtime_handlers = NULL,
      volumes_attached = NULL,
      volumes_in_use = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NodeStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NodeStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
