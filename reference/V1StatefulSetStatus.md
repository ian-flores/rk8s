# V1StatefulSetStatus

V1StatefulSetStatus

V1StatefulSetStatus

## Details

StatefulSetStatus represents the current state of a StatefulSet.

## Methods

### Public methods

- [`V1StatefulSetStatus$new()`](#method-V1StatefulSetStatus-new)

- [`V1StatefulSetStatus$to_list()`](#method-V1StatefulSetStatus-to_list)

- [`V1StatefulSetStatus$clone()`](#method-V1StatefulSetStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1StatefulSetStatus$new(
      available_replicas = NULL,
      collision_count = NULL,
      conditions = NULL,
      current_replicas = NULL,
      current_revision = NULL,
      observed_generation = NULL,
      ready_replicas = NULL,
      replicas = NULL,
      update_revision = NULL,
      updated_replicas = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1StatefulSetStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1StatefulSetStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
