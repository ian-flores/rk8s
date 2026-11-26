# V2ObjectMetricStatus

V2ObjectMetricStatus

V2ObjectMetricStatus

## Details

ObjectMetricStatus indicates the current value of a metric describing a
kubernetes object (for example, hits-per-second on an Ingress object).

## Methods

### Public methods

- [`V2ObjectMetricStatus$new()`](#method-V2ObjectMetricStatus-new)

- [`V2ObjectMetricStatus$to_list()`](#method-V2ObjectMetricStatus-to_list)

- [`V2ObjectMetricStatus$clone()`](#method-V2ObjectMetricStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2ObjectMetricStatus$new(
      current = NULL,
      described_object = NULL,
      metric = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2ObjectMetricStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2ObjectMetricStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
