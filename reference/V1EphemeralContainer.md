# V1EphemeralContainer

V1EphemeralContainer

V1EphemeralContainer

## Details

An EphemeralContainer is a temporary container that you may add to an
existing Pod for user-initiated activities such as debugging. Ephemeral
containers have no resource or scheduling guarantees, and they will not
be restarted when they exit or when a Pod is removed or restarted. The
kubelet may evict a Pod if an ephemeral container causes the Pod to
exceed its resource allocation.

To add an ephemeral container, use the ephemeralcontainers subresource
of an existing Pod. Ephemeral containers may not be removed or
restarted.

## Methods

### Public methods

- [`V1EphemeralContainer$new()`](#method-V1EphemeralContainer-new)

- [`V1EphemeralContainer$to_list()`](#method-V1EphemeralContainer-to_list)

- [`V1EphemeralContainer$clone()`](#method-V1EphemeralContainer-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1EphemeralContainer$new(
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
      target_container_name = NULL,
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

    V1EphemeralContainer$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1EphemeralContainer$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
