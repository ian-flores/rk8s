# V1SecretProjection

V1SecretProjection

V1SecretProjection

## Details

Adapts a secret into a projected volume.

The contents of the target Secret's Data field will be presented in a
projected volume as files using the keys in the Data field as the file
names. Note that this is identical to a secret volume source without the
default mode.

## Methods

### Public methods

- [`V1SecretProjection$new()`](#method-V1SecretProjection-new)

- [`V1SecretProjection$to_list()`](#method-V1SecretProjection-to_list)

- [`V1SecretProjection$clone()`](#method-V1SecretProjection-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1SecretProjection$new(items = NULL, name = NULL, optional = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1SecretProjection$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1SecretProjection$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
