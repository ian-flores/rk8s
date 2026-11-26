# AuthenticationV1Api

AuthenticationV1Api

AuthenticationV1Api

## Details

Typed Kubernetes API client for the \`AuthenticationV1\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`AuthenticationV1Api$new()`](#method-AuthenticationV1Api-new)

- [`AuthenticationV1Api$get_api_resources()`](#method-AuthenticationV1Api-get_api_resources)

- [`AuthenticationV1Api$create_self_subject_review()`](#method-AuthenticationV1Api-create_self_subject_review)

- [`AuthenticationV1Api$create_token_review()`](#method-AuthenticationV1Api-create_token_review)

- [`AuthenticationV1Api$clone()`](#method-AuthenticationV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    AuthenticationV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getAuthenticationV1APIResources get available
  resources createAuthenticationV1SelfSubjectReview create a
  SelfSubjectReview

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    AuthenticationV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `create_self_subject_review()`

#### Usage

    AuthenticationV1Api$create_self_subject_review(
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

  = NULL createAuthenticationV1TokenReview create a TokenReview

------------------------------------------------------------------------

### Method `create_token_review()`

#### Usage

    AuthenticationV1Api$create_token_review(
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

    AuthenticationV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
