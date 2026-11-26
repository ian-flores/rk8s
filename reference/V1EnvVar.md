# V1EnvVar

V1EnvVar

V1EnvVar

## Details

EnvVar represents an environment variable present in a Container.

## Methods

### Public methods

- [`V1EnvVar$new()`](#method-V1EnvVar-new)

- [`V1EnvVar$to_list()`](#method-V1EnvVar-to_list)

- [`V1EnvVar$clone()`](#method-V1EnvVar-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1EnvVar$new(name = NULL, value = NULL, value_from = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1EnvVar$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1EnvVar$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
