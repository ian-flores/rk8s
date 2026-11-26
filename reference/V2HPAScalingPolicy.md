# V2HPAScalingPolicy

V2HPAScalingPolicy

V2HPAScalingPolicy

## Details

HPAScalingPolicy is a single policy which must hold true for a specified
past interval.

## Methods

### Public methods

- [`V2HPAScalingPolicy$new()`](#method-V2HPAScalingPolicy-new)

- [`V2HPAScalingPolicy$to_list()`](#method-V2HPAScalingPolicy-to_list)

- [`V2HPAScalingPolicy$clone()`](#method-V2HPAScalingPolicy-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2HPAScalingPolicy$new(period_seconds = NULL, type = NULL, value = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2HPAScalingPolicy$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2HPAScalingPolicy$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
