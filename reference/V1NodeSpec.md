# V1NodeSpec

V1NodeSpec

V1NodeSpec

## Details

NodeSpec describes the attributes that a node is created with.

## Methods

### Public methods

- [`V1NodeSpec$new()`](#method-V1NodeSpec-new)

- [`V1NodeSpec$to_list()`](#method-V1NodeSpec-to_list)

- [`V1NodeSpec$clone()`](#method-V1NodeSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1NodeSpec$new(
      config_source = NULL,
      external_id = NULL,
      pod_cidr = NULL,
      pod_cid_rs = NULL,
      provider_id = NULL,
      taints = NULL,
      unschedulable = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1NodeSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1NodeSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
