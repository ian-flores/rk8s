# V1alpha3DeviceRequest

V1alpha3DeviceRequest

V1alpha3DeviceRequest

## Details

DeviceRequest is a request for devices required for a claim. This is
typically a request for a single resource like a device, but can also
ask for several identical devices.

A DeviceClassName is currently required. Clients must check that it is
indeed set. It's absence indicates that something changed in a way that
is not supported by the client yet, in which case it must refuse to
handle the request.

## Methods

### Public methods

- [`V1alpha3DeviceRequest$new()`](#method-V1alpha3DeviceRequest-new)

- [`V1alpha3DeviceRequest$to_list()`](#method-V1alpha3DeviceRequest-to_list)

- [`V1alpha3DeviceRequest$clone()`](#method-V1alpha3DeviceRequest-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha3DeviceRequest$new(
      admin_access = NULL,
      allocation_mode = NULL,
      count = NULL,
      device_class_name = NULL,
      name = NULL,
      selectors = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha3DeviceRequest$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha3DeviceRequest$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
