# V1alpha3ResourceSliceSpec

V1alpha3ResourceSliceSpec

V1alpha3ResourceSliceSpec

## Details

ResourceSliceSpec contains the information published by the driver in
one ResourceSlice.

## Methods

### Public methods

- [`V1alpha3ResourceSliceSpec$new()`](#method-V1alpha3ResourceSliceSpec-new)

- [`V1alpha3ResourceSliceSpec$to_list()`](#method-V1alpha3ResourceSliceSpec-to_list)

- [`V1alpha3ResourceSliceSpec$clone()`](#method-V1alpha3ResourceSliceSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha3ResourceSliceSpec$new(
      all_nodes = NULL,
      devices = NULL,
      driver = NULL,
      node_name = NULL,
      node_selector = NULL,
      pool = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha3ResourceSliceSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha3ResourceSliceSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
