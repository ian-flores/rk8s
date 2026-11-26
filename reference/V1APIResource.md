# V1APIResource

V1APIResource

V1APIResource

## Details

APIResource specifies the name of a resource and whether it is
namespaced.

## Methods

### Public methods

- [`V1APIResource$new()`](#method-V1APIResource-new)

- [`V1APIResource$to_list()`](#method-V1APIResource-to_list)

- [`V1APIResource$clone()`](#method-V1APIResource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1APIResource$new(
      categories = NULL,
      group = NULL,
      kind = NULL,
      name = NULL,
      namespaced = NULL,
      short_names = NULL,
      singular_name = NULL,
      storage_version_hash = NULL,
      verbs = NULL,
      version = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1APIResource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1APIResource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
