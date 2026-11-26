# V1IngressRule

V1IngressRule

V1IngressRule

## Details

IngressRule represents the rules mapping the paths under a specified
host to the related backend services. Incoming requests are first
evaluated for a host match, then routed to the backend associated with
the matching IngressRuleValue.

## Methods

### Public methods

- [`V1IngressRule$new()`](#method-V1IngressRule-new)

- [`V1IngressRule$to_list()`](#method-V1IngressRule-to_list)

- [`V1IngressRule$clone()`](#method-V1IngressRule-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1IngressRule$new(host = NULL, http = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1IngressRule$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1IngressRule$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
