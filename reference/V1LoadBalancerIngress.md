# V1LoadBalancerIngress

V1LoadBalancerIngress

V1LoadBalancerIngress

## Details

LoadBalancerIngress represents the status of a load-balancer ingress
point: traffic intended for the service should be sent to an ingress
point.

## Methods

### Public methods

- [`V1LoadBalancerIngress$new()`](#method-V1LoadBalancerIngress-new)

- [`V1LoadBalancerIngress$to_list()`](#method-V1LoadBalancerIngress-to_list)

- [`V1LoadBalancerIngress$clone()`](#method-V1LoadBalancerIngress-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1LoadBalancerIngress$new(
      hostname = NULL,
      ip = NULL,
      ip_mode = NULL,
      ports = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1LoadBalancerIngress$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1LoadBalancerIngress$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
