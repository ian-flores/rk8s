# V1NamespaceCondition

V1NamespaceCondition

V1NamespaceCondition

## Details

NamespaceCondition contains details about state of namespace.

## Methods

### Public methods

- [`V1NamespaceCondition$new()`](#method-V1NamespaceCondition-new)

- [`V1NamespaceCondition$to_list()`](#method-V1NamespaceCondition-to_list)

- [`V1NamespaceCondition$clone()`](#method-V1NamespaceCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NamespaceCondition$new(
      last_transition_time = NULL,
      message = NULL,
      reason = NULL,
      status = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NamespaceCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NamespaceCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
