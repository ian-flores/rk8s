# V1ReplicaSetCondition

V1ReplicaSetCondition

V1ReplicaSetCondition

## Details

ReplicaSetCondition describes the state of a replica set at a certain
point.

## Methods

### Public methods

- [`V1ReplicaSetCondition$new()`](#method-V1ReplicaSetCondition-new)

- [`V1ReplicaSetCondition$to_list()`](#method-V1ReplicaSetCondition-to_list)

- [`V1ReplicaSetCondition$clone()`](#method-V1ReplicaSetCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ReplicaSetCondition$new(
      last_transition_time = NULL,
      message = NULL,
      reason = NULL,
      status = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ReplicaSetCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ReplicaSetCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
