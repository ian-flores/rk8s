# FlowcontrolV1Subject

FlowcontrolV1Subject

FlowcontrolV1Subject

## Details

Subject matches the originator of a request, as identified by the
request authentication system. There are three ways of matching an
originator; by user, group, or service account.

## Methods

### Public methods

- [`FlowcontrolV1Subject$new()`](#method-FlowcontrolV1Subject-new)

- [`FlowcontrolV1Subject$to_list()`](#method-FlowcontrolV1Subject-to_list)

- [`FlowcontrolV1Subject$clone()`](#method-FlowcontrolV1Subject-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    FlowcontrolV1Subject$new(
      group = NULL,
      kind = NULL,
      service_account = NULL,
      user = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    FlowcontrolV1Subject$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    FlowcontrolV1Subject$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
