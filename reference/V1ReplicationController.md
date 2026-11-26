# V1ReplicationController

V1ReplicationController

V1ReplicationController

## Details

ReplicationController represents the configuration of a replication
controller.

## Methods

### Public methods

- [`V1ReplicationController$new()`](#method-V1ReplicationController-new)

- [`V1ReplicationController$to_list()`](#method-V1ReplicationController-to_list)

- [`V1ReplicationController$clone()`](#method-V1ReplicationController-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ReplicationController$new(
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

    V1ReplicationController$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ReplicationController$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
