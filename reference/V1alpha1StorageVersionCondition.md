# V1alpha1StorageVersionCondition

V1alpha1StorageVersionCondition

V1alpha1StorageVersionCondition

## Details

Describes the state of the storageVersion at a certain point.

## Methods

### Public methods

- [`V1alpha1StorageVersionCondition$new()`](#method-V1alpha1StorageVersionCondition-new)

- [`V1alpha1StorageVersionCondition$to_list()`](#method-V1alpha1StorageVersionCondition-to_list)

- [`V1alpha1StorageVersionCondition$clone()`](#method-V1alpha1StorageVersionCondition-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha1StorageVersionCondition$new(
      last_transition_time = NULL,
      message = NULL,
      observed_generation = NULL,
      reason = NULL,
      status = NULL,
      type = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha1StorageVersionCondition$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha1StorageVersionCondition$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
