# V2ContainerResourceMetricStatus

V2ContainerResourceMetricStatus

V2ContainerResourceMetricStatus

## Details

ContainerResourceMetricStatus indicates the current value of a resource
metric known to Kubernetes, as specified in requests and limits,
describing a single container in each pod in the current scale target
(e.g. CPU or memory). Such metrics are built in to Kubernetes, and have
special scaling options on top of those available to normal per-pod
metrics using the "pods" source.

## Methods

### Public methods

- [`V2ContainerResourceMetricStatus$new()`](#method-V2ContainerResourceMetricStatus-new)

- [`V2ContainerResourceMetricStatus$to_list()`](#method-V2ContainerResourceMetricStatus-to_list)

- [`V2ContainerResourceMetricStatus$clone()`](#method-V2ContainerResourceMetricStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2ContainerResourceMetricStatus$new(
      container = NULL,
      current = NULL,
      name = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2ContainerResourceMetricStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2ContainerResourceMetricStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
