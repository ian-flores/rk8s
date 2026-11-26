# V1Condition

V1Condition

V1Condition

## Details

Condition contains details for one aspect of the current state of this
API Resource.

## Methods

### Public methods

- [`V1Condition$new()`](#method-V1Condition-new)

- [`V1Condition$to_list()`](#method-V1Condition-to_list)

- [`V1Condition$clone()`](#method-V1Condition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Condition$new(
      last_transition_time = NULL,
      message = NULL,
      observed_generation = NULL,
      reason = NULL,
      status = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Condition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Condition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
