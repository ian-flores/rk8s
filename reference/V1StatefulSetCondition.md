# V1StatefulSetCondition

V1StatefulSetCondition

V1StatefulSetCondition

## Details

StatefulSetCondition describes the state of a statefulset at a certain
point.

## Methods

### Public methods

- [`V1StatefulSetCondition$new()`](#method-V1StatefulSetCondition-new)

- [`V1StatefulSetCondition$to_list()`](#method-V1StatefulSetCondition-to_list)

- [`V1StatefulSetCondition$clone()`](#method-V1StatefulSetCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1StatefulSetCondition$new(
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

    V1StatefulSetCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1StatefulSetCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
