# V1PersistentVolumeClaim

V1PersistentVolumeClaim

V1PersistentVolumeClaim

## Details

PersistentVolumeClaim is a user's request for and claim to a persistent
volume

## Methods

### Public methods

- [`V1PersistentVolumeClaim$new()`](#method-V1PersistentVolumeClaim-new)

- [`V1PersistentVolumeClaim$to_list()`](#method-V1PersistentVolumeClaim-to_list)

- [`V1PersistentVolumeClaim$clone()`](#method-V1PersistentVolumeClaim-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PersistentVolumeClaim$new(
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

    V1PersistentVolumeClaim$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PersistentVolumeClaim$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
