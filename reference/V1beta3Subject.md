# V1beta3Subject

V1beta3Subject

V1beta3Subject

## Details

Subject matches the originator of a request, as identified by the
request authentication system. There are three ways of matching an
originator; by user, group, or service account.

## Methods

### Public methods

- [`V1beta3Subject$new()`](#method-V1beta3Subject-new)

- [`V1beta3Subject$to_list()`](#method-V1beta3Subject-to_list)

- [`V1beta3Subject$clone()`](#method-V1beta3Subject-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1beta3Subject$new(
      group = NULL,
      kind = NULL,
      service_account = NULL,
      user = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1beta3Subject$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1beta3Subject$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
