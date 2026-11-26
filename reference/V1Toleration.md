# V1Toleration

V1Toleration

V1Toleration

## Details

The pod this Toleration is attached to tolerates any taint that matches
the triple \<key,value,effect\> using the matching operator
\<operator\>.

## Methods

### Public methods

- [`V1Toleration$new()`](#method-V1Toleration-new)

- [`V1Toleration$to_list()`](#method-V1Toleration-to_list)

- [`V1Toleration$clone()`](#method-V1Toleration-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Toleration$new(
      effect = NULL,
      key = NULL,
      operator = NULL,
      toleration_seconds = NULL,
      value = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Toleration$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Toleration$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
