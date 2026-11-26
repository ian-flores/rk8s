# V1CustomResourceDefinition

V1CustomResourceDefinition

V1CustomResourceDefinition

## Details

CustomResourceDefinition represents a resource that should be exposed on
the API server. Its name MUST be in the format
\<.spec.name\>.\<.spec.group\>.

## Methods

### Public methods

- [`V1CustomResourceDefinition$new()`](#method-V1CustomResourceDefinition-new)

- [`V1CustomResourceDefinition$to_list()`](#method-V1CustomResourceDefinition-to_list)

- [`V1CustomResourceDefinition$clone()`](#method-V1CustomResourceDefinition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CustomResourceDefinition$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL,
      status = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CustomResourceDefinition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CustomResourceDefinition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
