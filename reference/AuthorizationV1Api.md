# AuthorizationV1Api

AuthorizationV1Api

AuthorizationV1Api

## Details

Typed Kubernetes API client for the \`AuthorizationV1\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`AuthorizationV1Api$new()`](#method-AuthorizationV1Api-new)

- [`AuthorizationV1Api$get_api_resources()`](#method-AuthorizationV1Api-get_api_resources)

- [`AuthorizationV1Api$create_namespaced_local_subject_access_review()`](#method-AuthorizationV1Api-create_namespaced_local_subject_access_review)

- [`AuthorizationV1Api$create_self_subject_access_review()`](#method-AuthorizationV1Api-create_self_subject_access_review)

- [`AuthorizationV1Api$create_self_subject_rules_review()`](#method-AuthorizationV1Api-create_self_subject_rules_review)

- [`AuthorizationV1Api$create_subject_access_review()`](#method-AuthorizationV1Api-create_subject_access_review)

- [`AuthorizationV1Api$clone()`](#method-AuthorizationV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    AuthorizationV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getAuthorizationV1APIResources get available
  resources createAuthorizationV1NamespacedLocalSubjectAccessReview
  create a LocalSubjectAccessReview

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    AuthorizationV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `create_namespaced_local_subject_access_review()`

#### Usage

    AuthorizationV1Api$create_namespaced_local_subject_access_review(
      namespace,
      body,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL,
      pretty = NULL
    )

#### Arguments

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL

- `pretty`:

  = NULL createAuthorizationV1SelfSubjectAccessReview create a
  SelfSubjectAccessReview

------------------------------------------------------------------------

### Method `create_self_subject_access_review()`

#### Usage

    AuthorizationV1Api$create_self_subject_access_review(
      body,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL,
      pretty = NULL
    )

#### Arguments

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL

- `pretty`:

  = NULL createAuthorizationV1SelfSubjectRulesReview create a
  SelfSubjectRulesReview

------------------------------------------------------------------------

### Method `create_self_subject_rules_review()`

#### Usage

    AuthorizationV1Api$create_self_subject_rules_review(
      body,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL,
      pretty = NULL
    )

#### Arguments

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL

- `pretty`:

  = NULL createAuthorizationV1SubjectAccessReview create a
  SubjectAccessReview

------------------------------------------------------------------------

### Method `create_subject_access_review()`

#### Usage

    AuthorizationV1Api$create_subject_access_review(
      body,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL,
      pretty = NULL
    )

#### Arguments

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL

- `pretty`:

  = NULL

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    AuthorizationV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
