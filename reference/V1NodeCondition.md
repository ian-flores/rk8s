# V1NodeCondition

V1NodeCondition

V1NodeCondition

## Details

NodeCondition contains condition information for a node.

## Methods

### Public methods

- [`V1NodeCondition$new()`](#method-V1NodeCondition-new)

- [`V1NodeCondition$to_list()`](#method-V1NodeCondition-to_list)

- [`V1NodeCondition$clone()`](#method-V1NodeCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NodeCondition$new(
      last_heartbeat_time = NULL,
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

    V1NodeCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NodeCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
