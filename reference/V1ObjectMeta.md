# V1ObjectMeta

V1ObjectMeta

V1ObjectMeta

## Details

ObjectMeta is metadata that all persisted resources must have, which
includes all objects users must create.

## Methods

### Public methods

- [`V1ObjectMeta$new()`](#method-V1ObjectMeta-new)

- [`V1ObjectMeta$to_list()`](#method-V1ObjectMeta-to_list)

- [`V1ObjectMeta$clone()`](#method-V1ObjectMeta-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ObjectMeta$new(
      annotations = NULL,
      creation_timestamp = NULL,
      deletion_grace_period_seconds = NULL,
      deletion_timestamp = NULL,
      finalizers = NULL,
      generate_name = NULL,
      generation = NULL,
      labels = NULL,
      managed_fields = NULL,
      name = NULL,
      namespace = NULL,
      owner_references = NULL,
      resource_version = NULL,
      self_link = NULL,
      uid = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ObjectMeta$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ObjectMeta$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
