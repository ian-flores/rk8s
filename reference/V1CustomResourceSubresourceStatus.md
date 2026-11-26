# V1CustomResourceSubresourceStatus

V1CustomResourceSubresourceStatus

V1CustomResourceSubresourceStatus

## Details

CustomResourceSubresourceStatus defines how to serve the status
subresource for CustomResources. Status is represented by the
\`.status\` JSON path inside of a CustomResource. When set, \* exposes a
/status subresource for the custom resource \* PUT requests to the
/status subresource take a custom resource object, and ignore changes to
anything except the status stanza \* PUT/POST/PATCH requests to the
custom resource ignore changes to the status stanza

## Public fields

- `value`:

  Underlying scalar / unstructured value.

## Methods

### Public methods

- [`V1CustomResourceSubresourceStatus$new()`](#method-V1CustomResourceSubresourceStatus-new)

- [`V1CustomResourceSubresourceStatus$to_list()`](#method-V1CustomResourceSubresourceStatus-to_list)

- [`V1CustomResourceSubresourceStatus$clone()`](#method-V1CustomResourceSubresourceStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CustomResourceSubresourceStatus$new(value = NULL)

#### Arguments

- `value`:

  The underlying value.

------------------------------------------------------------------------

### Method `to_list()`

Return the underlying value (no key wrapping).

#### Usage

    V1CustomResourceSubresourceStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CustomResourceSubresourceStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
