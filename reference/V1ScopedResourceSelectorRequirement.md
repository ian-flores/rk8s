# V1ScopedResourceSelectorRequirement

V1ScopedResourceSelectorRequirement

V1ScopedResourceSelectorRequirement

## Details

A scoped-resource selector requirement is a selector that contains
values, a scope name, and an operator that relates the scope name and
values.

## Methods

### Public methods

- [`V1ScopedResourceSelectorRequirement$new()`](#method-V1ScopedResourceSelectorRequirement-new)

- [`V1ScopedResourceSelectorRequirement$to_list()`](#method-V1ScopedResourceSelectorRequirement-to_list)

- [`V1ScopedResourceSelectorRequirement$clone()`](#method-V1ScopedResourceSelectorRequirement-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ScopedResourceSelectorRequirement$new(
      operator = NULL,
      scope_name = NULL,
      values = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ScopedResourceSelectorRequirement$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ScopedResourceSelectorRequirement$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
