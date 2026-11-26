# V1alpha1LeaseCandidate

V1alpha1LeaseCandidate

V1alpha1LeaseCandidate

## Details

LeaseCandidate defines a candidate for a Lease object. Candidates are
created such that coordinated leader election will pick the best leader
from the list of candidates.

## Methods

### Public methods

- [`V1alpha1LeaseCandidate$new()`](#method-V1alpha1LeaseCandidate-new)

- [`V1alpha1LeaseCandidate$to_list()`](#method-V1alpha1LeaseCandidate-to_list)

- [`V1alpha1LeaseCandidate$clone()`](#method-V1alpha1LeaseCandidate-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha1LeaseCandidate$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha1LeaseCandidate$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha1LeaseCandidate$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
