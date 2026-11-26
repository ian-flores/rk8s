# V1StatefulSetSpec

V1StatefulSetSpec

V1StatefulSetSpec

## Details

A StatefulSetSpec is the specification of a StatefulSet.

## Methods

### Public methods

- [`V1StatefulSetSpec$new()`](#method-V1StatefulSetSpec-new)

- [`V1StatefulSetSpec$to_list()`](#method-V1StatefulSetSpec-to_list)

- [`V1StatefulSetSpec$clone()`](#method-V1StatefulSetSpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1StatefulSetSpec$new(
      min_ready_seconds = NULL,
      ordinals = NULL,
      persistent_volume_claim_retention_policy = NULL,
      pod_management_policy = NULL,
      replicas = NULL,
      revision_history_limit = NULL,
      selector = NULL,
      service_name = NULL,
      template = NULL,
      update_strategy = NULL,
      volume_claim_templates = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1StatefulSetSpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1StatefulSetSpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
