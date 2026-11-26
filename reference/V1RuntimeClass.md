# V1RuntimeClass

V1RuntimeClass

V1RuntimeClass

## Details

RuntimeClass defines a class of container runtime supported in the
cluster. The RuntimeClass is used to determine which container runtime
is used to run all containers in a pod. RuntimeClasses are manually
defined by a user or cluster provisioner, and referenced in the PodSpec.
The Kubelet is responsible for resolving the RuntimeClassName reference
before running the pod. For more details, see
https://kubernetes.io/docs/concepts/containers/runtime-class/

## Methods

### Public methods

- [`V1RuntimeClass$new()`](#method-V1RuntimeClass-new)

- [`V1RuntimeClass$to_list()`](#method-V1RuntimeClass-to_list)

- [`V1RuntimeClass$clone()`](#method-V1RuntimeClass-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1RuntimeClass$new(
      api_version = NULL,
      handler = NULL,
      kind = NULL,
      metadata = NULL,
      overhead = NULL,
      scheduling = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1RuntimeClass$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1RuntimeClass$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
