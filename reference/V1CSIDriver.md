# V1CSIDriver

V1CSIDriver

V1CSIDriver

## Details

CSIDriver captures information about a Container Storage Interface (CSI)
volume driver deployed on the cluster. Kubernetes attach detach
controller uses this object to determine whether attach is required.
Kubelet uses this object to determine whether pod information needs to
be passed on mount. CSIDriver objects are non-namespaced.

## Methods

### Public methods

- [`V1CSIDriver$new()`](#method-V1CSIDriver-new)

- [`V1CSIDriver$to_list()`](#method-V1CSIDriver-to_list)

- [`V1CSIDriver$clone()`](#method-V1CSIDriver-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1CSIDriver$new(api_version = NULL, kind = NULL, metadata = NULL, spec = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1CSIDriver$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1CSIDriver$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
