# V1FieldsV1

V1FieldsV1

V1FieldsV1

## Details

FieldsV1 stores a set of fields in a data structure like a Trie, in JSON
format.

Each key is either a '.' representing the field itself, and will always
map to an empty set, or a string representing a sub-field or item. The
string will follow one of these four formats: 'f:\<name\>', where
\<name\> is the name of a field in a struct, or key in a map
'v:\<value\>', where \<value\> is the exact json formatted value of a
list item 'i:\<index\>', where \<index\> is position of a item in a list
'k:\<keys\>', where \<keys\> is a map of a list item's key fields to
their unique values If a key maps to an empty Fields value, the field
that key represents is part of the set.

The exact format is defined in sigs.k8s.io/structured-merge-diff

## Public fields

- `value`:

  Underlying scalar / unstructured value.

## Methods

### Public methods

- [`V1FieldsV1$new()`](#method-V1FieldsV1-new)

- [`V1FieldsV1$to_list()`](#method-V1FieldsV1-to_list)

- [`V1FieldsV1$clone()`](#method-V1FieldsV1-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1FieldsV1$new(value = NULL)

#### Arguments

- `value`:

  The underlying value.

------------------------------------------------------------------------

### Method `to_list()`

Return the underlying value (no key wrapping).

#### Usage

    V1FieldsV1$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1FieldsV1$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
