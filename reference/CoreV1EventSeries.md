# CoreV1EventSeries

CoreV1EventSeries

CoreV1EventSeries

## Details

EventSeries contain information on series of events, i.e. thing that
was/is happening continuously for some time.

## Methods

### Public methods

- [`CoreV1EventSeries$new()`](#method-CoreV1EventSeries-new)

- [`CoreV1EventSeries$to_list()`](#method-CoreV1EventSeries-to_list)

- [`CoreV1EventSeries$clone()`](#method-CoreV1EventSeries-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    CoreV1EventSeries$new(count = NULL, last_observed_time = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    CoreV1EventSeries$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    CoreV1EventSeries$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
