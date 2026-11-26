# V1VolumeMount

V1VolumeMount

V1VolumeMount

## Details

VolumeMount describes a mounting of a Volume within a container.

## Methods

### Public methods

- [`V1VolumeMount$new()`](#method-V1VolumeMount-new)

- [`V1VolumeMount$to_list()`](#method-V1VolumeMount-to_list)

- [`V1VolumeMount$clone()`](#method-V1VolumeMount-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1VolumeMount$new(
      mount_path = NULL,
      mount_propagation = NULL,
      name = NULL,
      read_only = NULL,
      recursive_read_only = NULL,
      sub_path = NULL,
      sub_path_expr = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1VolumeMount$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1VolumeMount$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
