# V1Service

V1Service

V1Service

## Details

Service is a named abstraction of software service (for example, mysql)
consisting of local port (for example 3306) that the proxy listens on,
and the selector that determines which pods will answer requests sent
through the proxy.

## Methods

### Public methods

- [`V1Service$new()`](#method-V1Service-new)

- [`V1Service$to_list()`](#method-V1Service-to_list)

- [`V1Service$clone()`](#method-V1Service-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Service$new(
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

    V1Service$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Service$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
