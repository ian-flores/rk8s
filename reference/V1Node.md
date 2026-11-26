# V1Node

V1Node

V1Node

## Details

Node is a worker node in Kubernetes. Each node will have a unique
identifier in the cache (i.e. in etcd).

## Methods

### Public methods

- [`V1Node$new()`](#method-V1Node-new)

- [`V1Node$to_list()`](#method-V1Node-to_list)

- [`V1Node$clone()`](#method-V1Node-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Node$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL,
      status = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Node$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Node$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
