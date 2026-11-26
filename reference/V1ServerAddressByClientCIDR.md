# V1ServerAddressByClientCIDR

V1ServerAddressByClientCIDR

V1ServerAddressByClientCIDR

## Details

ServerAddressByClientCIDR helps the client to determine the server
address that they should use, depending on the clientCIDR that they
match.

## Methods

### Public methods

- [`V1ServerAddressByClientCIDR$new()`](#method-V1ServerAddressByClientCIDR-new)

- [`V1ServerAddressByClientCIDR$to_list()`](#method-V1ServerAddressByClientCIDR-to_list)

- [`V1ServerAddressByClientCIDR$clone()`](#method-V1ServerAddressByClientCIDR-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ServerAddressByClientCIDR$new(client_cidr = NULL, server_address = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ServerAddressByClientCIDR$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ServerAddressByClientCIDR$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
