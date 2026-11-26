# V1CronJobSpec

V1CronJobSpec

V1CronJobSpec

## Details

CronJobSpec describes how the job execution will look like and when it
will actually run.

## Methods

### Public methods

- [`V1CronJobSpec$new()`](#method-V1CronJobSpec-new)

- [`V1CronJobSpec$to_list()`](#method-V1CronJobSpec-to_list)

- [`V1CronJobSpec$clone()`](#method-V1CronJobSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CronJobSpec$new(
      concurrency_policy = NULL,
      failed_jobs_history_limit = NULL,
      job_template = NULL,
      schedule = NULL,
      starting_deadline_seconds = NULL,
      successful_jobs_history_limit = NULL,
      suspend = NULL,
      time_zone = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CronJobSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CronJobSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
