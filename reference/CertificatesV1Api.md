# CertificatesV1Api

CertificatesV1Api

CertificatesV1Api

## Details

Typed Kubernetes API client for the \`CertificatesV1\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`CertificatesV1Api$new()`](#method-CertificatesV1Api-new)

- [`CertificatesV1Api$get_api_resources()`](#method-CertificatesV1Api-get_api_resources)

- [`CertificatesV1Api$list_certificate_signing_request()`](#method-CertificatesV1Api-list_certificate_signing_request)

- [`CertificatesV1Api$create_certificate_signing_request()`](#method-CertificatesV1Api-create_certificate_signing_request)

- [`CertificatesV1Api$delete_collection_certificate_signing_request()`](#method-CertificatesV1Api-delete_collection_certificate_signing_request)

- [`CertificatesV1Api$read_certificate_signing_request()`](#method-CertificatesV1Api-read_certificate_signing_request)

- [`CertificatesV1Api$replace_certificate_signing_request()`](#method-CertificatesV1Api-replace_certificate_signing_request)

- [`CertificatesV1Api$patch_certificate_signing_request()`](#method-CertificatesV1Api-patch_certificate_signing_request)

- [`CertificatesV1Api$delete_certificate_signing_request()`](#method-CertificatesV1Api-delete_certificate_signing_request)

- [`CertificatesV1Api$read_certificate_signing_request_approval()`](#method-CertificatesV1Api-read_certificate_signing_request_approval)

- [`CertificatesV1Api$replace_certificate_signing_request_approval()`](#method-CertificatesV1Api-replace_certificate_signing_request_approval)

- [`CertificatesV1Api$patch_certificate_signing_request_approval()`](#method-CertificatesV1Api-patch_certificate_signing_request_approval)

- [`CertificatesV1Api$read_certificate_signing_request_status()`](#method-CertificatesV1Api-read_certificate_signing_request_status)

- [`CertificatesV1Api$replace_certificate_signing_request_status()`](#method-CertificatesV1Api-replace_certificate_signing_request_status)

- [`CertificatesV1Api$patch_certificate_signing_request_status()`](#method-CertificatesV1Api-patch_certificate_signing_request_status)

- [`CertificatesV1Api$watch_certificate_signing_request_list()`](#method-CertificatesV1Api-watch_certificate_signing_request_list)

- [`CertificatesV1Api$watch_certificate_signing_request()`](#method-CertificatesV1Api-watch_certificate_signing_request)

- [`CertificatesV1Api$clone()`](#method-CertificatesV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    CertificatesV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getCertificatesV1APIResources get available
  resources listCertificatesV1CertificateSigningRequest list or watch
  objects of kind CertificateSigningRequest

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    CertificatesV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_certificate_signing_request()`

#### Usage

    CertificatesV1Api$list_certificate_signing_request(
      pretty = NULL,
      allow_watch_bookmarks = NULL,
      continue = NULL,
      field_selector = NULL,
      label_selector = NULL,
      limit = NULL,
      resource_version = NULL,
      resource_version_match = NULL,
      send_initial_events = NULL,
      timeout_seconds = NULL,
      watch = NULL
    )

#### Arguments

- `pretty`:

  = NULL

- `allow_watch_bookmarks`:

  = NULL

- `continue`:

  = NULL

- `field_selector`:

  = NULL

- `label_selector`:

  = NULL

- `limit`:

  = NULL

- `resource_version`:

  = NULL

- `resource_version_match`:

  = NULL

- `send_initial_events`:

  = NULL

- `timeout_seconds`:

  = NULL

- `watch`:

  = NULL createCertificatesV1CertificateSigningRequest create a
  CertificateSigningRequest

------------------------------------------------------------------------

### Method `create_certificate_signing_request()`

#### Usage

    CertificatesV1Api$create_certificate_signing_request(
      body,
      pretty = NULL,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL
    )

#### Arguments

- `pretty`:

  = NULL

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL deleteCertificatesV1CollectionCertificateSigningRequest delete
  collection of CertificateSigningRequest

------------------------------------------------------------------------

### Method `delete_collection_certificate_signing_request()`

#### Usage

    CertificatesV1Api$delete_collection_certificate_signing_request(
      pretty = NULL,
      continue = NULL,
      dry_run = NULL,
      field_selector = NULL,
      grace_period_seconds = NULL,
      label_selector = NULL,
      limit = NULL,
      orphan_dependents = NULL,
      propagation_policy = NULL,
      resource_version = NULL,
      resource_version_match = NULL,
      send_initial_events = NULL,
      timeout_seconds = NULL,
      body = NULL
    )

#### Arguments

- `pretty`:

  = NULL

- `continue`:

  = NULL

- `dry_run`:

  = NULL

- `field_selector`:

  = NULL

- `grace_period_seconds`:

  = NULL

- `label_selector`:

  = NULL

- `limit`:

  = NULL

- `orphan_dependents`:

  = NULL

- `propagation_policy`:

  = NULL

- `resource_version`:

  = NULL

- `resource_version_match`:

  = NULL

- `send_initial_events`:

  = NULL

- `timeout_seconds`:

  = NULL

- `body`:

  = NULL readCertificatesV1CertificateSigningRequest read the specified
  CertificateSigningRequest

------------------------------------------------------------------------

### Method `read_certificate_signing_request()`

