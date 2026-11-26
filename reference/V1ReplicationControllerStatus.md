# V1ReplicationControllerStatus

V1ReplicationControllerStatus

V1ReplicationControllerStatus

## Details

ReplicationControllerStatus represents the current status of a
replication controller.

## Methods

### Public methods

- [`V1ReplicationControllerStatus$new()`](#method-V1ReplicationControllerStatus-new)

- [`V1ReplicationControllerStatus$to_list()`](#method-V1ReplicationControllerStatus-to_list)

- [`V1ReplicationControllerStatus$clone()`](#method-V1ReplicationControllerStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ReplicationControllerStatus$new(
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

    V1ReplicationControllerStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ReplicationControllerStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
