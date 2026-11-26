# V1NetworkPolicyPeer

V1NetworkPolicyPeer

V1NetworkPolicyPeer

## Details

NetworkPolicyPeer describes a peer to allow traffic to/from. Only
certain combinations of fields are allowed

## Methods

### Public methods

- [`V1NetworkPolicyPeer$new()`](#method-V1NetworkPolicyPeer-new)

- [`V1NetworkPolicyPeer$to_list()`](#method-V1NetworkPolicyPeer-to_list)

- [`V1NetworkPolicyPeer$clone()`](#method-V1NetworkPolicyPeer-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NetworkPolicyPeer$new(
      ip_block = NULL,
      namespace_selector = NULL,
      pod_selector = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NetworkPolicyPeer$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NetworkPolicyPeer$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
