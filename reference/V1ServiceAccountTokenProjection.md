# V1ServiceAccountTokenProjection

V1ServiceAccountTokenProjection

V1ServiceAccountTokenProjection

## Details

ServiceAccountTokenProjection represents a projected service account
token volume. This projection can be used to insert a service account
token into the pods runtime filesystem for use against APIs (Kubernetes
API Server or otherwise).

## Methods

### Public methods

- [`V1ServiceAccountTokenProjection$new()`](#method-V1ServiceAccountTokenProjection-new)

- [`V1ServiceAccountTokenProjection$to_list()`](#method-V1ServiceAccountTokenProjection-to_list)

- [`V1ServiceAccountTokenProjection$clone()`](#method-V1ServiceAccountTokenProjection-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ServiceAccountTokenProjection$new(
      audience = NULL,
      expiration_seconds = NULL,
      path = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ServiceAccountTokenProjection$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ServiceAccountTokenProjection$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
