# V1SelfSubjectRulesReview

V1SelfSubjectRulesReview

V1SelfSubjectRulesReview

## Details

SelfSubjectRulesReview enumerates the set of actions the current user
can perform within a namespace. The returned list of actions may be
incomplete depending on the server's authorization mode, and any errors
experienced during the evaluation. SelfSubjectRulesReview should be used
by UIs to show/hide actions, or to quickly let an end user reason about
their permissions. It should NOT Be used by external systems to drive
authorization decisions as this raises confused deputy, cache
lifetime/revocation, and correctness concerns. SubjectAccessReview, and
LocalAccessReview are the correct way to defer authorization decisions
to the API server.

## Methods

### Public methods

- [`V1SelfSubjectRulesReview$new()`](#method-V1SelfSubjectRulesReview-new)

- [`V1SelfSubjectRulesReview$to_list()`](#method-V1SelfSubjectRulesReview-to_list)

- [`V1SelfSubjectRulesReview$clone()`](#method-V1SelfSubjectRulesReview-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1SelfSubjectRulesReview$new(
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

    V1SelfSubjectRulesReview$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1SelfSubjectRulesReview$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
