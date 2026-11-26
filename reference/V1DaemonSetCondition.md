# V1DaemonSetCondition

V1DaemonSetCondition

V1DaemonSetCondition

## Details

DaemonSetCondition describes the state of a DaemonSet at a certain
point.

## Methods

### Public methods

- [`V1DaemonSetCondition$new()`](#method-V1DaemonSetCondition-new)

- [`V1DaemonSetCondition$to_list()`](#method-V1DaemonSetCondition-to_list)

- [`V1DaemonSetCondition$clone()`](#method-V1DaemonSetCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1DaemonSetCondition$new(
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

    V1DaemonSetCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1DaemonSetCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
