# V1VolumeProjection

V1VolumeProjection

V1VolumeProjection

## Details

Projection that may be projected along with other supported volume
types. Exactly one of these fields must be set.

## Methods

### Public methods

- [`V1VolumeProjection$new()`](#method-V1VolumeProjection-new)

- [`V1VolumeProjection$to_list()`](#method-V1VolumeProjection-to_list)

- [`V1VolumeProjection$clone()`](#method-V1VolumeProjection-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1VolumeProjection$new(
      cluster_trust_bundle = NULL,
      config_map = NULL,
      downward_api = NULL,
      secret = NULL,
      service_account_token = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1VolumeProjection$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1VolumeProjection$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
