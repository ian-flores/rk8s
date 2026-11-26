# V1ResourceFieldSelector

V1ResourceFieldSelector

V1ResourceFieldSelector

## Details

ResourceFieldSelector represents container resources (cpu, memory) and
their output format

## Methods

### Public methods

- [`V1ResourceFieldSelector$new()`](#method-V1ResourceFieldSelector-new)

- [`V1ResourceFieldSelector$to_list()`](#method-V1ResourceFieldSelector-to_list)

- [`V1ResourceFieldSelector$clone()`](#method-V1ResourceFieldSelector-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ResourceFieldSelector$new(
      container_name = NULL,
      divisor = NULL,
      resource = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ResourceFieldSelector$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ResourceFieldSelector$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
