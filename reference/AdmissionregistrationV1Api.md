# AdmissionregistrationV1Api

AdmissionregistrationV1Api

AdmissionregistrationV1Api

## Details

Typed Kubernetes API client for the \`AdmissionregistrationV1\` surface.
See generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`AdmissionregistrationV1Api$new()`](#method-AdmissionregistrationV1Api-new)

- [`AdmissionregistrationV1Api$get_api_resources()`](#method-AdmissionregistrationV1Api-get_api_resources)

- [`AdmissionregistrationV1Api$list_mutating_webhook_configuration()`](#method-AdmissionregistrationV1Api-list_mutating_webhook_configuration)

- [`AdmissionregistrationV1Api$create_mutating_webhook_configuration()`](#method-AdmissionregistrationV1Api-create_mutating_webhook_configuration)

- [`AdmissionregistrationV1Api$delete_collection_mutating_webhook_configuration()`](#method-AdmissionregistrationV1Api-delete_collection_mutating_webhook_configuration)

- [`AdmissionregistrationV1Api$read_mutating_webhook_configuration()`](#method-AdmissionregistrationV1Api-read_mutating_webhook_configuration)

- [`AdmissionregistrationV1Api$replace_mutating_webhook_configuration()`](#method-AdmissionregistrationV1Api-replace_mutating_webhook_configuration)

- [`AdmissionregistrationV1Api$patch_mutating_webhook_configuration()`](#method-AdmissionregistrationV1Api-patch_mutating_webhook_configuration)

- [`AdmissionregistrationV1Api$delete_mutating_webhook_configuration()`](#method-AdmissionregistrationV1Api-delete_mutating_webhook_configuration)

- [`AdmissionregistrationV1Api$list_validating_admission_policy()`](#method-AdmissionregistrationV1Api-list_validating_admission_policy)

- [`AdmissionregistrationV1Api$create_validating_admission_policy()`](#method-AdmissionregistrationV1Api-create_validating_admission_policy)

- [`AdmissionregistrationV1Api$delete_collection_validating_admission_policy()`](#method-AdmissionregistrationV1Api-delete_collection_validating_admission_policy)

- [`AdmissionregistrationV1Api$read_validating_admission_policy()`](#method-AdmissionregistrationV1Api-read_validating_admission_policy)

- [`AdmissionregistrationV1Api$replace_validating_admission_policy()`](#method-AdmissionregistrationV1Api-replace_validating_admission_policy)

- [`AdmissionregistrationV1Api$patch_validating_admission_policy()`](#method-AdmissionregistrationV1Api-patch_validating_admission_policy)

- [`AdmissionregistrationV1Api$delete_validating_admission_policy()`](#method-AdmissionregistrationV1Api-delete_validating_admission_policy)

- [`AdmissionregistrationV1Api$read_validating_admission_policy_status()`](#method-AdmissionregistrationV1Api-read_validating_admission_policy_status)

- [`AdmissionregistrationV1Api$replace_validating_admission_policy_status()`](#method-AdmissionregistrationV1Api-replace_validating_admission_policy_status)

- [`AdmissionregistrationV1Api$patch_validating_admission_policy_status()`](#method-AdmissionregistrationV1Api-patch_validating_admission_policy_status)

- [`AdmissionregistrationV1Api$list_validating_admission_policy_binding()`](#method-AdmissionregistrationV1Api-list_validating_admission_policy_binding)

- [`AdmissionregistrationV1Api$create_validating_admission_policy_binding()`](#method-AdmissionregistrationV1Api-create_validating_admission_policy_binding)

- [`AdmissionregistrationV1Api$delete_collection_validating_admission_policy_binding()`](#method-AdmissionregistrationV1Api-delete_collection_validating_admission_policy_binding)

- [`AdmissionregistrationV1Api$read_validating_admission_policy_binding()`](#method-AdmissionregistrationV1Api-read_validating_admission_policy_binding)

- [`AdmissionregistrationV1Api$replace_validating_admission_policy_binding()`](#method-AdmissionregistrationV1Api-replace_validating_admission_policy_binding)

- [`AdmissionregistrationV1Api$patch_validating_admission_policy_binding()`](#method-AdmissionregistrationV1Api-patch_validating_admission_policy_binding)

- [`AdmissionregistrationV1Api$delete_validating_admission_policy_binding()`](#method-AdmissionregistrationV1Api-delete_validating_admission_policy_binding)

- [`AdmissionregistrationV1Api$list_validating_webhook_configuration()`](#method-AdmissionregistrationV1Api-list_validating_webhook_configuration)

- [`AdmissionregistrationV1Api$create_validating_webhook_configuration()`](#method-AdmissionregistrationV1Api-create_validating_webhook_configuration)

- [`AdmissionregistrationV1Api$delete_collection_validating_webhook_configuration()`](#method-AdmissionregistrationV1Api-delete_collection_validating_webhook_configuration)

- [`AdmissionregistrationV1Api$read_validating_webhook_configuration()`](#method-AdmissionregistrationV1Api-read_validating_webhook_configuration)

- [`AdmissionregistrationV1Api$replace_validating_webhook_configuration()`](#method-AdmissionregistrationV1Api-replace_validating_webhook_configuration)

- [`AdmissionregistrationV1Api$patch_validating_webhook_configuration()`](#method-AdmissionregistrationV1Api-patch_validating_webhook_configuration)

- [`AdmissionregistrationV1Api$delete_validating_webhook_configuration()`](#method-AdmissionregistrationV1Api-delete_validating_webhook_configuration)

- [`AdmissionregistrationV1Api$watch_mutating_webhook_configuration_list()`](#method-AdmissionregistrationV1Api-watch_mutating_webhook_configuration_list)

- [`AdmissionregistrationV1Api$watch_mutating_webhook_configuration()`](#method-AdmissionregistrationV1Api-watch_mutating_webhook_configuration)

- [`AdmissionregistrationV1Api$watch_validating_admission_policy_list()`](#method-AdmissionregistrationV1Api-watch_validating_admission_policy_list)

- [`AdmissionregistrationV1Api$watch_validating_admission_policy()`](#method-AdmissionregistrationV1Api-watch_validating_admission_policy)

- [`AdmissionregistrationV1Api$watch_validating_admission_policy_binding_list()`](#method-AdmissionregistrationV1Api-watch_validating_admission_policy_binding_list)

- [`AdmissionregistrationV1Api$watch_validating_admission_policy_binding()`](#method-AdmissionregistrationV1Api-watch_validating_admission_policy_binding)

- [`AdmissionregistrationV1Api$watch_validating_webhook_configuration_list()`](#method-AdmissionregistrationV1Api-watch_validating_webhook_configuration_list)

- [`AdmissionregistrationV1Api$watch_validating_webhook_configuration()`](#method-AdmissionregistrationV1Api-watch_validating_webhook_configuration)

- [`AdmissionregistrationV1Api$clone()`](#method-AdmissionregistrationV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    AdmissionregistrationV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getAdmissionregistrationV1APIResources get available
  resources listAdmissionregistrationV1MutatingWebhookConfiguration list
  or watch objects of kind MutatingWebhookConfiguration

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    AdmissionregistrationV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_mutating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$list_mutating_webhook_configuration(
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

  = NULL createAdmissionregistrationV1MutatingWebhookConfiguration
  create a MutatingWebhookConfiguration

------------------------------------------------------------------------

### Method `create_mutating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$create_mutating_webhook_configuration(
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
  deleteAdmissionregistrationV1CollectionMutatingWebhookConfiguration
  delete collection of MutatingWebhookConfiguration

------------------------------------------------------------------------

### Method `delete_collection_mutating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$delete_collection_mutating_webhook_configuration(
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

  = NULL readAdmissionregistrationV1MutatingWebhookConfiguration read
  the specified MutatingWebhookConfiguration

------------------------------------------------------------------------

### Method `read_mutating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$read_mutating_webhook_configuration(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceAdmissionregistrationV1MutatingWebhookConfiguration
  replace the specified MutatingWebhookConfiguration

------------------------------------------------------------------------

### Method `replace_mutating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$replace_mutating_webhook_configuration(
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

  = NULL patchAdmissionregistrationV1MutatingWebhookConfiguration
  partially update the specified MutatingWebhookConfiguration

------------------------------------------------------------------------

### Method `patch_mutating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$patch_mutating_webhook_configuration(
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
  deleteAdmissionregistrationV1MutatingWebhookConfiguration delete a
  MutatingWebhookConfiguration

------------------------------------------------------------------------

### Method `delete_mutating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$delete_mutating_webhook_configuration(
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

  = NULL listAdmissionregistrationV1ValidatingAdmissionPolicy list or
  watch objects of kind ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `list_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1Api$list_validating_admission_policy(
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

  = NULL createAdmissionregistrationV1ValidatingAdmissionPolicy create a
  ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `create_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1Api$create_validating_admission_policy(
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
  deleteAdmissionregistrationV1CollectionValidatingAdmissionPolicy
  delete collection of ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `delete_collection_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1Api$delete_collection_validating_admission_policy(
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

  = NULL readAdmissionregistrationV1ValidatingAdmissionPolicy read the
  specified ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `read_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1Api$read_validating_admission_policy(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceAdmissionregistrationV1ValidatingAdmissionPolicy replace
  the specified ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `replace_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1Api$replace_validating_admission_policy(
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

  = NULL patchAdmissionregistrationV1ValidatingAdmissionPolicy partially
  update the specified ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `patch_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1Api$patch_validating_admission_policy(
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
  deleteAdmissionregistrationV1ValidatingAdmissionPolicy delete a
  ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `delete_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1Api$delete_validating_admission_policy(
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

  = NULL readAdmissionregistrationV1ValidatingAdmissionPolicyStatus read
  status of the specified ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `read_validating_admission_policy_status()`

#### Usage

    AdmissionregistrationV1Api$read_validating_admission_policy_status(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceAdmissionregistrationV1ValidatingAdmissionPolicyStatus
  replace status of the specified ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `replace_validating_admission_policy_status()`

#### Usage

    AdmissionregistrationV1Api$replace_validating_admission_policy_status(
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

  = NULL patchAdmissionregistrationV1ValidatingAdmissionPolicyStatus
  partially update status of the specified ValidatingAdmissionPolicy

------------------------------------------------------------------------

### Method `patch_validating_admission_policy_status()`

#### Usage

    AdmissionregistrationV1Api$patch_validating_admission_policy_status(
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
  listAdmissionregistrationV1ValidatingAdmissionPolicyBinding list or
  watch objects of kind ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `list_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1Api$list_validating_admission_policy_binding(
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

  = NULL createAdmissionregistrationV1ValidatingAdmissionPolicyBinding
  create a ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `create_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1Api$create_validating_admission_policy_binding(
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
  deleteAdmissionregistrationV1CollectionValidatingAdmissionPolicyBinding
  delete collection of ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `delete_collection_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1Api$delete_collection_validating_admission_policy_binding(
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

  = NULL readAdmissionregistrationV1ValidatingAdmissionPolicyBinding
  read the specified ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `read_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1Api$read_validating_admission_policy_binding(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceAdmissionregistrationV1ValidatingAdmissionPolicyBinding
  replace the specified ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `replace_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1Api$replace_validating_admission_policy_binding(
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

  = NULL patchAdmissionregistrationV1ValidatingAdmissionPolicyBinding
  partially update the specified ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `patch_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1Api$patch_validating_admission_policy_binding(
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
  deleteAdmissionregistrationV1ValidatingAdmissionPolicyBinding delete a
  ValidatingAdmissionPolicyBinding

------------------------------------------------------------------------

### Method `delete_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1Api$delete_validating_admission_policy_binding(
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

  = NULL listAdmissionregistrationV1ValidatingWebhookConfiguration list
  or watch objects of kind ValidatingWebhookConfiguration

------------------------------------------------------------------------

### Method `list_validating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$list_validating_webhook_configuration(
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

  = NULL createAdmissionregistrationV1ValidatingWebhookConfiguration
  create a ValidatingWebhookConfiguration

------------------------------------------------------------------------

### Method `create_validating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$create_validating_webhook_configuration(
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
  deleteAdmissionregistrationV1CollectionValidatingWebhookConfiguration
  delete collection of ValidatingWebhookConfiguration

------------------------------------------------------------------------

### Method `delete_collection_validating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$delete_collection_validating_webhook_configuration(
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

  = NULL readAdmissionregistrationV1ValidatingWebhookConfiguration read
  the specified ValidatingWebhookConfiguration

------------------------------------------------------------------------

### Method `read_validating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$read_validating_webhook_configuration(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceAdmissionregistrationV1ValidatingWebhookConfiguration
  replace the specified ValidatingWebhookConfiguration

------------------------------------------------------------------------

### Method `replace_validating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$replace_validating_webhook_configuration(
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

  = NULL patchAdmissionregistrationV1ValidatingWebhookConfiguration
  partially update the specified ValidatingWebhookConfiguration

------------------------------------------------------------------------

### Method `patch_validating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$patch_validating_webhook_configuration(
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
  deleteAdmissionregistrationV1ValidatingWebhookConfiguration delete a
  ValidatingWebhookConfiguration

------------------------------------------------------------------------

### Method `delete_validating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$delete_validating_webhook_configuration(
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

  = NULL watchAdmissionregistrationV1MutatingWebhookConfigurationList
  watch individual changes to a list of MutatingWebhookConfiguration.
  deprecated: use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_mutating_webhook_configuration_list()`

#### Usage

    AdmissionregistrationV1Api$watch_mutating_webhook_configuration_list(
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

  = NULL watchAdmissionregistrationV1MutatingWebhookConfiguration watch
  changes to an object of kind MutatingWebhookConfiguration. deprecated:
  use the 'watch' parameter with a list operation instead, filtered to a
  single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_mutating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$watch_mutating_webhook_configuration(
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

  = NULL watchAdmissionregistrationV1ValidatingAdmissionPolicyList watch
  individual changes to a list of ValidatingAdmissionPolicy. deprecated:
  use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_validating_admission_policy_list()`

#### Usage

    AdmissionregistrationV1Api$watch_validating_admission_policy_list(
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

  = NULL watchAdmissionregistrationV1ValidatingAdmissionPolicy watch
  changes to an object of kind ValidatingAdmissionPolicy. deprecated:
  use the 'watch' parameter with a list operation instead, filtered to a
  single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_validating_admission_policy()`

#### Usage

    AdmissionregistrationV1Api$watch_validating_admission_policy(
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
  watchAdmissionregistrationV1ValidatingAdmissionPolicyBindingList watch
  individual changes to a list of ValidatingAdmissionPolicyBinding.
  deprecated: use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_validating_admission_policy_binding_list()`

#### Usage

    AdmissionregistrationV1Api$watch_validating_admission_policy_binding_list(
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

  = NULL watchAdmissionregistrationV1ValidatingAdmissionPolicyBinding
  watch changes to an object of kind ValidatingAdmissionPolicyBinding.
  deprecated: use the 'watch' parameter with a list operation instead,
  filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_validating_admission_policy_binding()`

#### Usage

    AdmissionregistrationV1Api$watch_validating_admission_policy_binding(
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

  = NULL watchAdmissionregistrationV1ValidatingWebhookConfigurationList
  watch individual changes to a list of ValidatingWebhookConfiguration.
  deprecated: use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_validating_webhook_configuration_list()`

#### Usage

    AdmissionregistrationV1Api$watch_validating_webhook_configuration_list(
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

  = NULL watchAdmissionregistrationV1ValidatingWebhookConfiguration
  watch changes to an object of kind ValidatingWebhookConfiguration.
  deprecated: use the 'watch' parameter with a list operation instead,
  filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_validating_webhook_configuration()`

#### Usage

    AdmissionregistrationV1Api$watch_validating_webhook_configuration(
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

    AdmissionregistrationV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
