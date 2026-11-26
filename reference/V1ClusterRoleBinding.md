# V1ClusterRoleBinding

V1ClusterRoleBinding

V1ClusterRoleBinding

## Details

ClusterRoleBinding references a ClusterRole, but not contain it. It can
reference a ClusterRole in the global namespace, and adds who
information via Subject.

## Methods

### Public methods

- [`V1ClusterRoleBinding$new()`](#method-V1ClusterRoleBinding-new)

- [`V1ClusterRoleBinding$to_list()`](#method-V1ClusterRoleBinding-to_list)

- [`V1ClusterRoleBinding$clone()`](#method-V1ClusterRoleBinding-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ClusterRoleBinding$new(
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

    V1ClusterRoleBinding$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ClusterRoleBinding$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
