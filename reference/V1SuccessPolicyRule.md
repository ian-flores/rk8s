# V1SuccessPolicyRule

V1SuccessPolicyRule

V1SuccessPolicyRule

## Details

SuccessPolicyRule describes rule for declaring a Job as succeeded. Each
rule must have at least one of the "succeededIndexes" or
"succeededCount" specified.

## Methods

### Public methods

- [`V1SuccessPolicyRule$new()`](#method-V1SuccessPolicyRule-new)

- [`V1SuccessPolicyRule$to_list()`](#method-V1SuccessPolicyRule-to_list)

- [`V1SuccessPolicyRule$clone()`](#method-V1SuccessPolicyRule-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1SuccessPolicyRule$new(succeeded_count = NULL, succeeded_indexes = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1SuccessPolicyRule$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1SuccessPolicyRule$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
