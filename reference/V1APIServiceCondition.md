# V1APIServiceCondition

V1APIServiceCondition

V1APIServiceCondition

## Details

APIServiceCondition describes the state of an APIService at a particular
point

## Methods

### Public methods

- [`V1APIServiceCondition$new()`](#method-V1APIServiceCondition-new)

- [`V1APIServiceCondition$to_list()`](#method-V1APIServiceCondition-to_list)

- [`V1APIServiceCondition$clone()`](#method-V1APIServiceCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1APIServiceCondition$new(
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

    V1APIServiceCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1APIServiceCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
