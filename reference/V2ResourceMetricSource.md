# V2ResourceMetricSource

V2ResourceMetricSource

V2ResourceMetricSource

## Details

ResourceMetricSource indicates how to scale on a resource metric known
to Kubernetes, as specified in requests and limits, describing each pod
in the current scale target (e.g. CPU or memory). The values will be
averaged together before being compared to the target. Such metrics are
built in to Kubernetes, and have special scaling options on top of those
available to normal per-pod metrics using the "pods" source. Only one
"target" type should be set.

## Methods

### Public methods

- [`V2ResourceMetricSource$new()`](#method-V2ResourceMetricSource-new)

- [`V2ResourceMetricSource$to_list()`](#method-V2ResourceMetricSource-to_list)

- [`V2ResourceMetricSource$clone()`](#method-V2ResourceMetricSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2ResourceMetricSource$new(name = NULL, target = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2ResourceMetricSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2ResourceMetricSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
