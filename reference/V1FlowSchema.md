# V1FlowSchema

V1FlowSchema

V1FlowSchema

## Details

FlowSchema defines the schema of a group of flows. Note that a flow is
made up of a set of inbound API requests with similar attributes and is
identified by a pair of strings: the name of the FlowSchema and a "flow
distinguisher".

## Methods

### Public methods

- [`V1FlowSchema$new()`](#method-V1FlowSchema-new)

- [`V1FlowSchema$to_list()`](#method-V1FlowSchema-to_list)

- [`V1FlowSchema$clone()`](#method-V1FlowSchema-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1FlowSchema$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL,
      status = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1FlowSchema$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1FlowSchema$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
