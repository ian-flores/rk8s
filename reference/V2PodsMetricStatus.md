# V2PodsMetricStatus

V2PodsMetricStatus

V2PodsMetricStatus

## Details

PodsMetricStatus indicates the current value of a metric describing each
pod in the current scale target (for example,
transactions-processed-per-second).

## Methods

### Public methods

- [`V2PodsMetricStatus$new()`](#method-V2PodsMetricStatus-new)

- [`V2PodsMetricStatus$to_list()`](#method-V2PodsMetricStatus-to_list)

- [`V2PodsMetricStatus$clone()`](#method-V2PodsMetricStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2PodsMetricStatus$new(current = NULL, metric = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2PodsMetricStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2PodsMetricStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
