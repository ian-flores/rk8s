# V1ReplicationControllerCondition

V1ReplicationControllerCondition

V1ReplicationControllerCondition

## Details

ReplicationControllerCondition describes the state of a replication
controller at a certain point.

## Methods

### Public methods

- [`V1ReplicationControllerCondition$new()`](#method-V1ReplicationControllerCondition-new)

- [`V1ReplicationControllerCondition$to_list()`](#method-V1ReplicationControllerCondition-to_list)

- [`V1ReplicationControllerCondition$clone()`](#method-V1ReplicationControllerCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ReplicationControllerCondition$new(
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

    V1ReplicationControllerCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ReplicationControllerCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
