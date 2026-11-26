# EventsV1Event

EventsV1Event

EventsV1Event

## Details

Event is a report of an event somewhere in the cluster. It generally
denotes some state change in the system. Events have a limited retention
time and triggers and messages may evolve with time. Event consumers
should not rely on the timing of an event with a given Reason reflecting
a consistent underlying trigger, or the continued existence of events
with that Reason. Events should be treated as informative, best-effort,
supplemental data.

## Methods

### Public methods

- [`EventsV1Event$new()`](#method-EventsV1Event-new)

- [`EventsV1Event$to_list()`](#method-EventsV1Event-to_list)

- [`EventsV1Event$clone()`](#method-EventsV1Event-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    EventsV1Event$new(
      action = NULL,
      api_version = NULL,
      deprecated_count = NULL,
      deprecated_first_timestamp = NULL,
      deprecated_last_timestamp = NULL,
      deprecated_source = NULL,
      event_time = NULL,
      kind = NULL,
      metadata = NULL,
      note = NULL,
      reason = NULL,
      regarding = NULL,
      related = NULL,
      reporting_controller = NULL,
      reporting_instance = NULL,
      series = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    EventsV1Event$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    EventsV1Event$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
