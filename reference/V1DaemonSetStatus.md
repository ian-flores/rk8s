# V1DaemonSetStatus

V1DaemonSetStatus

V1DaemonSetStatus

## Details

DaemonSetStatus represents the current status of a daemon set.

## Methods

### Public methods

- [`V1DaemonSetStatus$new()`](#method-V1DaemonSetStatus-new)

- [`V1DaemonSetStatus$to_list()`](#method-V1DaemonSetStatus-to_list)

- [`V1DaemonSetStatus$clone()`](#method-V1DaemonSetStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1DaemonSetStatus$new(
      collision_count = NULL,
      conditions = NULL,
      current_number_scheduled = NULL,
      desired_number_scheduled = NULL,
      number_available = NULL,
      number_misscheduled = NULL,
      number_ready = NULL,
      number_unavailable = NULL,
      observed_generation = NULL,
      updated_number_scheduled = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1DaemonSetStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1DaemonSetStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
