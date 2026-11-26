# V1NodeSelector

V1NodeSelector

V1NodeSelector

## Details

A node selector represents the union of the results of one or more label
queries over a set of nodes; that is, it represents the OR of the
selectors represented by the node selector terms.

## Methods

### Public methods

- [`V1NodeSelector$new()`](#method-V1NodeSelector-new)

- [`V1NodeSelector$to_list()`](#method-V1NodeSelector-to_list)

- [`V1NodeSelector$clone()`](#method-V1NodeSelector-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NodeSelector$new(node_selector_terms = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NodeSelector$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NodeSelector$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
