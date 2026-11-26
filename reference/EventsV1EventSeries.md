# EventsV1EventSeries

EventsV1EventSeries

EventsV1EventSeries

## Details

EventSeries contain information on series of events, i.e. thing that
was/is happening continuously for some time. How often to update the
EventSeries is up to the event reporters. The default event reporter in
"k8s.io/client-go/tools/events/event_broadcaster.go" shows how this
struct is updated on heartbeats and can guide customized reporter
implementations.

## Methods

### Public methods

- [`EventsV1EventSeries$new()`](#method-EventsV1EventSeries-new)

- [`EventsV1EventSeries$to_list()`](#method-EventsV1EventSeries-to_list)

- [`EventsV1EventSeries$clone()`](#method-EventsV1EventSeries-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    EventsV1EventSeries$new(count = NULL, last_observed_time = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    EventsV1EventSeries$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    EventsV1EventSeries$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
