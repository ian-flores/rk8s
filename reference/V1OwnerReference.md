# V1OwnerReference

V1OwnerReference

V1OwnerReference

## Details

OwnerReference contains enough information to let you identify an owning
object. An owning object must be in the same namespace as the dependent,
or be cluster-scoped, so there is no namespace field.

## Methods

### Public methods

- [`V1OwnerReference$new()`](#method-V1OwnerReference-new)

- [`V1OwnerReference$to_list()`](#method-V1OwnerReference-to_list)

- [`V1OwnerReference$clone()`](#method-V1OwnerReference-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1OwnerReference$new(
      api_version = NULL,
      block_owner_deletion = NULL,
      controller = NULL,
      kind = NULL,
      name = NULL,
      uid = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1OwnerReference$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1OwnerReference$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
