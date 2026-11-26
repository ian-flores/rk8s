# V1HorizontalPodAutoscalerSpec

V1HorizontalPodAutoscalerSpec

V1HorizontalPodAutoscalerSpec

## Details

specification of a horizontal pod autoscaler.

## Methods

### Public methods

- [`V1HorizontalPodAutoscalerSpec$new()`](#method-V1HorizontalPodAutoscalerSpec-new)

- [`V1HorizontalPodAutoscalerSpec$to_list()`](#method-V1HorizontalPodAutoscalerSpec-to_list)

- [`V1HorizontalPodAutoscalerSpec$clone()`](#method-V1HorizontalPodAutoscalerSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1HorizontalPodAutoscalerSpec$new(
      max_replicas = NULL,
      min_replicas = NULL,
      scale_target_ref = NULL,
      target_cpu_utilization_percentage = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1HorizontalPodAutoscalerSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1HorizontalPodAutoscalerSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
