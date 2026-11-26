# V1Eviction

V1Eviction

V1Eviction

## Details

Eviction evicts a pod from its node subject to certain policies and
safety constraints. This is a subresource of Pod. A request to cause
such an eviction is created by POSTing to .../pods/\<pod
name\>/evictions.

## Methods

### Public methods

- [`V1Eviction$new()`](#method-V1Eviction-new)

- [`V1Eviction$to_list()`](#method-V1Eviction-to_list)

- [`V1Eviction$clone()`](#method-V1Eviction-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Eviction$new(
      api_version = NULL,
      delete_options = NULL,
      kind = NULL,
      metadata = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Eviction$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Eviction$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
