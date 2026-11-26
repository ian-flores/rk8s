# V1PodCondition

V1PodCondition

V1PodCondition

## Details

PodCondition contains details for the current condition of this pod.

## Methods

### Public methods

- [`V1PodCondition$new()`](#method-V1PodCondition-new)

- [`V1PodCondition$to_list()`](#method-V1PodCondition-to_list)

- [`V1PodCondition$clone()`](#method-V1PodCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodCondition$new(
      last_probe_time = NULL,
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

    V1PodCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
