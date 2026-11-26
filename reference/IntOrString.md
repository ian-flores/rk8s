# IntOrString

IntOrString

IntOrString

## Details

IntOrString is a type that can hold an int32 or a string. When used in
JSON or YAML marshalling and unmarshalling, it produces or consumes the
inner type. This allows you to have, for example, a JSON field that can
accept a name or number.

## Public fields

- `value`:

  Underlying scalar / unstructured value.

## Methods

### Public methods

- [`IntOrString$new()`](#method-IntOrString-new)

- [`IntOrString$to_list()`](#method-IntOrString-to_list)

- [`IntOrString$clone()`](#method-IntOrString-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    IntOrString$new(value = NULL)

#### Arguments

- `value`:

  The underlying value.

------------------------------------------------------------------------

### Method `to_list()`

Return the underlying value (no key wrapping).

#### Usage

    IntOrString$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    IntOrString$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
