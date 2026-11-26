# V1ResourcePolicyRule

V1ResourcePolicyRule

V1ResourcePolicyRule

## Details

ResourcePolicyRule is a predicate that matches some resource requests,
testing the request's verb and the target resource. A ResourcePolicyRule
matches a resource request if and only if: (a) at least one member of
verbs matches the request, (b) at least one member of apiGroups matches
the request, (c) at least one member of resources matches the request,
and (d) either (d1) the request does not specify a namespace (i.e.,
\`Namespace==""\`) and clusterScope is true or (d2) the request
specifies a namespace and least one member of namespaces matches the
request's namespace.

## Methods

### Public methods

- [`V1ResourcePolicyRule$new()`](#method-V1ResourcePolicyRule-new)

- [`V1ResourcePolicyRule$to_list()`](#method-V1ResourcePolicyRule-to_list)

- [`V1ResourcePolicyRule$clone()`](#method-V1ResourcePolicyRule-clone)

------------------------------------------------------------------------

### Method `new()`

Construct.

#### Usage

    V1ResourcePolicyRule$new(
      api_groups = NULL,
      cluster_scope = NULL,
      namespaces = NULL,
      resources = NULL,
      verbs = NULL
    )

------------------------------------------------------------------------

### Method `to_list()`

Convert to a plain named list (JSON keys).

#### Usage

    V1ResourcePolicyRule$to_list()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    V1ResourcePolicyRule$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
