# V1JSON

V1JSON

V1JSON

## Details

JSON represents any valid JSON value. These types are supported: bool,
int64, float64, string, interface, mapstringinterface and nil.

## Public fields

- `value`:

  Underlying scalar / unstructured value.

## Methods

### Public methods

- [`V1JSON$new()`](#method-V1JSON-new)

- [`V1JSON$to_list()`](#method-V1JSON-to_list)

- [`V1JSON$clone()`](#method-V1JSON-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1JSON$new(value = NULL)

#### Arguments

- `value`:

  The underlying value.

------------------------------------------------------------------------

### Method `to_list()`

Return the underlying value (no key wrapping).

#### Usage

    V1JSON$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1JSON$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
