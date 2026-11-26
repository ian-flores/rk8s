# V1alpha3DeviceClass

V1alpha3DeviceClass

V1alpha3DeviceClass

## Details

DeviceClass is a vendor- or admin-provided resource that contains device
configuration and selectors. It can be referenced in the device requests
of a claim to apply these presets. Cluster scoped.

This is an alpha type and requires enabling the
DynamicResourceAllocation feature gate.

## Methods

### Public methods

- [`V1alpha3DeviceClass$new()`](#method-V1alpha3DeviceClass-new)

- [`V1alpha3DeviceClass$to_list()`](#method-V1alpha3DeviceClass-to_list)

- [`V1alpha3DeviceClass$clone()`](#method-V1alpha3DeviceClass-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha3DeviceClass$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha3DeviceClass$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha3DeviceClass$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
