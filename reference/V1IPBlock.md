# V1IPBlock

V1IPBlock

V1IPBlock

## Details

IPBlock describes a particular CIDR (Ex.
"192.168.1.0/24","2001:db8::/64") that is allowed to the pods matched by
a NetworkPolicySpec's podSelector. The except entry describes CIDRs that
should not be included within this rule.

## Methods

### Public methods

- [`V1IPBlock$new()`](#method-V1IPBlock-new)

- [`V1IPBlock$to_list()`](#method-V1IPBlock-to_list)

- [`V1IPBlock$clone()`](#method-V1IPBlock-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1IPBlock$new(cidr = NULL, except = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1IPBlock$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1IPBlock$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
