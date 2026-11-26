# V1DaemonSet

V1DaemonSet

V1DaemonSet

## Details

DaemonSet represents the configuration of a daemon set.

## Methods

### Public methods

- [`V1DaemonSet$new()`](#method-V1DaemonSet-new)

- [`V1DaemonSet$to_list()`](#method-V1DaemonSet-to_list)

- [`V1DaemonSet$clone()`](#method-V1DaemonSet-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1DaemonSet$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL,
      status = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1DaemonSet$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1DaemonSet$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
