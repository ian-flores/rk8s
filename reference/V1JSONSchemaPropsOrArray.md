# V1JSONSchemaPropsOrArray

V1JSONSchemaPropsOrArray

V1JSONSchemaPropsOrArray

## Details

JSONSchemaPropsOrArray represents a value that can either be a
JSONSchemaProps or an array of JSONSchemaProps. Mainly here for
serialization purposes.

## Public fields

- `value`:

  Underlying scalar / unstructured value.

## Methods

### Public methods

- [`V1JSONSchemaPropsOrArray$new()`](#method-V1JSONSchemaPropsOrArray-new)

- [`V1JSONSchemaPropsOrArray$to_list()`](#method-V1JSONSchemaPropsOrArray-to_list)

- [`V1JSONSchemaPropsOrArray$clone()`](#method-V1JSONSchemaPropsOrArray-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1JSONSchemaPropsOrArray$new(value = NULL)

#### Arguments

- `value`:

  The underlying value.

------------------------------------------------------------------------

### Method `to_list()`

Return the underlying value (no key wrapping).

#### Usage

    V1JSONSchemaPropsOrArray$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1JSONSchemaPropsOrArray$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
