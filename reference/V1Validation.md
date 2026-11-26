# V1Validation

V1Validation

V1Validation

## Details

Validation specifies the CEL expression which is used to apply the
validation.

## Methods

### Public methods

- [`V1Validation$new()`](#method-V1Validation-new)

- [`V1Validation$to_list()`](#method-V1Validation-to_list)

- [`V1Validation$clone()`](#method-V1Validation-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Validation$new(
      expression = NULL,
      message = NULL,
      message_expression = NULL,
      reason = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Validation$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Validation$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
