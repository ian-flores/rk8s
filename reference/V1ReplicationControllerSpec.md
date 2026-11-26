# V1ReplicationControllerSpec

V1ReplicationControllerSpec

V1ReplicationControllerSpec

## Details

ReplicationControllerSpec is the specification of a replication
controller.

## Methods

### Public methods

- [`V1ReplicationControllerSpec$new()`](#method-V1ReplicationControllerSpec-new)

- [`V1ReplicationControllerSpec$to_list()`](#method-V1ReplicationControllerSpec-to_list)

- [`V1ReplicationControllerSpec$clone()`](#method-V1ReplicationControllerSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ReplicationControllerSpec$new(
      min_ready_seconds = NULL,
      replicas = NULL,
      selector = NULL,
      template = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ReplicationControllerSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ReplicationControllerSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
