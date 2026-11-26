# V1RoleBinding

V1RoleBinding

V1RoleBinding

## Details

RoleBinding references a role, but does not contain it. It can reference
a Role in the same namespace or a ClusterRole in the global namespace.
It adds who information via Subjects and namespace information by which
namespace it exists in. RoleBindings in a given namespace only have
effect in that namespace.

## Methods

### Public methods

- [`V1RoleBinding$new()`](#method-V1RoleBinding-new)

- [`V1RoleBinding$to_list()`](#method-V1RoleBinding-to_list)

- [`V1RoleBinding$clone()`](#method-V1RoleBinding-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1RoleBinding$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      role_ref = NULL,
      subjects = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1RoleBinding$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1RoleBinding$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
