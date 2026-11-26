# V1TopologySelectorTerm

V1TopologySelectorTerm

V1TopologySelectorTerm

## Details

A topology selector term represents the result of label queries. A null
or empty topology selector term matches no objects. The requirements of
them are ANDed. It provides a subset of functionality as
NodeSelectorTerm. This is an alpha feature and may change in the future.

## Methods

### Public methods

- [`V1TopologySelectorTerm$new()`](#method-V1TopologySelectorTerm-new)

- [`V1TopologySelectorTerm$to_list()`](#method-V1TopologySelectorTerm-to_list)

- [`V1TopologySelectorTerm$clone()`](#method-V1TopologySelectorTerm-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1TopologySelectorTerm$new(match_label_expressions = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1TopologySelectorTerm$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1TopologySelectorTerm$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
