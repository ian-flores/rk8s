# V1StatusDetails

V1StatusDetails

V1StatusDetails

## Details

StatusDetails is a set of additional properties that MAY be set by the
server to provide additional information about a response. The Reason
field of a Status object defines what attributes will be set. Clients
must ignore fields that do not match the defined type of each attribute,
and should assume that any attribute may be empty, invalid, or under
defined.

## Methods

### Public methods

- [`V1StatusDetails$new()`](#method-V1StatusDetails-new)

- [`V1StatusDetails$to_list()`](#method-V1StatusDetails-to_list)

- [`V1StatusDetails$clone()`](#method-V1StatusDetails-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1StatusDetails$new(
      causes = NULL,
      group = NULL,
      kind = NULL,
      name = NULL,
      retry_after_seconds = NULL,
      uid = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1StatusDetails$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1StatusDetails$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
