# V1JobCondition

V1JobCondition

V1JobCondition

## Details

JobCondition describes current state of a job.

## Methods

### Public methods

- [`V1JobCondition$new()`](#method-V1JobCondition-new)

- [`V1JobCondition$to_list()`](#method-V1JobCondition-to_list)

- [`V1JobCondition$clone()`](#method-V1JobCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1JobCondition$new(
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

    V1JobCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1JobCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
