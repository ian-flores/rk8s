# V1CSIDriverSpec

V1CSIDriverSpec

V1CSIDriverSpec

## Details

CSIDriverSpec is the specification of a CSIDriver.

## Methods

### Public methods

- [`V1CSIDriverSpec$new()`](#method-V1CSIDriverSpec-new)

- [`V1CSIDriverSpec$to_list()`](#method-V1CSIDriverSpec-to_list)

- [`V1CSIDriverSpec$clone()`](#method-V1CSIDriverSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CSIDriverSpec$new(
      attach_required = NULL,
      fs_group_policy = NULL,
      pod_info_on_mount = NULL,
      requires_republish = NULL,
      se_linux_mount = NULL,
      storage_capacity = NULL,
      token_requests = NULL,
      volume_lifecycle_modes = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CSIDriverSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CSIDriverSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
