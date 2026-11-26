# V1VolumeAttachmentSource

V1VolumeAttachmentSource

V1VolumeAttachmentSource

## Details

VolumeAttachmentSource represents a volume that should be attached.
Right now only PersistenVolumes can be attached via external attacher,
in future we may allow also inline volumes in pods. Exactly one member
can be set.

## Methods

### Public methods

- [`V1VolumeAttachmentSource$new()`](#method-V1VolumeAttachmentSource-new)

- [`V1VolumeAttachmentSource$to_list()`](#method-V1VolumeAttachmentSource-to_list)

- [`V1VolumeAttachmentSource$clone()`](#method-V1VolumeAttachmentSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1VolumeAttachmentSource$new(
      inline_volume_spec = NULL,
      persistent_volume_name = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1VolumeAttachmentSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1VolumeAttachmentSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
