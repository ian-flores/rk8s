# V1PersistentVolumeClaimCondition

V1PersistentVolumeClaimCondition

V1PersistentVolumeClaimCondition

## Details

PersistentVolumeClaimCondition contains details about state of pvc

## Methods

### Public methods

- [`V1PersistentVolumeClaimCondition$new()`](#method-V1PersistentVolumeClaimCondition-new)

- [`V1PersistentVolumeClaimCondition$to_list()`](#method-V1PersistentVolumeClaimCondition-to_list)

- [`V1PersistentVolumeClaimCondition$clone()`](#method-V1PersistentVolumeClaimCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PersistentVolumeClaimCondition$new(
      last_probe_time = NULL,
      last_transition_time = NULL,
      message = NULL,
      reason = NULL,
      status = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PersistentVolumeClaimCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PersistentVolumeClaimCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
