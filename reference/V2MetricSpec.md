# V2MetricSpec

V2MetricSpec

V2MetricSpec

## Details

MetricSpec specifies how to scale based on a single metric (only
\`type\` and one other matching field should be set at once).

## Methods

### Public methods

- [`V2MetricSpec$new()`](#method-V2MetricSpec-new)

- [`V2MetricSpec$to_list()`](#method-V2MetricSpec-to_list)

- [`V2MetricSpec$clone()`](#method-V2MetricSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2MetricSpec$new(
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

    V2MetricSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2MetricSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
