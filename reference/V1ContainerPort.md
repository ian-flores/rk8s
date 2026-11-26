# V1ContainerPort

V1ContainerPort

V1ContainerPort

## Details

ContainerPort represents a network port in a single container.

## Methods

### Public methods

- [`V1ContainerPort$new()`](#method-V1ContainerPort-new)

- [`V1ContainerPort$to_list()`](#method-V1ContainerPort-to_list)

- [`V1ContainerPort$clone()`](#method-V1ContainerPort-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ContainerPort$new(
      container_port = NULL,
      host_ip = NULL,
      host_port = NULL,
      name = NULL,
      protocol = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ContainerPort$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ContainerPort$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
