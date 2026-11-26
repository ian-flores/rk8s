# V1CSINodeDriver

V1CSINodeDriver

V1CSINodeDriver

## Details

CSINodeDriver holds information about the specification of one CSI
driver installed on a node

## Methods

### Public methods

- [`V1CSINodeDriver$new()`](#method-V1CSINodeDriver-new)

- [`V1CSINodeDriver$to_list()`](#method-V1CSINodeDriver-to_list)

- [`V1CSINodeDriver$clone()`](#method-V1CSINodeDriver-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CSINodeDriver$new(
      allocatable = NULL,
      name = NULL,
      node_id = NULL,
      topology_keys = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CSINodeDriver$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CSINodeDriver$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
