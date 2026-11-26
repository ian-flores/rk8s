# V1StatefulSetUpdateStrategy

V1StatefulSetUpdateStrategy

V1StatefulSetUpdateStrategy

## Details

StatefulSetUpdateStrategy indicates the strategy that the StatefulSet
controller will use to perform updates. It includes any additional
parameters necessary to perform the update for the indicated strategy.

## Methods

### Public methods

- [`V1StatefulSetUpdateStrategy$new()`](#method-V1StatefulSetUpdateStrategy-new)

- [`V1StatefulSetUpdateStrategy$to_list()`](#method-V1StatefulSetUpdateStrategy-to_list)

- [`V1StatefulSetUpdateStrategy$clone()`](#method-V1StatefulSetUpdateStrategy-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1StatefulSetUpdateStrategy$new(rolling_update = NULL, type = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1StatefulSetUpdateStrategy$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1StatefulSetUpdateStrategy$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
