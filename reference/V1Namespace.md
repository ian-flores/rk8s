# V1Namespace

V1Namespace

V1Namespace

## Details

Namespace provides a scope for Names. Use of multiple namespaces is
optional.

## Methods

### Public methods

- [`V1Namespace$new()`](#method-V1Namespace-new)

- [`V1Namespace$to_list()`](#method-V1Namespace-to_list)

- [`V1Namespace$clone()`](#method-V1Namespace-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Namespace$new(
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

    V1Namespace$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Namespace$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
