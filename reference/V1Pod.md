# V1Pod

V1Pod

V1Pod

## Details

Pod is a collection of containers that can run on a host. This resource
is created by clients and scheduled onto hosts.

## Methods

### Public methods

- [`V1Pod$new()`](#method-V1Pod-new)

- [`V1Pod$to_list()`](#method-V1Pod-to_list)

- [`V1Pod$clone()`](#method-V1Pod-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Pod$new(
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

    V1Pod$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Pod$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
