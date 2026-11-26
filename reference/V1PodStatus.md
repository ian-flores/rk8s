# V1PodStatus

V1PodStatus

V1PodStatus

## Details

PodStatus represents information about the status of a pod. Status may
trail the actual state of a system, especially if the node that hosts
the pod cannot contact the control plane.

## Methods

### Public methods

- [`V1PodStatus$new()`](#method-V1PodStatus-new)

- [`V1PodStatus$to_list()`](#method-V1PodStatus-to_list)

- [`V1PodStatus$clone()`](#method-V1PodStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodStatus$new(
      conditions = NULL,
      container_statuses = NULL,
      ephemeral_container_statuses = NULL,
      host_ip = NULL,
      host_i_ps = NULL,
      init_container_statuses = NULL,
      message = NULL,
      nominated_node_name = NULL,
      phase = NULL,
      pod_ip = NULL,
      pod_i_ps = NULL,
      qos_class = NULL,
      reason = NULL,
      resize = NULL,
      resource_claim_statuses = NULL,
      start_time = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PodStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
