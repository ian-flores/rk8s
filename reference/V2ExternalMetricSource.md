# V2ExternalMetricSource

V2ExternalMetricSource

V2ExternalMetricSource

## Details

ExternalMetricSource indicates how to scale on a metric not associated
with any Kubernetes object (for example length of queue in cloud
messaging service, or QPS from loadbalancer running outside of cluster).

## Methods

### Public methods

- [`V2ExternalMetricSource$new()`](#method-V2ExternalMetricSource-new)

- [`V2ExternalMetricSource$to_list()`](#method-V2ExternalMetricSource-to_list)

- [`V2ExternalMetricSource$clone()`](#method-V2ExternalMetricSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2ExternalMetricSource$new(metric = NULL, target = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2ExternalMetricSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2ExternalMetricSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
