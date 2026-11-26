# V1PersistentVolumeClaimVolumeSource

V1PersistentVolumeClaimVolumeSource

V1PersistentVolumeClaimVolumeSource

## Details

PersistentVolumeClaimVolumeSource references the user's PVC in the same
namespace. This volume finds the bound PV and mounts that volume for the
pod. A PersistentVolumeClaimVolumeSource is, essentially, a wrapper
around another type of volume that is owned by someone else (the
system).

## Methods

### Public methods

- [`V1PersistentVolumeClaimVolumeSource$new()`](#method-V1PersistentVolumeClaimVolumeSource-new)

- [`V1PersistentVolumeClaimVolumeSource$to_list()`](#method-V1PersistentVolumeClaimVolumeSource-to_list)

- [`V1PersistentVolumeClaimVolumeSource$clone()`](#method-V1PersistentVolumeClaimVolumeSource-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1PersistentVolumeClaimVolumeSource$new(claim_name = NULL, read_only = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1PersistentVolumeClaimVolumeSource$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1PersistentVolumeClaimVolumeSource$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
