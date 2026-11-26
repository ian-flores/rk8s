# AuthenticationV1alpha1Api

AuthenticationV1alpha1Api

AuthenticationV1alpha1Api

## Details

Typed Kubernetes API client for the \`AuthenticationV1alpha1\` surface.
See generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`AuthenticationV1alpha1Api$new()`](#method-AuthenticationV1alpha1Api-new)

- [`AuthenticationV1alpha1Api$get_api_resources()`](#method-AuthenticationV1alpha1Api-get_api_resources)

- [`AuthenticationV1alpha1Api$create_self_subject_review()`](#method-AuthenticationV1alpha1Api-create_self_subject_review)

- [`AuthenticationV1alpha1Api$clone()`](#method-AuthenticationV1alpha1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    AuthenticationV1alpha1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getAuthenticationV1alpha1APIResources get available
  resources createAuthenticationV1alpha1SelfSubjectReview create a
  SelfSubjectReview

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    AuthenticationV1alpha1Api$get_api_resources()

------------------------------------------------------------------------

### Method `create_self_subject_review()`

#### Usage

    AuthenticationV1alpha1Api$create_self_subject_review(
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

    AuthenticationV1alpha1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
