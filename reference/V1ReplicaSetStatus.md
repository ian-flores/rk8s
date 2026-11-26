# V1ReplicaSetStatus

V1ReplicaSetStatus

V1ReplicaSetStatus

## Details

ReplicaSetStatus represents the current status of a ReplicaSet.

## Methods

### Public methods

- [`V1ReplicaSetStatus$new()`](#method-V1ReplicaSetStatus-new)

- [`V1ReplicaSetStatus$to_list()`](#method-V1ReplicaSetStatus-to_list)

- [`V1ReplicaSetStatus$clone()`](#method-V1ReplicaSetStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ReplicaSetStatus$new(
      available_replicas = NULL,
      conditions = NULL,
      fully_labeled_replicas = NULL,
      observed_generation = NULL,
      ready_replicas = NULL,
      replicas = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ReplicaSetStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ReplicaSetStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
