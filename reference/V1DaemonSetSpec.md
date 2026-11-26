# V1DaemonSetSpec

V1DaemonSetSpec

V1DaemonSetSpec

## Details

DaemonSetSpec is the specification of a daemon set.

## Methods

### Public methods

- [`V1DaemonSetSpec$new()`](#method-V1DaemonSetSpec-new)

- [`V1DaemonSetSpec$to_list()`](#method-V1DaemonSetSpec-to_list)

- [`V1DaemonSetSpec$clone()`](#method-V1DaemonSetSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1DaemonSetSpec$new(
      min_ready_seconds = NULL,
      revision_history_limit = NULL,
      selector = NULL,
      template = NULL,
      update_strategy = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1DaemonSetSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1DaemonSetSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
