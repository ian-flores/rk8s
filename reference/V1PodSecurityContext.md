# V1PodSecurityContext

V1PodSecurityContext

V1PodSecurityContext

## Details

PodSecurityContext holds pod-level security attributes and common
container settings. Some fields are also present in
container.securityContext. Field values of container.securityContext
take precedence over field values of PodSecurityContext.

## Methods

### Public methods

- [`V1PodSecurityContext$new()`](#method-V1PodSecurityContext-new)

- [`V1PodSecurityContext$to_list()`](#method-V1PodSecurityContext-to_list)

- [`V1PodSecurityContext$clone()`](#method-V1PodSecurityContext-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodSecurityContext$new(
      app_armor_profile = NULL,
      fs_group = NULL,
      fs_group_change_policy = NULL,
      run_as_group = NULL,
      run_as_non_root = NULL,
      run_as_user = NULL,
      se_linux_options = NULL,
      seccomp_profile = NULL,
      supplemental_groups = NULL,
      supplemental_groups_policy = NULL,
      sysctls = NULL,
      windows_options = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PodSecurityContext$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodSecurityContext$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
