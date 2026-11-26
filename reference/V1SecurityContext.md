# V1SecurityContext

V1SecurityContext

V1SecurityContext

## Details

SecurityContext holds security configuration that will be applied to a
container. Some fields are present in both SecurityContext and
PodSecurityContext. When both are set, the values in SecurityContext
take precedence.

## Methods

### Public methods

- [`V1SecurityContext$new()`](#method-V1SecurityContext-new)

- [`V1SecurityContext$to_list()`](#method-V1SecurityContext-to_list)

- [`V1SecurityContext$clone()`](#method-V1SecurityContext-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1SecurityContext$new(
      allow_privilege_escalation = NULL,
      app_armor_profile = NULL,
      capabilities = NULL,
      privileged = NULL,
      proc_mount = NULL,
      read_only_root_filesystem = NULL,
      run_as_group = NULL,
      run_as_non_root = NULL,
      run_as_user = NULL,
      se_linux_options = NULL,
      seccomp_profile = NULL,
      windows_options = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1SecurityContext$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1SecurityContext$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
