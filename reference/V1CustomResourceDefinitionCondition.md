# V1CustomResourceDefinitionCondition

V1CustomResourceDefinitionCondition

V1CustomResourceDefinitionCondition

## Details

CustomResourceDefinitionCondition contains details for the current
condition of this pod.

## Methods

### Public methods

- [`V1CustomResourceDefinitionCondition$new()`](#method-V1CustomResourceDefinitionCondition-new)

- [`V1CustomResourceDefinitionCondition$to_list()`](#method-V1CustomResourceDefinitionCondition-to_list)

- [`V1CustomResourceDefinitionCondition$clone()`](#method-V1CustomResourceDefinitionCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CustomResourceDefinitionCondition$new(
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

    V1CustomResourceDefinitionCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CustomResourceDefinitionCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
