# V1ValidationRule

V1ValidationRule

V1ValidationRule

## Details

ValidationRule describes a validation rule written in the CEL expression
language.

## Methods

### Public methods

- [`V1ValidationRule$new()`](#method-V1ValidationRule-new)

- [`V1ValidationRule$to_list()`](#method-V1ValidationRule-to_list)

- [`V1ValidationRule$clone()`](#method-V1ValidationRule-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ValidationRule$new(
      field_path = NULL,
      message = NULL,
      message_expression = NULL,
      optional_old_self = NULL,
      reason = NULL,
      rule = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ValidationRule$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ValidationRule$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
