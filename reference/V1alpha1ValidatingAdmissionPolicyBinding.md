# V1alpha1ValidatingAdmissionPolicyBinding

V1alpha1ValidatingAdmissionPolicyBinding

V1alpha1ValidatingAdmissionPolicyBinding

## Details

ValidatingAdmissionPolicyBinding binds the ValidatingAdmissionPolicy
with paramerized resources. ValidatingAdmissionPolicyBinding and
parameter CRDs together define how cluster administrators configure
policies for clusters.

For a given admission request, each binding will cause its policy to be
evaluated N times, where N is 1 for policies/bindings that don't use
params, otherwise N is the number of parameters selected by the binding.

The CEL expressions of a policy must have a computed CEL cost below the
maximum CEL budget. Each evaluation of the policy is given an
independent CEL cost budget. Adding/removing policies, bindings, or
params can not affect whether a given (policy, binding, param)
combination is within its own CEL budget.

## Methods

### Public methods

- [`V1alpha1ValidatingAdmissionPolicyBinding$new()`](#method-V1alpha1ValidatingAdmissionPolicyBinding-new)

- [`V1alpha1ValidatingAdmissionPolicyBinding$to_list()`](#method-V1alpha1ValidatingAdmissionPolicyBinding-to_list)

- [`V1alpha1ValidatingAdmissionPolicyBinding$clone()`](#method-V1alpha1ValidatingAdmissionPolicyBinding-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1alpha1ValidatingAdmissionPolicyBinding$new(
      api_version = NULL,
      kind = NULL,
      metadata = NULL,
      spec = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1alpha1ValidatingAdmissionPolicyBinding$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1alpha1ValidatingAdmissionPolicyBinding$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
