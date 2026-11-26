# V1Lifecycle

V1Lifecycle

V1Lifecycle

## Details

Lifecycle describes actions that the management system should take in
response to container lifecycle events. For the PostStart and PreStop
lifecycle handlers, management of the container blocks until the action
is complete, unless the container process fails, in which case the
handler is aborted.

## Methods

### Public methods

- [`V1Lifecycle$new()`](#method-V1Lifecycle-new)

- [`V1Lifecycle$to_list()`](#method-V1Lifecycle-to_list)

- [`V1Lifecycle$clone()`](#method-V1Lifecycle-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Lifecycle$new(post_start = NULL, pre_stop = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Lifecycle$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Lifecycle$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
