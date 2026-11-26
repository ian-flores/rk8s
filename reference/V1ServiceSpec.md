# V1ServiceSpec

V1ServiceSpec

V1ServiceSpec

## Details

ServiceSpec describes the attributes that a user creates on a service.

## Methods

### Public methods

- [`V1ServiceSpec$new()`](#method-V1ServiceSpec-new)

- [`V1ServiceSpec$to_list()`](#method-V1ServiceSpec-to_list)

- [`V1ServiceSpec$clone()`](#method-V1ServiceSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ServiceSpec$new(
      allocate_load_balancer_node_ports = NULL,
      cluster_ip = NULL,
      cluster_i_ps = NULL,
      external_i_ps = NULL,
      external_name = NULL,
      external_traffic_policy = NULL,
      health_check_node_port = NULL,
      internal_traffic_policy = NULL,
      ip_families = NULL,
      ip_family_policy = NULL,
      load_balancer_class = NULL,
      load_balancer_ip = NULL,
      load_balancer_source_ranges = NULL,
      ports = NULL,
      publish_not_ready_addresses = NULL,
      selector = NULL,
      session_affinity = NULL,
      session_affinity_config = NULL,
      traffic_distribution = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ServiceSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ServiceSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