#### Usage

    CertificatesV1Api$read_certificate_signing_request(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCertificatesV1CertificateSigningRequest replace the
  specified CertificateSigningRequest

------------------------------------------------------------------------

### Method `replace_certificate_signing_request()`

#### Usage

    CertificatesV1Api$replace_certificate_signing_request(
      name,
      body,
      pretty = NULL,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL
    )

#### Arguments

- `pretty`:

  = NULL

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL patchCertificatesV1CertificateSigningRequest partially update
  the specified CertificateSigningRequest

------------------------------------------------------------------------

### Method `patch_certificate_signing_request()`

#### Usage

    CertificatesV1Api$patch_certificate_signing_request(
      name,
      body,
      pretty = NULL,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL,
      force = NULL,
      content_type = "application/json-patch+json"
    )

#### Arguments

- `pretty`:

  = NULL

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL

- `force`:

  = NULL

- `content_type`:

  = "application/json-patch+json"
  deleteCertificatesV1CertificateSigningRequest delete a
  CertificateSigningRequest

------------------------------------------------------------------------

### Method `delete_certificate_signing_request()`

#### Usage

    CertificatesV1Api$delete_certificate_signing_request(
      name,
      pretty = NULL,
      dry_run = NULL,
      grace_period_seconds = NULL,
      orphan_dependents = NULL,
      propagation_policy = NULL,
      body = NULL
    )

#### Arguments

- `pretty`:

  = NULL

- `dry_run`:

  = NULL

- `grace_period_seconds`:

  = NULL

- `orphan_dependents`:

  = NULL

- `propagation_policy`:

  = NULL

- `body`:

  = NULL readCertificatesV1CertificateSigningRequestApproval read
  approval of the specified CertificateSigningRequest

------------------------------------------------------------------------

### Method `read_certificate_signing_request_approval()`

#### Usage

    CertificatesV1Api$read_certificate_signing_request_approval(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceCertificatesV1CertificateSigningRequestApproval replace
  approval of the specified CertificateSigningRequest

------------------------------------------------------------------------

### Method `replace_certificate_signing_request_approval()`

#### Usage

    CertificatesV1Api$replace_certificate_signing_request_approval(
      name,
      body,
      pretty = NULL,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL
    )

#### Arguments

- `pretty`:

  = NULL

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL patchCertificatesV1CertificateSigningRequestApproval partially
  update approval of the specified CertificateSigningRequest

------------------------------------------------------------------------

### Method `patch_certificate_signing_request_approval()`

#### Usage

    CertificatesV1Api$patch_certificate_signing_request_approval(
      name,
      body,
      pretty = NULL,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL,
      force = NULL,
      content_type = "application/json-patch+json"
    )

#### Arguments

- `pretty`:

  = NULL

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL

- `force`:

  = NULL

- `content_type`:

  = "application/json-patch+json"
  readCertificatesV1CertificateSigningRequestStatus read status of the
  specified CertificateSigningRequest

------------------------------------------------------------------------

### Method `read_certificate_signing_request_status()`

#### Usage

    CertificatesV1Api$read_certificate_signing_request_status(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCertificatesV1CertificateSigningRequestStatus replace
  status of the specified CertificateSigningRequest

------------------------------------------------------------------------

### Method `replace_certificate_signing_request_status()`

#### Usage

    CertificatesV1Api$replace_certificate_signing_request_status(
      name,
      body,
      pretty = NULL,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL
    )

#### Arguments

- `pretty`:

  = NULL

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL patchCertificatesV1CertificateSigningRequestStatus partially
  update status of the specified CertificateSigningRequest

------------------------------------------------------------------------

### Method `patch_certificate_signing_request_status()`

#### Usage

    CertificatesV1Api$patch_certificate_signing_request_status(
      name,
      body,
      pretty = NULL,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL,
      force = NULL,
      content_type = "application/json-patch+json"
    )

#### Arguments

- `pretty`:

  = NULL

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL

- `force`:

  = NULL

- `content_type`:

  = "application/json-patch+json"
  watchCertificatesV1CertificateSigningRequestList watch individual
  changes to a list of CertificateSigningRequest. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_certificate_signing_request_list()`

#### Usage

    CertificatesV1Api$watch_certificate_signing_request_list(
      allow_watch_bookmarks = NULL,
      continue = NULL,
      field_selector = NULL,
      label_selector = NULL,
      limit = NULL,
      pretty = NULL,
      resource_version = NULL,
      resource_version_match = NULL,
      send_initial_events = NULL,
      timeout_seconds = NULL,
      watch = NULL
    )

#### Arguments

- `allow_watch_bookmarks`:

  = NULL

- `continue`:

  = NULL

- `field_selector`:

  = NULL

- `label_selector`:

  = NULL

- `limit`:

  = NULL

- `pretty`:

  = NULL

- `resource_version`:

  = NULL

- `resource_version_match`:

  = NULL

- `send_initial_events`:

  = NULL

- `timeout_seconds`:

  = NULL

- `watch`:

  = NULL watchCertificatesV1CertificateSigningRequest watch changes to
  an object of kind CertificateSigningRequest. deprecated: use the
  'watch' parameter with a list operation instead, filtered to a single
  item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_certificate_signing_request()`

#### Usage

    CertificatesV1Api$watch_certificate_signing_request(
      name,
      allow_watch_bookmarks = NULL,
      continue = NULL,
      field_selector = NULL,
      label_selector = NULL,
      limit = NULL,
      pretty = NULL,
      resource_version = NULL,
      resource_version_match = NULL,
      send_initial_events = NULL,
      timeout_seconds = NULL,
      watch = NULL
    )

#### Arguments

- `allow_watch_bookmarks`:

  = NULL

- `continue`:

  = NULL

- `field_selector`:

  = NULL

- `label_selector`:

  = NULL

- `limit`:

  = NULL

- `pretty`:

  = NULL

- `resource_version`:

  = NULL

- `resource_version_match`:

  = NULL

- `send_initial_events`:

  = NULL

- `timeout_seconds`:

  = NULL

- `watch`:

  = NULL

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    CertificatesV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
