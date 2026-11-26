# V1JobSpec

V1JobSpec

V1JobSpec

## Details

JobSpec describes how the job execution will look like.

## Methods

### Public methods

- [`V1JobSpec$new()`](#method-V1JobSpec-new)

- [`V1JobSpec$to_list()`](#method-V1JobSpec-to_list)

- [`V1JobSpec$clone()`](#method-V1JobSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1JobSpec$new(
      active_deadline_seconds = NULL,
      backoff_limit = NULL,
      backoff_limit_per_index = NULL,
      completion_mode = NULL,
      completions = NULL,
      managed_by = NULL,
      manual_selector = NULL,
      max_failed_indexes = NULL,
      parallelism = NULL,
      pod_failure_policy = NULL,
      pod_replacement_policy = NULL,
      selector = NULL,
      success_policy = NULL,
      suspend = NULL,
      template = NULL,
      ttl_seconds_after_finished = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1JobSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1JobSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
