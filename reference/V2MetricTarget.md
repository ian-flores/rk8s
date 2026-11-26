# V2MetricTarget

V2MetricTarget

V2MetricTarget

## Details

MetricTarget defines the target value, average value, or average
utilization of a specific metric

## Methods

### Public methods

- [`V2MetricTarget$new()`](#method-V2MetricTarget-new)

- [`V2MetricTarget$to_list()`](#method-V2MetricTarget-to_list)

- [`V2MetricTarget$clone()`](#method-V2MetricTarget-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2MetricTarget$new(
      average_utilization = NULL,
      average_value = NULL,
      type = NULL,
      value = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2MetricTarget$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2MetricTarget$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
