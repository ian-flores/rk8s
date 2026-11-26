# V1beta3PolicyRulesWithSubjects

V1beta3PolicyRulesWithSubjects

V1beta3PolicyRulesWithSubjects

## Details

PolicyRulesWithSubjects prescribes a test that applies to a request to
an apiserver. The test considers the subject making the request, the
verb being requested, and the resource to be acted upon. This
PolicyRulesWithSubjects matches a request if and only if both (a) at
least one member of subjects matches the request and (b) at least one
member of resourceRules or nonResourceRules matches the request.

## Methods

### Public methods

- [`V1beta3PolicyRulesWithSubjects$new()`](#method-V1beta3PolicyRulesWithSubjects-new)

- [`V1beta3PolicyRulesWithSubjects$to_list()`](#method-V1beta3PolicyRulesWithSubjects-to_list)

- [`V1beta3PolicyRulesWithSubjects$clone()`](#method-V1beta3PolicyRulesWithSubjects-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1beta3PolicyRulesWithSubjects$new(
      non_resource_rules = NULL,
      resource_rules = NULL,
      subjects = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1beta3PolicyRulesWithSubjects$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1beta3PolicyRulesWithSubjects$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
