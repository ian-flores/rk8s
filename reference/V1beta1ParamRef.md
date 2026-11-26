# V1beta1ParamRef

V1beta1ParamRef

V1beta1ParamRef

## Details

ParamRef describes how to locate the params to be used as input to
expressions of rules applied by a policy binding.

## Methods

### Public methods

- [`V1beta1ParamRef$new()`](#method-V1beta1ParamRef-new)

- [`V1beta1ParamRef$to_list()`](#method-V1beta1ParamRef-to_list)

- [`V1beta1ParamRef$clone()`](#method-V1beta1ParamRef-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1beta1ParamRef$new(
      name = NULL,
      namespace = NULL,
      parameter_not_found_action = NULL,
      selector = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1beta1ParamRef$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1beta1ParamRef$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
