# V1Endpoint

V1Endpoint

V1Endpoint

## Details

Endpoint represents a single logical "backend" implementing a service.

## Methods

### Public methods

- [`V1Endpoint$new()`](#method-V1Endpoint-new)

- [`V1Endpoint$to_list()`](#method-V1Endpoint-to_list)

- [`V1Endpoint$clone()`](#method-V1Endpoint-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Endpoint$new(
      addresses = NULL,
      conditions = NULL,
      deprecated_topology = NULL,
      hints = NULL,
      hostname = NULL,
      node_name = NULL,
      target_ref = NULL,
      zone = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Endpoint$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Endpoint$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
