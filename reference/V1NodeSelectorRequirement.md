# V1NodeSelectorRequirement

V1NodeSelectorRequirement

V1NodeSelectorRequirement

## Details

A node selector requirement is a selector that contains values, a key,
and an operator that relates the key and values.

## Methods

### Public methods

- [`V1NodeSelectorRequirement$new()`](#method-V1NodeSelectorRequirement-new)

- [`V1NodeSelectorRequirement$to_list()`](#method-V1NodeSelectorRequirement-to_list)

- [`V1NodeSelectorRequirement$clone()`](#method-V1NodeSelectorRequirement-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NodeSelectorRequirement$new(key = NULL, operator = NULL, values = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NodeSelectorRequirement$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NodeSelectorRequirement$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
