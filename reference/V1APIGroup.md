# V1APIGroup

V1APIGroup

V1APIGroup

## Details

APIGroup contains the name, the supported versions, and the preferred
version of a group.

## Methods

### Public methods

- [`V1APIGroup$new()`](#method-V1APIGroup-new)

- [`V1APIGroup$to_list()`](#method-V1APIGroup-to_list)

- [`V1APIGroup$clone()`](#method-V1APIGroup-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1APIGroup$new(
      api_version = NULL,
      kind = NULL,
      name = NULL,
      preferred_version = NULL,
      server_address_by_client_cid_rs = NULL,
      versions = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1APIGroup$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1APIGroup$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
