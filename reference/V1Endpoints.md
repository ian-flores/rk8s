# V1Endpoints

V1Endpoints

V1Endpoints

## Details

Endpoints is a collection of endpoints that implement the actual
service. Example:

Name: "mysvc", Subsets: Addresses: \["ip": "10.10.1.1", "ip":
"10.10.2.2", Ports: "name": "a", "port": 8675, "name": "b", "port": 309
, Addresses: "ip": "10.10.3.3", Ports: "name": "a", "port": 93, "name":
"b", "port": 76 , \]

## Methods

### Public methods

- [`V1Endpoints$new()`](#method-V1Endpoints-new)

- [`V1Endpoints$to_list()`](#method-V1Endpoints-to_list)

- [`V1Endpoints$clone()`](#method-V1Endpoints-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Endpoints$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      subsets = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Endpoints$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Endpoints$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
