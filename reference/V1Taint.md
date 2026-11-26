# V1Taint

V1Taint

V1Taint

## Details

The node this Taint is attached to has the "effect" on any pod that does
not tolerate the Taint.

## Methods

### Public methods

- [`V1Taint$new()`](#method-V1Taint-new)

- [`V1Taint$to_list()`](#method-V1Taint-to_list)

- [`V1Taint$clone()`](#method-V1Taint-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Taint$new(effect = NULL, key = NULL, time_added = NULL, value = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Taint$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Taint$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
