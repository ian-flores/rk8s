# V1HTTPGetAction

V1HTTPGetAction

V1HTTPGetAction

## Details

HTTPGetAction describes an action based on HTTP Get requests.

## Methods

### Public methods

- [`V1HTTPGetAction$new()`](#method-V1HTTPGetAction-new)

- [`V1HTTPGetAction$to_list()`](#method-V1HTTPGetAction-to_list)

- [`V1HTTPGetAction$clone()`](#method-V1HTTPGetAction-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1HTTPGetAction$new(
      host = NULL,
      http_headers = NULL,
      path = NULL,
      port = NULL,
      scheme = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1HTTPGetAction$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1HTTPGetAction$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
