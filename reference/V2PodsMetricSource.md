# V2PodsMetricSource

V2PodsMetricSource

V2PodsMetricSource

## Details

PodsMetricSource indicates how to scale on a metric describing each pod
in the current scale target (for example,
transactions-processed-per-second). The values will be averaged together
before being compared to the target value.

## Methods

### Public methods

- [`V2PodsMetricSource$new()`](#method-V2PodsMetricSource-new)

- [`V2PodsMetricSource$to_list()`](#method-V2PodsMetricSource-to_list)

- [`V2PodsMetricSource$clone()`](#method-V2PodsMetricSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2PodsMetricSource$new(metric = NULL, target = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2PodsMetricSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2PodsMetricSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
