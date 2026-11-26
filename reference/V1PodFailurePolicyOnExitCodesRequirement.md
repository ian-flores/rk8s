# V1PodFailurePolicyOnExitCodesRequirement

V1PodFailurePolicyOnExitCodesRequirement

V1PodFailurePolicyOnExitCodesRequirement

## Details

PodFailurePolicyOnExitCodesRequirement describes the requirement for
handling a failed pod based on its container exit codes. In particular,
it lookups the .state.terminated.exitCode for each app container and
init container status, represented by the .status.containerStatuses and
.status.initContainerStatuses fields in the Pod status, respectively.
Containers completed with success (exit code 0) are excluded from the
requirement check.

## Methods

### Public methods

- [`V1PodFailurePolicyOnExitCodesRequirement$new()`](#method-V1PodFailurePolicyOnExitCodesRequirement-new)

- [`V1PodFailurePolicyOnExitCodesRequirement$to_list()`](#method-V1PodFailurePolicyOnExitCodesRequirement-to_list)

- [`V1PodFailurePolicyOnExitCodesRequirement$clone()`](#method-V1PodFailurePolicyOnExitCodesRequirement-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PodFailurePolicyOnExitCodesRequirement$new(
      container_name = NULL,
      operator = NULL,
      values = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PodFailurePolicyOnExitCodesRequirement$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PodFailurePolicyOnExitCodesRequirement$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
