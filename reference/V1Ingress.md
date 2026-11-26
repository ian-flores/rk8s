# V1Ingress

V1Ingress

V1Ingress

## Details

Ingress is a collection of rules that allow inbound connections to reach
the endpoints defined by a backend. An Ingress can be configured to give
services externally-reachable urls, load balance traffic, terminate SSL,
offer name based virtual hosting etc.

## Methods

### Public methods

- [`V1Ingress$new()`](#method-V1Ingress-new)

- [`V1Ingress$to_list()`](#method-V1Ingress-to_list)

- [`V1Ingress$clone()`](#method-V1Ingress-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Ingress$new(
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

    V1Ingress$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Ingress$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
