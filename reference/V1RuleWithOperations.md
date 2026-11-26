# V1RuleWithOperations

V1RuleWithOperations

V1RuleWithOperations

## Details

RuleWithOperations is a tuple of Operations and Resources. It is
recommended to make sure that all the tuple expansions are valid.

## Methods

### Public methods

- [`V1RuleWithOperations$new()`](#method-V1RuleWithOperations-new)

- [`V1RuleWithOperations$to_list()`](#method-V1RuleWithOperations-to_list)

- [`V1RuleWithOperations$clone()`](#method-V1RuleWithOperations-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1RuleWithOperations$new(
      api_groups = NULL,
      api_versions = NULL,
      operations = NULL,
      resources = NULL,
      scope = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1RuleWithOperations$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1RuleWithOperations$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
