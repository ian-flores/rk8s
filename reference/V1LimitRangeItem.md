# V1LimitRangeItem

V1LimitRangeItem

V1LimitRangeItem

## Details

LimitRangeItem defines a min/max usage limit for any resource that
matches on kind.

## Methods

### Public methods

- [`V1LimitRangeItem$new()`](#method-V1LimitRangeItem-new)

- [`V1LimitRangeItem$to_list()`](#method-V1LimitRangeItem-to_list)

- [`V1LimitRangeItem$clone()`](#method-V1LimitRangeItem-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1LimitRangeItem$new(
      default = NULL,
      default_request = NULL,
      max = NULL,
      max_limit_request_ratio = NULL,
      min = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1LimitRangeItem$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1LimitRangeItem$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
