# V2HorizontalPodAutoscaler

V2HorizontalPodAutoscaler

V2HorizontalPodAutoscaler

## Details

HorizontalPodAutoscaler is the configuration for a horizontal pod
autoscaler, which automatically manages the replica count of any
resource implementing the scale subresource based on the metrics
specified.

## Methods

### Public methods

- [`V2HorizontalPodAutoscaler$new()`](#method-V2HorizontalPodAutoscaler-new)

- [`V2HorizontalPodAutoscaler$to_list()`](#method-V2HorizontalPodAutoscaler-to_list)

- [`V2HorizontalPodAutoscaler$clone()`](#method-V2HorizontalPodAutoscaler-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2HorizontalPodAutoscaler$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL,
      status = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2HorizontalPodAutoscaler$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2HorizontalPodAutoscaler$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
