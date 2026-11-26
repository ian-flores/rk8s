# CoreV1EndpointPort

CoreV1EndpointPort

CoreV1EndpointPort

## Details

EndpointPort is a tuple that describes a single port.

## Methods

### Public methods

- [`CoreV1EndpointPort$new()`](#method-CoreV1EndpointPort-new)

- [`CoreV1EndpointPort$to_list()`](#method-CoreV1EndpointPort-to_list)

- [`CoreV1EndpointPort$clone()`](#method-CoreV1EndpointPort-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    CoreV1EndpointPort$new(
      app_protocol = NULL,
      name = NULL,
      port = NULL,
      protocol = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    CoreV1EndpointPort$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    CoreV1EndpointPort$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
