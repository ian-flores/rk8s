# V1HorizontalPodAutoscalerStatus

V1HorizontalPodAutoscalerStatus

V1HorizontalPodAutoscalerStatus

## Details

current status of a horizontal pod autoscaler

## Methods

### Public methods

- [`V1HorizontalPodAutoscalerStatus$new()`](#method-V1HorizontalPodAutoscalerStatus-new)

- [`V1HorizontalPodAutoscalerStatus$to_list()`](#method-V1HorizontalPodAutoscalerStatus-to_list)

- [`V1HorizontalPodAutoscalerStatus$clone()`](#method-V1HorizontalPodAutoscalerStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1HorizontalPodAutoscalerStatus$new(
      current_cpu_utilization_percentage = NULL,
      current_replicas = NULL,
      desired_replicas = NULL,
      last_scale_time = NULL,
      observed_generation = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1HorizontalPodAutoscalerStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1HorizontalPodAutoscalerStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
