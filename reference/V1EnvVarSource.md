# V1EnvVarSource

V1EnvVarSource

V1EnvVarSource

## Details

EnvVarSource represents a source for the value of an EnvVar.

## Methods

### Public methods

- [`V1EnvVarSource$new()`](#method-V1EnvVarSource-new)

- [`V1EnvVarSource$to_list()`](#method-V1EnvVarSource-to_list)

- [`V1EnvVarSource$clone()`](#method-V1EnvVarSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1EnvVarSource$new(
      config_map_key_ref = NULL,
      field_ref = NULL,
      resource_field_ref = NULL,
      secret_key_ref = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1EnvVarSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1EnvVarSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
