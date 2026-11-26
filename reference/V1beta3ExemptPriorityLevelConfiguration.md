# V1beta3ExemptPriorityLevelConfiguration

V1beta3ExemptPriorityLevelConfiguration

V1beta3ExemptPriorityLevelConfiguration

## Details

ExemptPriorityLevelConfiguration describes the configurable aspects of
the handling of exempt requests. In the mandatory exempt configuration
object the values in the fields here can be modified by authorized
users, unlike the rest of the \`spec\`.

## Methods

### Public methods

- [`V1beta3ExemptPriorityLevelConfiguration$new()`](#method-V1beta3ExemptPriorityLevelConfiguration-new)

- [`V1beta3ExemptPriorityLevelConfiguration$to_list()`](#method-V1beta3ExemptPriorityLevelConfiguration-to_list)

- [`V1beta3ExemptPriorityLevelConfiguration$clone()`](#method-V1beta3ExemptPriorityLevelConfiguration-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1beta3ExemptPriorityLevelConfiguration$new(
      lendable_percent = NULL,
      nominal_concurrency_shares = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1beta3ExemptPriorityLevelConfiguration$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1beta3ExemptPriorityLevelConfiguration$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
