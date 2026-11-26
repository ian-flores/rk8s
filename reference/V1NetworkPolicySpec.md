# V1NetworkPolicySpec

V1NetworkPolicySpec

V1NetworkPolicySpec

## Details

NetworkPolicySpec provides the specification of a NetworkPolicy

## Methods

### Public methods

- [`V1NetworkPolicySpec$new()`](#method-V1NetworkPolicySpec-new)

- [`V1NetworkPolicySpec$to_list()`](#method-V1NetworkPolicySpec-to_list)

- [`V1NetworkPolicySpec$clone()`](#method-V1NetworkPolicySpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NetworkPolicySpec$new(
      egress = NULL,
      ingress = NULL,
      pod_selector = NULL,
      policy_types = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NetworkPolicySpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NetworkPolicySpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
