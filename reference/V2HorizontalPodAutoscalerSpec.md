# V2HorizontalPodAutoscalerSpec

V2HorizontalPodAutoscalerSpec

V2HorizontalPodAutoscalerSpec

## Details

HorizontalPodAutoscalerSpec describes the desired functionality of the
HorizontalPodAutoscaler.

## Methods

### Public methods

- [`V2HorizontalPodAutoscalerSpec$new()`](#method-V2HorizontalPodAutoscalerSpec-new)

- [`V2HorizontalPodAutoscalerSpec$to_list()`](#method-V2HorizontalPodAutoscalerSpec-to_list)

- [`V2HorizontalPodAutoscalerSpec$clone()`](#method-V2HorizontalPodAutoscalerSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2HorizontalPodAutoscalerSpec$new(
      behavior = NULL,
      max_replicas = NULL,
      metrics = NULL,
      min_replicas = NULL,
      scale_target_ref = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2HorizontalPodAutoscalerSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2HorizontalPodAutoscalerSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
