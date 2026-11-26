# V1APIService

V1APIService

V1APIService

## Details

APIService represents a server for a particular GroupVersion. Name must
be "version.group".

## Methods

### Public methods

- [`V1APIService$new()`](#method-V1APIService-new)

- [`V1APIService$to_list()`](#method-V1APIService-to_list)

- [`V1APIService$clone()`](#method-V1APIService-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1APIService$new(
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

    V1APIService$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1APIService$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
