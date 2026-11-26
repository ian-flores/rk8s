# V1Probe

V1Probe

V1Probe

## Details

Probe describes a health check to be performed against a container to
determine whether it is alive or ready to receive traffic.

## Methods

### Public methods

- [`V1Probe$new()`](#method-V1Probe-new)

- [`V1Probe$to_list()`](#method-V1Probe-to_list)

- [`V1Probe$clone()`](#method-V1Probe-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Probe$new(
      exec = NULL,
      failure_threshold = NULL,
      grpc = NULL,
      http_get = NULL,
      initial_delay_seconds = NULL,
      period_seconds = NULL,
      success_threshold = NULL,
      tcp_socket = NULL,
      termination_grace_period_seconds = NULL,
      timeout_seconds = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Probe$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Probe$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
