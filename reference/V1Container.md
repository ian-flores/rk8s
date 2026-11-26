# V1Container

V1Container

V1Container

## Details

A single application container that you want to run within a pod.

## Methods

### Public methods

- [`V1Container$new()`](#method-V1Container-new)

- [`V1Container$to_list()`](#method-V1Container-to_list)

- [`V1Container$clone()`](#method-V1Container-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Container$new(
      args = NULL,
      command = NULL,
      env = NULL,
      env_from = NULL,
      image = NULL,
      image_pull_policy = NULL,
      lifecycle = NULL,
      liveness_probe = NULL,
      name = NULL,
      ports = NULL,
      readiness_probe = NULL,
      resize_policy = NULL,
      resources = NULL,
      restart_policy = NULL,
      security_context = NULL,
      startup_probe = NULL,
      stdin = NULL,
      stdin_once = NULL,
      termination_message_path = NULL,
      termination_message_policy = NULL,
      tty = NULL,
      volume_devices = NULL,
      volume_mounts = NULL,
      working_dir = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Container$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Container$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
