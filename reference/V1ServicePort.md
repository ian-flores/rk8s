# V1ServicePort

V1ServicePort

V1ServicePort

## Details

ServicePort contains information on service's port.

## Methods

### Public methods

- [`V1ServicePort$new()`](#method-V1ServicePort-new)

- [`V1ServicePort$to_list()`](#method-V1ServicePort-to_list)

- [`V1ServicePort$clone()`](#method-V1ServicePort-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ServicePort$new(
      app_protocol = NULL,
      name = NULL,
      node_port = NULL,
      port = NULL,
      protocol = NULL,
      target_port = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ServicePort$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ServicePort$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
