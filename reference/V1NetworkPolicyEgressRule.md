# V1NetworkPolicyEgressRule

V1NetworkPolicyEgressRule

V1NetworkPolicyEgressRule

## Details

NetworkPolicyEgressRule describes a particular set of traffic that is
allowed out of pods matched by a NetworkPolicySpec's podSelector. The
traffic must match both ports and to. This type is beta-level in 1.8

## Methods

### Public methods

- [`V1NetworkPolicyEgressRule$new()`](#method-V1NetworkPolicyEgressRule-new)

- [`V1NetworkPolicyEgressRule$to_list()`](#method-V1NetworkPolicyEgressRule-to_list)

- [`V1NetworkPolicyEgressRule$clone()`](#method-V1NetworkPolicyEgressRule-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NetworkPolicyEgressRule$new(ports = NULL, to = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NetworkPolicyEgressRule$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NetworkPolicyEgressRule$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
