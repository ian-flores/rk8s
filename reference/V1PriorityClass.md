# V1PriorityClass

V1PriorityClass

V1PriorityClass

## Details

PriorityClass defines mapping from a priority class name to the priority
integer value. The value can be any valid integer.

## Methods

### Public methods

- [`V1PriorityClass$new()`](#method-V1PriorityClass-new)

- [`V1PriorityClass$to_list()`](#method-V1PriorityClass-to_list)

- [`V1PriorityClass$clone()`](#method-V1PriorityClass-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PriorityClass$new(
      api_version = NULL,
      description = NULL,
      global_default = NULL,
      kind = NULL,
      metadata = NULL,
      preemption_policy = NULL,
      value = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PriorityClass$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PriorityClass$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
