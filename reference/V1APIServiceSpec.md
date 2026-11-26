# V1APIServiceSpec

V1APIServiceSpec

V1APIServiceSpec

## Details

APIServiceSpec contains information for locating and communicating with
a server. Only https is supported, though you are able to disable
certificate verification.

## Methods

### Public methods

- [`V1APIServiceSpec$new()`](#method-V1APIServiceSpec-new)

- [`V1APIServiceSpec$to_list()`](#method-V1APIServiceSpec-to_list)

- [`V1APIServiceSpec$clone()`](#method-V1APIServiceSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1APIServiceSpec$new(
      ca_bundle = NULL,
      group = NULL,
      group_priority_minimum = NULL,
      insecure_skip_tls_verify = NULL,
      service = NULL,
      version = NULL,
      version_priority = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1APIServiceSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1APIServiceSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
