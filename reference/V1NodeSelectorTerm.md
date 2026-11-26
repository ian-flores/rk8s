# V1NodeSelectorTerm

V1NodeSelectorTerm

V1NodeSelectorTerm

## Details

A null or empty node selector term matches no objects. The requirements
of them are ANDed. The TopologySelectorTerm type implements a subset of
the NodeSelectorTerm.

## Methods

### Public methods

- [`V1NodeSelectorTerm$new()`](#method-V1NodeSelectorTerm-new)

- [`V1NodeSelectorTerm$to_list()`](#method-V1NodeSelectorTerm-to_list)

- [`V1NodeSelectorTerm$clone()`](#method-V1NodeSelectorTerm-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NodeSelectorTerm$new(match_expressions = NULL, match_fields = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NodeSelectorTerm$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NodeSelectorTerm$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
