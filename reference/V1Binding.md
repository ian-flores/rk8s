# V1Binding

V1Binding

V1Binding

## Details

Binding ties one object to another; for example, a pod is bound to a
node by a scheduler. Deprecated in 1.7, please use the bindings
subresource of pods instead.

## Methods

### Public methods

- [`V1Binding$new()`](#method-V1Binding-new)

- [`V1Binding$to_list()`](#method-V1Binding-to_list)

- [`V1Binding$clone()`](#method-V1Binding-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1Binding$new(api_version = NULL, kind = NULL, metadata = NULL, target = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1Binding$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1Binding$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
