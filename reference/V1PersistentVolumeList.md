# V1PersistentVolumeList

V1PersistentVolumeList

V1PersistentVolumeList

## Details

PersistentVolumeList is a list of PersistentVolume items.

## Methods

### Public methods

- [`V1PersistentVolumeList$new()`](#method-V1PersistentVolumeList-new)

- [`V1PersistentVolumeList$to_list()`](#method-V1PersistentVolumeList-to_list)

- [`V1PersistentVolumeList$clone()`](#method-V1PersistentVolumeList-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PersistentVolumeList$new(
      api_version = NULL,
      items = NULL,
      kind = NULL,
      metadata = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PersistentVolumeList$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PersistentVolumeList$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
