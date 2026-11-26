# AdmissionregistrationV1alpha1Api

AdmissionregistrationV1alpha1Api

AdmissionregistrationV1alpha1Api

## Details

Typed Kubernetes API client for the \`AdmissionregistrationV1alpha1\`
surface. See generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`AdmissionregistrationV1alpha1Api$new()`](#method-AdmissionregistrationV1alpha1Api-new)

- [`AdmissionregistrationV1alpha1Api$get_api_resources()`](#method-AdmissionregistrationV1alpha1Api-get_api_resources)

- [`AdmissionregistrationV1alpha1Api$list_validating_admission_policy()`](#method-AdmissionregistrationV1alpha1Api-list_validating_admission_policy)

- [`AdmissionregistrationV1alpha1Api$create_validating_admission_policy()`](#method-AdmissionregistrationV1alpha1Api-create_validating_admission_policy)

- [`AdmissionregistrationV1alpha1Api$delete_collection_validating_admission_policy()`](#method-AdmissionregistrationV1alpha1Api-delete_collection_validating_admission_policy)

- [`AdmissionregistrationV1alpha1Api$read_validating_admission_policy()`](#method-AdmissionregistrationV1alpha1Api-read_validating_admission_policy)

- [`AdmissionregistrationV1alpha1Api$replace_validating_admission_policy()`](#method-AdmissionregistrationV1alpha1Api-replace_validating_admission_policy)

- [`AdmissionregistrationV1alpha1Api$patch_validating_admission_policy()`](#method-AdmissionregistrationV1alpha1Api-patch_validating_admission_policy)

- [`AdmissionregistrationV1alpha1Api$delete_validating_admission_policy()`](#method-AdmissionregistrationV1alpha1Api-delete_validating_admission_policy)

- [`AdmissionregistrationV1alpha1Api$read_validating_admission_policy_status()`](#method-AdmissionregistrationV1alpha1Api-read_validating_admission_policy_status)

- [`AdmissionregistrationV1alpha1Api$replace_validating_admission_policy_status()`](#method-AdmissionregistrationV1alpha1Api-replace_validating_admission_policy_status)

- [`AdmissionregistrationV1alpha1Api$patch_validating_admission_policy_status()`](#method-AdmissionregistrationV1alpha1Api-patch_validating_admission_policy_status)

- [`AdmissionregistrationV1alpha1Api$list_validating_admission_policy_binding()`](#method-AdmissionregistrationV1alpha1Api-list_validating_admission_policy_binding)

- [`AdmissionregistrationV1alpha1Api$create_validating_admission_policy_binding()`](#method-AdmissionregistrationV1alpha1Api-create_validating_admission_policy_binding)

- [`AdmissionregistrationV1alpha1Api$delete_collection_validating_admission_policy_binding()`](#method-AdmissionregistrationV1alpha1Api-delete_collection_validating_admission_policy_binding)

- [`AdmissionregistrationV1alpha1Api$read_validating_admission_policy_binding()`](#method-AdmissionregistrationV1alpha1Api-read_validating_admission_policy_binding)

- [`AdmissionregistrationV1alpha1Api$replace_validating_admission_policy_binding()`](#method-AdmissionregistrationV1alpha1Api-replace_validating_admission_policy_binding)

- [`AdmissionregistrationV1alpha1Api$patch_validating_admission_policy_binding()`](#method-AdmissionregistrationV1alpha1Api-patch_validating_admission_policy_binding)

- [`AdmissionregistrationV1alpha1Api$delete_validating_admission_policy_binding()`](#method-AdmissionregistrationV1alpha1Api-delete_validating_admission_policy_binding)

- [`AdmissionregistrationV1alpha1Api$watch_validating_admission_policy_list()`](#method-AdmissionregistrationV1alpha1Api-watch_validating_admission_policy_list)

- [`AdmissionregistrationV1alpha1Api$watch_validating_admission_policy()`](#method-AdmissionregistrationV1alpha1Api-watch_validating_admission_policy)

- [`AdmissionregistrationV1alpha1Api$watch_validating_admission_policy_binding_list()`](#method-AdmissionregistrationV1alpha1Api-watch_validating_admission_policy_binding_list)

- [`AdmissionregistrationV1alpha1Api$watch_validating_admission_policy_binding()`](#method-AdmissionregistrationV1alpha1Api-watch_validating_admission_policy_binding)

- [`AdmissionregistrationV1alpha1Api$clone()`](#method-AdmissionregistrationV1alpha1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    AdmissionregistrationV1alpha1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getAdmissionregistrationV1alpha1APIResources get
  available resources
  listAdmissionregistrationV1alpha1ValidatingAdmissionPolicy list or
  watch objects of kind ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    AdmissionregistrationV1alpha1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1alpha1Api$list_validating_admission_policy(
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

  = NULL createAdmissionregistrationV1alpha1ValidatingAdmissionPolicy
  create a ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `create_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1alpha1Api$create_validating_admission_policy(
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

  = NULL
  deleteAdmissionregistrationV1alpha1CollectionValidatingAdmissionPolicy
  delete collection of ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `delete_collection_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1alpha1Api$delete_collection_validating_admission_policy(
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

  = NULL readAdmissionregistrationV1alpha1ValidatingAdmissionPolicy read
  the specified ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `read_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1alpha1Api$read_validating_admission_policy(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceAdmissionregistrationV1alpha1ValidatingAdmissionPolicy
  replace the specified ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `replace_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1alpha1Api$replace_validating_admission_policy(
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

  = NULL patchAdmissionregistrationV1alpha1ValidatingAdmissionPolicy
  partially update the specified ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `patch_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1alpha1Api$patch_validating_admission_policy(
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
  deleteAdmissionregistrationV1alpha1ValidatingAdmissionPolicy delete a
  ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `delete_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1alpha1Api$delete_validating_admission_policy(
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

  = NULL
  readAdmissionregistrationV1alpha1ValidatingAdmissionPolicyStatus read
  status of the specified ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `read_validating_admission_policy_status()`

#### Usage

    AdmissionregistrationV1alpha1Api$read_validating_admission_policy_status(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL
  replaceAdmissionregistrationV1alpha1ValidatingAdmissionPolicyStatus
  replace status of the specified ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `replace_validating_admission_policy_status()`

#### Usage

    AdmissionregistrationV1alpha1Api$replace_validating_admission_policy_status(
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

  = NULL
  patchAdmissionregistrationV1alpha1ValidatingAdmissionPolicyStatus
  partially update status of the specified ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `patch_validating_admission_policy_status()`

#### Usage

    AdmissionregistrationV1alpha1Api$patch_validating_admission_policy_status(
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
  listAdmissionregistrationV1alpha1ValidatingAdmissionPolicyBinding list
  or watch objects of kind ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `list_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1alpha1Api$list_validating_admission_policy_binding(
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

  = NULL
  createAdmissionregistrationV1alpha1ValidatingAdmissionPolicyBinding
  create a ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `create_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1alpha1Api$create_validating_admission_policy_binding(
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

  = NULL
  deleteAdmissionregistrationV1alpha1CollectionValidatingAdmissionPolicyBinding
  delete collection of ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `delete_collection_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1alpha1Api$delete_collection_validating_admission_policy_binding(
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

  = NULL
  readAdmissionregistrationV1alpha1ValidatingAdmissionPolicyBinding read
  the specified ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `read_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1alpha1Api$read_validating_admission_policy_binding(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL
  replaceAdmissionregistrationV1alpha1ValidatingAdmissionPolicyBinding
  replace the specified ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `replace_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1alpha1Api$replace_validating_admission_policy_binding(
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

  = NULL
  patchAdmissionregistrationV1alpha1ValidatingAdmissionPolicyBinding
  partially update the specified ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `patch_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1alpha1Api$patch_validating_admission_policy_binding(
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
  deleteAdmissionregistrationV1alpha1ValidatingAdmissionPolicyBinding
  delete a ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `delete_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1alpha1Api$delete_validating_admission_policy_binding(
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

  = NULL watchAdmissionregistrationV1alpha1ValidatingAdmissionPolicyList
  watch individual changes to a list of ValidatingAdmissionPolicy.
  deprecated: use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_validating_admission_policy_list()`

#### Usage

    AdmissionregistrationV1alpha1Api$watch_validating_admission_policy_list(
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

  = NULL watchAdmissionregistrationV1alpha1ValidatingAdmissionPolicy
  watch changes to an object of kind ValidatingAdmissionPolicy.
  deprecated: use the 'watch' parameter with a list operation instead,
  filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1alpha1Api$watch_validating_admission_policy(
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
  watchAdmissionregistrationV1alpha1ValidatingAdmissionPolicyBindingList
  watch individual changes to a list of
  ValidatingAdmissionPolicyBinding. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_validating_admission_policy_binding_list()`

#### Usage

    AdmissionregistrationV1alpha1Api$watch_validating_admission_policy_binding_list(
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
  watchAdmissionregistrationV1alpha1ValidatingAdmissionPolicyBinding
  watch changes to an object of kind ValidatingAdmissionPolicyBinding.
  deprecated: use the 'watch' parameter with a list operation instead,
  filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1alpha1Api$watch_validating_admission_policy_binding(
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

    AdmissionregistrationV1alpha1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
