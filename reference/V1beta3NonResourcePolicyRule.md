# V1beta3NonResourcePolicyRule

V1beta3NonResourcePolicyRule

V1beta3NonResourcePolicyRule

## Details

NonResourcePolicyRule is a predicate that matches non-resource requests
according to their verb and the target non-resource URL. A
NonResourcePolicyRule matches a request if and only if both (a) at least
one member of verbs matches the request and (b) at least one member of
nonResourceURLs matches the request.

## Methods

### Public methods

- [`V1beta3NonResourcePolicyRule$new()`](#method-V1beta3NonResourcePolicyRule-new)

- [`V1beta3NonResourcePolicyRule$to_list()`](#method-V1beta3NonResourcePolicyRule-to_list)

- [`V1beta3NonResourcePolicyRule$clone()`](#method-V1beta3NonResourcePolicyRule-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1beta3NonResourcePolicyRule$new(non_resource_ur_ls = NULL, verbs = NULL)

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1beta3NonResourcePolicyRule$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1beta3NonResourcePolicyRule$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
