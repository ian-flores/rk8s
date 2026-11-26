# V2MetricStatus

V2MetricStatus

V2MetricStatus

## Details

MetricStatus describes the last-read state of a single metric.

## Methods

### Public methods

- [`V2MetricStatus$new()`](#method-V2MetricStatus-new)

- [`V2MetricStatus$to_list()`](#method-V2MetricStatus-to_list)

- [`V2MetricStatus$clone()`](#method-V2MetricStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2MetricStatus$new(
      container_resource = NULL,
      external = NULL,
      object = NULL,
      pods = NULL,
      resource = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2MetricStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2MetricStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
