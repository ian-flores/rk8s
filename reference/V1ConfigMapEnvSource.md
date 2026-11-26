# V1ConfigMapEnvSource

V1ConfigMapEnvSource

V1ConfigMapEnvSource

## Details

ConfigMapEnvSource selects a ConfigMap to populate the environment
variables with.

The contents of the target ConfigMap's Data field will represent the
key-value pairs as environment variables.

## Methods

### Public methods

- [`V1ConfigMapEnvSource$new()`](#method-V1ConfigMapEnvSource-new)

- [`V1ConfigMapEnvSource$to_list()`](#method-V1ConfigMapEnvSource-to_list)

- [`V1ConfigMapEnvSource$clone()`](#method-V1ConfigMapEnvSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ConfigMapEnvSource$new(name = NULL, optional = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ConfigMapEnvSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ConfigMapEnvSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
