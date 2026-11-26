# V1LabelSelector

V1LabelSelector

V1LabelSelector

## Details

A label selector is a label query over a set of resources. The result of
matchLabels and matchExpressions are ANDed. An empty label selector
matches all objects. A null label selector matches no objects.

## Methods

### Public methods

- [`V1LabelSelector$new()`](#method-V1LabelSelector-new)

- [`V1LabelSelector$to_list()`](#method-V1LabelSelector-to_list)

- [`V1LabelSelector$clone()`](#method-V1LabelSelector-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1LabelSelector$new(match_expressions = NULL, match_labels = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1LabelSelector$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1LabelSelector$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
