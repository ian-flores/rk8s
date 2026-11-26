# V1beta1ServiceCIDR

V1beta1ServiceCIDR

V1beta1ServiceCIDR

## Details

ServiceCIDR defines a range of IP addresses using CIDR format (e.g.
192.168.0.0/24 or 2001:db2::/64). This range is used to allocate
ClusterIPs to Service objects.

## Methods

### Public methods

- [`V1beta1ServiceCIDR$new()`](#method-V1beta1ServiceCIDR-new)

- [`V1beta1ServiceCIDR$to_list()`](#method-V1beta1ServiceCIDR-to_list)

- [`V1beta1ServiceCIDR$clone()`](#method-V1beta1ServiceCIDR-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1beta1ServiceCIDR$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL,
      status = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1beta1ServiceCIDR$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1beta1ServiceCIDR$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
