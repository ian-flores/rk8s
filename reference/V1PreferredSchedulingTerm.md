# V1PreferredSchedulingTerm

V1PreferredSchedulingTerm

V1PreferredSchedulingTerm

## Details

An empty preferred scheduling term matches all objects with implicit
weight 0 (i.e. it's a no-op). A null preferred scheduling term matches
no objects (i.e. is also a no-op).

## Methods

### Public methods

- [`V1PreferredSchedulingTerm$new()`](#method-V1PreferredSchedulingTerm-new)

- [`V1PreferredSchedulingTerm$to_list()`](#method-V1PreferredSchedulingTerm-to_list)

- [`V1PreferredSchedulingTerm$clone()`](#method-V1PreferredSchedulingTerm-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PreferredSchedulingTerm$new(preference = NULL, weight = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PreferredSchedulingTerm$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PreferredSchedulingTerm$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
