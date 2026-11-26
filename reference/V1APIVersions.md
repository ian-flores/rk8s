# V1APIVersions

V1APIVersions

V1APIVersions

## Details

APIVersions lists the versions that are available, to allow clients to
discover the API at /api, which is the root path of the legacy v1 API.

## Methods

### Public methods

- [`V1APIVersions$new()`](#method-V1APIVersions-new)

- [`V1APIVersions$to_list()`](#method-V1APIVersions-to_list)

- [`V1APIVersions$clone()`](#method-V1APIVersions-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1APIVersions$new(
      api_version = NULL,
      kind = NULL,
      server_address_by_client_cid_rs = NULL,
      versions = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1APIVersions$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1APIVersions$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
