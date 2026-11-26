# V1JobStatus

V1JobStatus

V1JobStatus

## Details

JobStatus represents the current state of a Job.

## Methods

### Public methods

- [`V1JobStatus$new()`](#method-V1JobStatus-new)

- [`V1JobStatus$to_list()`](#method-V1JobStatus-to_list)

- [`V1JobStatus$clone()`](#method-V1JobStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1JobStatus$new(
      active = NULL,
      completed_indexes = NULL,
      completion_time = NULL,
      conditions = NULL,
      failed = NULL,
      failed_indexes = NULL,
      ready = NULL,
      start_time = NULL,
      succeeded = NULL,
      terminating = NULL,
      uncounted_terminated_pods = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1JobStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1JobStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
