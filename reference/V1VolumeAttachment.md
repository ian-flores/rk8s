# V1VolumeAttachment

V1VolumeAttachment

V1VolumeAttachment

## Details

VolumeAttachment captures the intent to attach or detach the specified
volume to/from the specified node.

VolumeAttachment objects are non-namespaced.

## Methods

### Public methods

- [`V1VolumeAttachment$new()`](#method-V1VolumeAttachment-new)

- [`V1VolumeAttachment$to_list()`](#method-V1VolumeAttachment-to_list)

- [`V1VolumeAttachment$clone()`](#method-V1VolumeAttachment-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1VolumeAttachment$new(
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

    V1VolumeAttachment$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1VolumeAttachment$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
