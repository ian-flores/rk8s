# V1ResourceHealth

V1ResourceHealth

V1ResourceHealth

## Details

ResourceHealth represents the health of a resource. It has the latest
device health information. This is a part of KEP https://kep.k8s.io/4680
and historical health changes are planned to be added in future
iterations of a KEP.

## Methods

### Public methods

- [`V1ResourceHealth$new()`](#method-V1ResourceHealth-new)

- [`V1ResourceHealth$to_list()`](#method-V1ResourceHealth-to_list)

- [`V1ResourceHealth$clone()`](#method-V1ResourceHealth-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ResourceHealth$new(health = NULL, resource_id = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ResourceHealth$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ResourceHealth$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
