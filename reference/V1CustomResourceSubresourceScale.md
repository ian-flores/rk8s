# V1CustomResourceSubresourceScale

V1CustomResourceSubresourceScale

V1CustomResourceSubresourceScale

## Details

CustomResourceSubresourceScale defines how to serve the scale
subresource for CustomResources.

## Methods

### Public methods

- [`V1CustomResourceSubresourceScale$new()`](#method-V1CustomResourceSubresourceScale-new)

- [`V1CustomResourceSubresourceScale$to_list()`](#method-V1CustomResourceSubresourceScale-to_list)

- [`V1CustomResourceSubresourceScale$clone()`](#method-V1CustomResourceSubresourceScale-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CustomResourceSubresourceScale$new(
      label_selector_path = NULL,
      spec_replicas_path = NULL,
      status_replicas_path = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CustomResourceSubresourceScale$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CustomResourceSubresourceScale$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
