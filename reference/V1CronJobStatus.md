# V1CronJobStatus

V1CronJobStatus

V1CronJobStatus

## Details

CronJobStatus represents the current state of a cron job.

## Methods

### Public methods

- [`V1CronJobStatus$new()`](#method-V1CronJobStatus-new)

- [`V1CronJobStatus$to_list()`](#method-V1CronJobStatus-to_list)

- [`V1CronJobStatus$clone()`](#method-V1CronJobStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CronJobStatus$new(
      active = NULL,
      last_schedule_time = NULL,
      last_successful_time = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CronJobStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CronJobStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
