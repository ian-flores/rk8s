# V1Time

V1Time

V1Time

## Details

Time is a wrapper around time.Time which supports correct marshaling to
YAML and JSON. Wrappers are provided for many of the factory methods
that the time package offers.

## Public fields

- `value`:

  Underlying scalar / unstructured value.

## Methods

### Public methods

- [`V1Time$new()`](#method-V1Time-new)

- [`V1Time$to_list()`](#method-V1Time-to_list)

- [`V1Time$clone()`](#method-V1Time-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Time$new(value = NULL)

#### Arguments

- `value`:

  The underlying value.

------------------------------------------------------------------------

### Method `to_list()`

Return the underlying value (no key wrapping).

#### Usage

    V1Time$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Time$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
