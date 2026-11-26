# V1NetworkPolicyIngressRule

V1NetworkPolicyIngressRule

V1NetworkPolicyIngressRule

## Details

NetworkPolicyIngressRule describes a particular set of traffic that is
allowed to the pods matched by a NetworkPolicySpec's podSelector. The
traffic must match both ports and from.

## Methods

### Public methods

- [`V1NetworkPolicyIngressRule$new()`](#method-V1NetworkPolicyIngressRule-new)

- [`V1NetworkPolicyIngressRule$to_list()`](#method-V1NetworkPolicyIngressRule-to_list)

- [`V1NetworkPolicyIngressRule$clone()`](#method-V1NetworkPolicyIngressRule-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NetworkPolicyIngressRule$new(from = NULL, ports = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NetworkPolicyIngressRule$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NetworkPolicyIngressRule$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
