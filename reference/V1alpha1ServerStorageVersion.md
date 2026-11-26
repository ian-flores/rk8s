# V1alpha1ServerStorageVersion

V1alpha1ServerStorageVersion

V1alpha1ServerStorageVersion

## Details

An API server instance reports the version it can decode and the version
it encodes objects to when persisting objects in the backend.

## Methods

### Public methods

- [`V1alpha1ServerStorageVersion$new()`](#method-V1alpha1ServerStorageVersion-new)

- [`V1alpha1ServerStorageVersion$to_list()`](#method-V1alpha1ServerStorageVersion-to_list)

- [`V1alpha1ServerStorageVersion$clone()`](#method-V1alpha1ServerStorageVersion-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha1ServerStorageVersion$new(
      api_server_id = NULL,
      decodable_versions = NULL,
      encoding_version = NULL,
      served_versions = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha1ServerStorageVersion$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha1ServerStorageVersion$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
