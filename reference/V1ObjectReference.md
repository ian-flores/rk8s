# V1ObjectReference

V1ObjectReference

V1ObjectReference

## Details

ObjectReference contains enough information to let you inspect or modify
the referred object.

## Methods

### Public methods

- [`V1ObjectReference$new()`](#method-V1ObjectReference-new)

- [`V1ObjectReference$to_list()`](#method-V1ObjectReference-to_list)

- [`V1ObjectReference$clone()`](#method-V1ObjectReference-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ObjectReference$new(
      api_version = NULL,
      field_path = NULL,
      kind = NULL,
      name = NULL,
      namespace = NULL,
      resource_version = NULL,
      uid = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ObjectReference$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ObjectReference$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
