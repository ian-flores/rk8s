# V2ObjectMetricSource

V2ObjectMetricSource

V2ObjectMetricSource

## Details

ObjectMetricSource indicates how to scale on a metric describing a
kubernetes object (for example, hits-per-second on an Ingress object).

## Methods

### Public methods

- [`V2ObjectMetricSource$new()`](#method-V2ObjectMetricSource-new)

- [`V2ObjectMetricSource$to_list()`](#method-V2ObjectMetricSource-to_list)

- [`V2ObjectMetricSource$clone()`](#method-V2ObjectMetricSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2ObjectMetricSource$new(described_object = NULL, metric = NULL, target = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2ObjectMetricSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2ObjectMetricSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
