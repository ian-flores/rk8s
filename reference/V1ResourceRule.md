# V1ResourceRule

V1ResourceRule

V1ResourceRule

## Details

ResourceRule is the list of actions the subject is allowed to perform on
resources. The list ordering isn't significant, may contain duplicates,
and possibly be incomplete.

## Methods

### Public methods

- [`V1ResourceRule$new()`](#method-V1ResourceRule-new)

- [`V1ResourceRule$to_list()`](#method-V1ResourceRule-to_list)

- [`V1ResourceRule$clone()`](#method-V1ResourceRule-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ResourceRule$new(
      api_groups = NULL,
      resource_names = NULL,
      resources = NULL,
      verbs = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ResourceRule$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ResourceRule$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
