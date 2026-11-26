# V1ConfigMapProjection

V1ConfigMapProjection

V1ConfigMapProjection

## Details

Adapts a ConfigMap into a projected volume.

The contents of the target ConfigMap's Data field will be presented in a
projected volume as files using the keys in the Data field as the file
names, unless the items element is populated with specific mappings of
keys to paths. Note that this is identical to a configmap volume source
without the default mode.

## Methods

### Public methods

- [`V1ConfigMapProjection$new()`](#method-V1ConfigMapProjection-new)

- [`V1ConfigMapProjection$to_list()`](#method-V1ConfigMapProjection-to_list)

- [`V1ConfigMapProjection$clone()`](#method-V1ConfigMapProjection-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ConfigMapProjection$new(items = NULL, name = NULL, optional = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ConfigMapProjection$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ConfigMapProjection$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
