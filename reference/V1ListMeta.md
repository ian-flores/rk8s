# V1ListMeta

V1ListMeta

V1ListMeta

## Details

ListMeta describes metadata that synthetic resources must have,
including lists and various status objects. A resource may have only one
of ObjectMeta, ListMeta.

## Methods

### Public methods

- [`V1ListMeta$new()`](#method-V1ListMeta-new)

- [`V1ListMeta$to_list()`](#method-V1ListMeta-to_list)

- [`V1ListMeta$clone()`](#method-V1ListMeta-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ListMeta$new(
      continue = NULL,
      remaining_item_count = NULL,
      resource_version = NULL,
      self_link = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ListMeta$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ListMeta$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
