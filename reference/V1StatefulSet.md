# V1StatefulSet

V1StatefulSet

V1StatefulSet

## Details

StatefulSet represents a set of pods with consistent identities.
Identities are defined as: - Network: A single stable DNS and
hostname. - Storage: As many VolumeClaims as requested.

The StatefulSet guarantees that a given network identity will always map
to the same storage identity.

## Methods

### Public methods

- [`V1StatefulSet$new()`](#method-V1StatefulSet-new)

- [`V1StatefulSet$to_list()`](#method-V1StatefulSet-to_list)

- [`V1StatefulSet$clone()`](#method-V1StatefulSet-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1StatefulSet$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL,
      status = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1StatefulSet$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1StatefulSet$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
