# V1ResourceAttributes

V1ResourceAttributes

V1ResourceAttributes

## Details

ResourceAttributes includes the authorization attributes available for
resource requests to the Authorizer interface

## Methods

### Public methods

- [`V1ResourceAttributes$new()`](#method-V1ResourceAttributes-new)

- [`V1ResourceAttributes$to_list()`](#method-V1ResourceAttributes-to_list)

- [`V1ResourceAttributes$clone()`](#method-V1ResourceAttributes-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ResourceAttributes$new(
      field_selector = NULL,
      group = NULL,
      label_selector = NULL,
      name = NULL,
      namespace = NULL,
      resource = NULL,
      subresource = NULL,
      verb = NULL,
      version = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ResourceAttributes$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ResourceAttributes$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
