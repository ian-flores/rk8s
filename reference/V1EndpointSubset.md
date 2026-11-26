# V1EndpointSubset

V1EndpointSubset

V1EndpointSubset

## Details

EndpointSubset is a group of addresses with a common set of ports. The
expanded set of endpoints is the Cartesian product of Addresses x Ports.
For example, given:

Addresses: "ip": "10.10.1.1", "ip": "10.10.2.2", Ports: "name": "a",
"port": 8675, "name": "b", "port": 309

The resulting set of endpoints can be viewed as:

a: 10.10.1.1:8675, 10.10.2.2:8675 , b: 10.10.1.1:309, 10.10.2.2:309

## Methods

### Public methods

- [`V1EndpointSubset$new()`](#method-V1EndpointSubset-new)

- [`V1EndpointSubset$to_list()`](#method-V1EndpointSubset-to_list)

- [`V1EndpointSubset$clone()`](#method-V1EndpointSubset-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1EndpointSubset$new(
      addresses = NULL,
      not_ready_addresses = NULL,
      ports = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1EndpointSubset$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1EndpointSubset$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
