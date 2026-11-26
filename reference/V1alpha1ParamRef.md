# V1alpha1ParamRef

V1alpha1ParamRef

V1alpha1ParamRef

## Details

ParamRef describes how to locate the params to be used as input to
expressions of rules applied by a policy binding.

## Methods

### Public methods

- [`V1alpha1ParamRef$new()`](#method-V1alpha1ParamRef-new)

- [`V1alpha1ParamRef$to_list()`](#method-V1alpha1ParamRef-to_list)

- [`V1alpha1ParamRef$clone()`](#method-V1alpha1ParamRef-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha1ParamRef$new(
      name = NULL,
      namespace = NULL,
      parameter_not_found_action = NULL,
      selector = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha1ParamRef$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha1ParamRef$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
