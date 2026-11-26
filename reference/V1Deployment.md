# V1Deployment

V1Deployment

V1Deployment

## Details

Deployment enables declarative updates for Pods and ReplicaSets.

## Methods

### Public methods

- [`V1Deployment$new()`](#method-V1Deployment-new)

- [`V1Deployment$to_list()`](#method-V1Deployment-to_list)

- [`V1Deployment$clone()`](#method-V1Deployment-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Deployment$new(
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

    V1Deployment$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Deployment$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
