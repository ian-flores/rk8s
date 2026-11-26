# V1ConfigMapNodeConfigSource

V1ConfigMapNodeConfigSource

V1ConfigMapNodeConfigSource

## Details

ConfigMapNodeConfigSource contains the information to reference a
ConfigMap as a config source for the Node. This API is deprecated since
1.22:
https://git.k8s.io/enhancements/keps/sig-node/281-dynamic-kubelet-configuration

## Methods

### Public methods

- [`V1ConfigMapNodeConfigSource$new()`](#method-V1ConfigMapNodeConfigSource-new)

- [`V1ConfigMapNodeConfigSource$to_list()`](#method-V1ConfigMapNodeConfigSource-to_list)

- [`V1ConfigMapNodeConfigSource$clone()`](#method-V1ConfigMapNodeConfigSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ConfigMapNodeConfigSource$new(
      kubelet_config_key = NULL,
      name = NULL,
      namespace = NULL,
      resource_version = NULL,
      uid = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ConfigMapNodeConfigSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ConfigMapNodeConfigSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
