# RbacV1Subject

RbacV1Subject

RbacV1Subject

## Details

Subject contains a reference to the object or user identities a role
binding applies to. This can either hold a direct API object reference,
or a value for non-objects such as user and group names.

## Methods

### Public methods

- [`RbacV1Subject$new()`](#method-RbacV1Subject-new)

- [`RbacV1Subject$to_list()`](#method-RbacV1Subject-to_list)

- [`RbacV1Subject$clone()`](#method-RbacV1Subject-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    RbacV1Subject$new(api_group = NULL, kind = NULL, name = NULL, namespace = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    RbacV1Subject$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    RbacV1Subject$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
