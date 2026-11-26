# V1LeaseSpec

V1LeaseSpec

V1LeaseSpec

## Details

LeaseSpec is a specification of a Lease.

## Methods

### Public methods

- [`V1LeaseSpec$new()`](#method-V1LeaseSpec-new)

- [`V1LeaseSpec$to_list()`](#method-V1LeaseSpec-to_list)

- [`V1LeaseSpec$clone()`](#method-V1LeaseSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1LeaseSpec$new(
      acquire_time = NULL,
      holder_identity = NULL,
      lease_duration_seconds = NULL,
      lease_transitions = NULL,
      preferred_holder = NULL,
      renew_time = NULL,
      strategy = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1LeaseSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1LeaseSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
