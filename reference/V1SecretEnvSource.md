# V1SecretEnvSource

V1SecretEnvSource

V1SecretEnvSource

## Details

SecretEnvSource selects a Secret to populate the environment variables
with.

The contents of the target Secret's Data field will represent the
key-value pairs as environment variables.

## Methods

### Public methods

- [`V1SecretEnvSource$new()`](#method-V1SecretEnvSource-new)

- [`V1SecretEnvSource$to_list()`](#method-V1SecretEnvSource-to_list)

- [`V1SecretEnvSource$clone()`](#method-V1SecretEnvSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1SecretEnvSource$new(name = NULL, optional = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1SecretEnvSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1SecretEnvSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
