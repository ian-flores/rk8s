# V1EndpointAddress

V1EndpointAddress

V1EndpointAddress

## Details

EndpointAddress is a tuple that describes single IP address.

## Methods

### Public methods

- [`V1EndpointAddress$new()`](#method-V1EndpointAddress-new)

- [`V1EndpointAddress$to_list()`](#method-V1EndpointAddress-to_list)

- [`V1EndpointAddress$clone()`](#method-V1EndpointAddress-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1EndpointAddress$new(
      hostname = NULL,
      ip = NULL,
      node_name = NULL,
      target_ref = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1EndpointAddress$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1EndpointAddress$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
