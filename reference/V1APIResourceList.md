# V1APIResourceList

V1APIResourceList

V1APIResourceList

## Details

APIResourceList is a list of APIResource, it is used to expose the name
of the resources supported in a specific group and version, and if the
resource is namespaced.

## Methods

### Public methods

- [`V1APIResourceList$new()`](#method-V1APIResourceList-new)

- [`V1APIResourceList$to_list()`](#method-V1APIResourceList-to_list)

- [`V1APIResourceList$clone()`](#method-V1APIResourceList-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1APIResourceList$new(
      api_version = NULL,
      group_version = NULL,
      kind = NULL,
      resources = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1APIResourceList$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1APIResourceList$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
