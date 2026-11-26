# V2HorizontalPodAutoscalerCondition

V2HorizontalPodAutoscalerCondition

V2HorizontalPodAutoscalerCondition

## Details

HorizontalPodAutoscalerCondition describes the state of a
HorizontalPodAutoscaler at a certain point.

## Methods

### Public methods

- [`V2HorizontalPodAutoscalerCondition$new()`](#method-V2HorizontalPodAutoscalerCondition-new)

- [`V2HorizontalPodAutoscalerCondition$to_list()`](#method-V2HorizontalPodAutoscalerCondition-to_list)

- [`V2HorizontalPodAutoscalerCondition$clone()`](#method-V2HorizontalPodAutoscalerCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V2HorizontalPodAutoscalerCondition$new(
      last_transition_time = NULL,
      message = NULL,
      reason = NULL,
      status = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V2HorizontalPodAutoscalerCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V2HorizontalPodAutoscalerCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
