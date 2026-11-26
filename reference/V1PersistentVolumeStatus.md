# V1PersistentVolumeStatus

V1PersistentVolumeStatus

V1PersistentVolumeStatus

## Details

PersistentVolumeStatus is the current status of a persistent volume.

## Methods

### Public methods

- [`V1PersistentVolumeStatus$new()`](#method-V1PersistentVolumeStatus-new)

- [`V1PersistentVolumeStatus$to_list()`](#method-V1PersistentVolumeStatus-to_list)

- [`V1PersistentVolumeStatus$clone()`](#method-V1PersistentVolumeStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PersistentVolumeStatus$new(
      last_phase_transition_time = NULL,
      message = NULL,
      phase = NULL,
      reason = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PersistentVolumeStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PersistentVolumeStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
