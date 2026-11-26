# V1CSINode

V1CSINode

V1CSINode

## Details

CSINode holds information about all CSI drivers installed on a node. CSI
drivers do not need to create the CSINode object directly. As long as
they use the node-driver-registrar sidecar container, the kubelet will
automatically populate the CSINode object for the CSI driver as part of
kubelet plugin registration. CSINode has the same name as a node. If the
object is missing, it means either there are no CSI Drivers available on
the node, or the Kubelet version is low enough that it doesn't create
this object. CSINode has an OwnerReference that points to the
corresponding node object.

## Methods

### Public methods

- [`V1CSINode$new()`](#method-V1CSINode-new)

- [`V1CSINode$to_list()`](#method-V1CSINode-to_list)

- [`V1CSINode$clone()`](#method-V1CSINode-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CSINode$new(api_version = NULL, kind = NULL, metadata = NULL, spec = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CSINode$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CSINode$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
