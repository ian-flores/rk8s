# V1QuobyteVolumeSource

V1QuobyteVolumeSource

V1QuobyteVolumeSource

## Details

Represents a Quobyte mount that lasts the lifetime of a pod. Quobyte
volumes do not support ownership management or SELinux relabeling.

## Methods

### Public methods

- [`V1QuobyteVolumeSource$new()`](#method-V1QuobyteVolumeSource-new)

- [`V1QuobyteVolumeSource$to_list()`](#method-V1QuobyteVolumeSource-to_list)

- [`V1QuobyteVolumeSource$clone()`](#method-V1QuobyteVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1QuobyteVolumeSource$new(
      group = NULL,
      read_only = NULL,
      registry = NULL,
      tenant = NULL,
      user = NULL,
      volume = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1QuobyteVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1QuobyteVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
