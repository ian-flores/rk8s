# V1beta3LimitedPriorityLevelConfiguration

V1beta3LimitedPriorityLevelConfiguration

V1beta3LimitedPriorityLevelConfiguration

## Details

LimitedPriorityLevelConfiguration specifies how to handle requests that
are subject to limits. It addresses two issues: - How are requests for
this priority level limited? - What should be done with requests that
exceed the limit?

## Methods

### Public methods

- [`V1beta3LimitedPriorityLevelConfiguration$new()`](#method-V1beta3LimitedPriorityLevelConfiguration-new)

- [`V1beta3LimitedPriorityLevelConfiguration$to_list()`](#method-V1beta3LimitedPriorityLevelConfiguration-to_list)

- [`V1beta3LimitedPriorityLevelConfiguration$clone()`](#method-V1beta3LimitedPriorityLevelConfiguration-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1beta3LimitedPriorityLevelConfiguration$new(
      borrowing_limit_percent = NULL,
      lendable_percent = NULL,
      limit_response = NULL,
      nominal_concurrency_shares = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1beta3LimitedPriorityLevelConfiguration$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1beta3LimitedPriorityLevelConfiguration$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
