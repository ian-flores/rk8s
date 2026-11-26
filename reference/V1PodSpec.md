# V1PodSpec

V1PodSpec

V1PodSpec

## Details

PodSpec is a description of a pod.

## Methods

### Public methods

- [`V1PodSpec$new()`](#method-V1PodSpec-new)

- [`V1PodSpec$to_list()`](#method-V1PodSpec-to_list)

- [`V1PodSpec$clone()`](#method-V1PodSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodSpec$new(
      active_deadline_seconds = NULL,
      affinity = NULL,
      automount_service_account_token = NULL,
      containers = NULL,
      dns_config = NULL,
      dns_policy = NULL,
      enable_service_links = NULL,
      ephemeral_containers = NULL,
      host_aliases = NULL,
      host_ipc = NULL,
      host_network = NULL,
      host_pid = NULL,
      host_users = NULL,
      hostname = NULL,
      image_pull_secrets = NULL,
      init_containers = NULL,
      node_name = NULL,
      node_selector = NULL,
      os = NULL,
      overhead = NULL,
      preemption_policy = NULL,
      priority = NULL,
      priority_class_name = NULL,
      readiness_gates = NULL,
      resource_claims = NULL,
      restart_policy = NULL,
      runtime_class_name = NULL,
      scheduler_name = NULL,
      scheduling_gates = NULL,
      security_context = NULL,
      service_account = NULL,
      service_account_name = NULL,
      set_hostname_as_fqdn = NULL,
      share_process_namespace = NULL,
      subdomain = NULL,
      termination_grace_period_seconds = NULL,
      tolerations = NULL,
      topology_spread_constraints = NULL,
      volumes = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PodSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
