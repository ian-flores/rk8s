# V1ContainerState

V1ContainerState

V1ContainerState

## Details

ContainerState holds a possible state of container. Only one of its
members may be specified. If none of them is specified, the default one
is ContainerStateWaiting.

## Methods

### Public methods

- [`V1ContainerState$new()`](#method-V1ContainerState-new)

- [`V1ContainerState$to_list()`](#method-V1ContainerState-to_list)

- [`V1ContainerState$clone()`](#method-V1ContainerState-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ContainerState$new(running = NULL, terminated = NULL, waiting = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ContainerState$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ContainerState$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
