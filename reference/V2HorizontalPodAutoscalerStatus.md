# V2HorizontalPodAutoscalerStatus

V2HorizontalPodAutoscalerStatus

V2HorizontalPodAutoscalerStatus

## Details

HorizontalPodAutoscalerStatus describes the current status of a
horizontal pod autoscaler.

## Methods

### Public methods

- [`V2HorizontalPodAutoscalerStatus$new()`](#method-V2HorizontalPodAutoscalerStatus-new)

- [`V2HorizontalPodAutoscalerStatus$to_list()`](#method-V2HorizontalPodAutoscalerStatus-to_list)

- [`V2HorizontalPodAutoscalerStatus$clone()`](#method-V2HorizontalPodAutoscalerStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2HorizontalPodAutoscalerStatus$new(
      conditions = NULL,
      current_metrics = NULL,
      current_replicas = NULL,
      desired_replicas = NULL,
      last_scale_time = NULL,
      observed_generation = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2HorizontalPodAutoscalerStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2HorizontalPodAutoscalerStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
