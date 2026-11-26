# V1SubjectRulesReviewStatus

V1SubjectRulesReviewStatus

V1SubjectRulesReviewStatus

## Details

SubjectRulesReviewStatus contains the result of a rules check. This
check can be incomplete depending on the set of authorizers the server
is configured with and any errors experienced during evaluation. Because
authorization rules are additive, if a rule appears in a list it's safe
to assume the subject has that permission, even if that list is
incomplete.

## Methods

### Public methods

- [`V1SubjectRulesReviewStatus$new()`](#method-V1SubjectRulesReviewStatus-new)

- [`V1SubjectRulesReviewStatus$to_list()`](#method-V1SubjectRulesReviewStatus-to_list)

- [`V1SubjectRulesReviewStatus$clone()`](#method-V1SubjectRulesReviewStatus-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1SubjectRulesReviewStatus$new(
      evaluation_error = NULL,
      incomplete = NULL,
      non_resource_rules = NULL,
      resource_rules = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1SubjectRulesReviewStatus$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1SubjectRulesReviewStatus$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
