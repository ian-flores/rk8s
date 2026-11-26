# V1NodeFeatures

V1NodeFeatures

V1NodeFeatures

## Details

NodeFeatures describes the set of features implemented by the CRI
implementation. The features contained in the NodeFeatures should depend
only on the cri implementation independent of runtime handlers.

## Methods

### Public methods

- [`V1NodeFeatures$new()`](#method-V1NodeFeatures-new)

- [`V1NodeFeatures$to_list()`](#method-V1NodeFeatures-to_list)

- [`V1NodeFeatures$clone()`](#method-V1NodeFeatures-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NodeFeatures$new(supplemental_groups_policy = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NodeFeatures$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NodeFeatures$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
