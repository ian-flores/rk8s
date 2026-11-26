# V1PersistentVolume

V1PersistentVolume

V1PersistentVolume

## Details

PersistentVolume (PV) is a storage resource provisioned by an
administrator. It is analogous to a node. More info:
https://kubernetes.io/docs/concepts/storage/persistent-volumes

## Methods

### Public methods

- [`V1PersistentVolume$new()`](#method-V1PersistentVolume-new)

- [`V1PersistentVolume$to_list()`](#method-V1PersistentVolume-to_list)

- [`V1PersistentVolume$clone()`](#method-V1PersistentVolume-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PersistentVolume$new(
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

    V1PersistentVolume$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PersistentVolume$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
