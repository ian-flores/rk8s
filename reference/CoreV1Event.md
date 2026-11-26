# CoreV1Event

CoreV1Event

CoreV1Event

## Details

Event is a report of an event somewhere in the cluster. Events have a
limited retention time and triggers and messages may evolve with time.
Event consumers should not rely on the timing of an event with a given
Reason reflecting a consistent underlying trigger, or the continued
existence of events with that Reason. Events should be treated as
informative, best-effort, supplemental data.

## Methods

### Public methods

- [`CoreV1Event$new()`](#method-CoreV1Event-new)

- [`CoreV1Event$to_list()`](#method-CoreV1Event-to_list)

- [`CoreV1Event$clone()`](#method-CoreV1Event-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    CoreV1Event$new(
      action = NULL,
      api_version = NULL,
      count = NULL,
      event_time = NULL,
      first_timestamp = NULL,
      involved_object = NULL,
      kind = NULL,
      last_timestamp = NULL,
      message = NULL,
      metadata = NULL,
      reason = NULL,
      related = NULL,
      reporting_component = NULL,
      reporting_instance = NULL,
      series = NULL,
      source = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    CoreV1Event$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    CoreV1Event$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
