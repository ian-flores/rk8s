# V1ReplicaSet

V1ReplicaSet

V1ReplicaSet

## Details

ReplicaSet ensures that a specified number of pod replicas are running
at any given time.

## Methods

### Public methods

- [`V1ReplicaSet$new()`](#method-V1ReplicaSet-new)

- [`V1ReplicaSet$to_list()`](#method-V1ReplicaSet-to_list)

- [`V1ReplicaSet$clone()`](#method-V1ReplicaSet-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ReplicaSet$new(
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

    V1ReplicaSet$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ReplicaSet$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
