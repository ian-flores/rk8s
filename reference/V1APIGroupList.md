# V1APIGroupList

V1APIGroupList

V1APIGroupList

## Details

APIGroupList is a list of APIGroup, to allow clients to discover the API
at /apis.

## Methods

### Public methods

- [`V1APIGroupList$new()`](#method-V1APIGroupList-new)

- [`V1APIGroupList$to_list()`](#method-V1APIGroupList-to_list)

- [`V1APIGroupList$clone()`](#method-V1APIGroupList-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1APIGroupList$new(api_version = NULL, groups = NULL, kind = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1APIGroupList$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1APIGroupList$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
