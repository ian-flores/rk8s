# V1IngressClass

V1IngressClass

V1IngressClass

## Details

IngressClass represents the class of the Ingress, referenced by the
Ingress Spec. The \`ingressclass.kubernetes.io/is-default-class\`
annotation can be used to indicate that an IngressClass should be
considered default. When a single IngressClass resource has this
annotation set to true, new Ingress resources without a class specified
will be assigned this default class.

## Methods

### Public methods

- [`V1IngressClass$new()`](#method-V1IngressClass-new)

- [`V1IngressClass$to_list()`](#method-V1IngressClass-to_list)

- [`V1IngressClass$clone()`](#method-V1IngressClass-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1IngressClass$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1IngressClass$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1IngressClass$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
