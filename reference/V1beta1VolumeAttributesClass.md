# V1beta1VolumeAttributesClass

V1beta1VolumeAttributesClass

V1beta1VolumeAttributesClass

## Details

VolumeAttributesClass represents a specification of mutable volume
attributes defined by the CSI driver. The class can be specified during
dynamic provisioning of PersistentVolumeClaims, and changed in the
PersistentVolumeClaim spec after provisioning.

## Methods

### Public methods

- [`V1beta1VolumeAttributesClass$new()`](#method-V1beta1VolumeAttributesClass-new)

- [`V1beta1VolumeAttributesClass$to_list()`](#method-V1beta1VolumeAttributesClass-to_list)

- [`V1beta1VolumeAttributesClass$clone()`](#method-V1beta1VolumeAttributesClass-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1beta1VolumeAttributesClass$new(
      api_version = NULL,
      driver_name = NULL,
      kind = NULL,
      metadata = NULL,
      parameters = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1beta1VolumeAttributesClass$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1beta1VolumeAttributesClass$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
