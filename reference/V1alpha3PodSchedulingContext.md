# V1alpha3PodSchedulingContext

V1alpha3PodSchedulingContext

V1alpha3PodSchedulingContext

## Details

PodSchedulingContext objects hold information that is needed to schedule
a Pod with ResourceClaims that use "WaitForFirstConsumer" allocation
mode.

This is an alpha type and requires enabling the
DRAControlPlaneController feature gate.

## Methods

### Public methods

- [`V1alpha3PodSchedulingContext$new()`](#method-V1alpha3PodSchedulingContext-new)

- [`V1alpha3PodSchedulingContext$to_list()`](#method-V1alpha3PodSchedulingContext-to_list)

- [`V1alpha3PodSchedulingContext$clone()`](#method-V1alpha3PodSchedulingContext-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha3PodSchedulingContext$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL,
      status = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha3PodSchedulingContext$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha3PodSchedulingContext$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
