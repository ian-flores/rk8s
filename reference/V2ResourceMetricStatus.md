# V2ResourceMetricStatus

V2ResourceMetricStatus

V2ResourceMetricStatus

## Details

ResourceMetricStatus indicates the current value of a resource metric
known to Kubernetes, as specified in requests and limits, describing
each pod in the current scale target (e.g. CPU or memory). Such metrics
are built in to Kubernetes, and have special scaling options on top of
those available to normal per-pod metrics using the "pods" source.

## Methods

### Public methods

- [`V2ResourceMetricStatus$new()`](#method-V2ResourceMetricStatus-new)

- [`V2ResourceMetricStatus$to_list()`](#method-V2ResourceMetricStatus-to_list)

- [`V2ResourceMetricStatus$clone()`](#method-V2ResourceMetricStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2ResourceMetricStatus$new(current = NULL, name = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2ResourceMetricStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2ResourceMetricStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
