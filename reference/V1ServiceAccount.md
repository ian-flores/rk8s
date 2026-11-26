# V1ServiceAccount

V1ServiceAccount

V1ServiceAccount

## Details

ServiceAccount binds together: \* a name, understood by users, and
perhaps by peripheral systems, for an identity \* a principal that can
be authenticated and authorized \* a set of secrets

## Methods

### Public methods

- [`V1ServiceAccount$new()`](#method-V1ServiceAccount-new)

- [`V1ServiceAccount$to_list()`](#method-V1ServiceAccount-to_list)

- [`V1ServiceAccount$clone()`](#method-V1ServiceAccount-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ServiceAccount$new(
      api_version = NULL,
      automount_service_account_token = NULL,
      image_pull_secrets = NULL,
      kind = NULL,
      metadata = NULL,
      secrets = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ServiceAccount$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ServiceAccount$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
