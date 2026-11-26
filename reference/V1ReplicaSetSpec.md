# V1ReplicaSetSpec

V1ReplicaSetSpec

V1ReplicaSetSpec

## Details

ReplicaSetSpec is the specification of a ReplicaSet.

## Methods

### Public methods

- [`V1ReplicaSetSpec$new()`](#method-V1ReplicaSetSpec-new)

- [`V1ReplicaSetSpec$to_list()`](#method-V1ReplicaSetSpec-to_list)

- [`V1ReplicaSetSpec$clone()`](#method-V1ReplicaSetSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ReplicaSetSpec$new(
      min_ready_seconds = NULL,
      replicas = NULL,
      selector = NULL,
      template = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ReplicaSetSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ReplicaSetSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
