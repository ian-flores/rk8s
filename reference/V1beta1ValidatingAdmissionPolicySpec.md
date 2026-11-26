# V1beta1ValidatingAdmissionPolicySpec

V1beta1ValidatingAdmissionPolicySpec

V1beta1ValidatingAdmissionPolicySpec

## Details

ValidatingAdmissionPolicySpec is the specification of the desired
behavior of the AdmissionPolicy.

## Methods

### Public methods

- [`V1beta1ValidatingAdmissionPolicySpec$new()`](#method-V1beta1ValidatingAdmissionPolicySpec-new)

- [`V1beta1ValidatingAdmissionPolicySpec$to_list()`](#method-V1beta1ValidatingAdmissionPolicySpec-to_list)

- [`V1beta1ValidatingAdmissionPolicySpec$clone()`](#method-V1beta1ValidatingAdmissionPolicySpec-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1beta1ValidatingAdmissionPolicySpec$new(
      audit_annotations = NULL,
      failure_policy = NULL,
      match_conditions = NULL,
      match_constraints = NULL,
      param_kind = NULL,
      validations = NULL,
      variables = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1beta1ValidatingAdmissionPolicySpec$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1beta1ValidatingAdmissionPolicySpec$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
