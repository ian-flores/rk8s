# V1EndpointSlice

V1EndpointSlice

V1EndpointSlice

## Details

EndpointSlice represents a subset of the endpoints that implement a
service. For a given service there may be multiple EndpointSlice
objects, selected by labels, which must be joined to produce the full
set of endpoints.

## Methods

### Public methods

- [`V1EndpointSlice$new()`](#method-V1EndpointSlice-new)

- [`V1EndpointSlice$to_list()`](#method-V1EndpointSlice-to_list)

- [`V1EndpointSlice$clone()`](#method-V1EndpointSlice-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1EndpointSlice$new(
      address_type = NULL,
      api_version = NULL,
      endpoints = NULL,
      kind = NULL,
      metadata = NULL,
      ports = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1EndpointSlice$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1EndpointSlice$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
