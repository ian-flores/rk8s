# V1alpha1StorageVersionStatus

V1alpha1StorageVersionStatus

V1alpha1StorageVersionStatus

## Details

API server instances report the versions they can decode and the version
they encode objects to when persisting objects in the backend.

## Methods

### Public methods

- [`V1alpha1StorageVersionStatus$new()`](#method-V1alpha1StorageVersionStatus-new)

- [`V1alpha1StorageVersionStatus$to_list()`](#method-V1alpha1StorageVersionStatus-to_list)

- [`V1alpha1StorageVersionStatus$clone()`](#method-V1alpha1StorageVersionStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha1StorageVersionStatus$new(
      common_encoding_version = NULL,
      conditions = NULL,
      storage_versions = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha1StorageVersionStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha1StorageVersionStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
