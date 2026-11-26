# V1NodeConfigSource

V1NodeConfigSource

V1NodeConfigSource

## Details

NodeConfigSource specifies a source of node configuration. Exactly one
subfield (excluding metadata) must be non-nil. This API is deprecated
since 1.22

## Methods

### Public methods

- [`V1NodeConfigSource$new()`](#method-V1NodeConfigSource-new)

- [`V1NodeConfigSource$to_list()`](#method-V1NodeConfigSource-to_list)

- [`V1NodeConfigSource$clone()`](#method-V1NodeConfigSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NodeConfigSource$new(config_map = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NodeConfigSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NodeConfigSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
