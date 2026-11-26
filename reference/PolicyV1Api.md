# PolicyV1Api

PolicyV1Api

PolicyV1Api

## Details

Typed Kubernetes API client for the \`PolicyV1\` surface. See generated
methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`PolicyV1Api$new()`](#method-PolicyV1Api-new)

- [`PolicyV1Api$get_api_resources()`](#method-PolicyV1Api-get_api_resources)

- [`PolicyV1Api$list_namespaced_pod_disruption_budget()`](#method-PolicyV1Api-list_namespaced_pod_disruption_budget)

- [`PolicyV1Api$create_namespaced_pod_disruption_budget()`](#method-PolicyV1Api-create_namespaced_pod_disruption_budget)

- [`PolicyV1Api$delete_collection_namespaced_pod_disruption_budget()`](#method-PolicyV1Api-delete_collection_namespaced_pod_disruption_budget)

- [`PolicyV1Api$read_namespaced_pod_disruption_budget()`](#method-PolicyV1Api-read_namespaced_pod_disruption_budget)

- [`PolicyV1Api$replace_namespaced_pod_disruption_budget()`](#method-PolicyV1Api-replace_namespaced_pod_disruption_budget)

- [`PolicyV1Api$patch_namespaced_pod_disruption_budget()`](#method-PolicyV1Api-patch_namespaced_pod_disruption_budget)

- [`PolicyV1Api$delete_namespaced_pod_disruption_budget()`](#method-PolicyV1Api-delete_namespaced_pod_disruption_budget)

- [`PolicyV1Api$read_namespaced_pod_disruption_budget_status()`](#method-PolicyV1Api-read_namespaced_pod_disruption_budget_status)

- [`PolicyV1Api$replace_namespaced_pod_disruption_budget_status()`](#method-PolicyV1Api-replace_namespaced_pod_disruption_budget_status)

- [`PolicyV1Api$patch_namespaced_pod_disruption_budget_status()`](#method-PolicyV1Api-patch_namespaced_pod_disruption_budget_status)

- [`PolicyV1Api$list_pod_disruption_budget_for_all_namespaces()`](#method-PolicyV1Api-list_pod_disruption_budget_for_all_namespaces)

- [`PolicyV1Api$watch_namespaced_pod_disruption_budget_list()`](#method-PolicyV1Api-watch_namespaced_pod_disruption_budget_list)

- [`PolicyV1Api$watch_namespaced_pod_disruption_budget()`](#method-PolicyV1Api-watch_namespaced_pod_disruption_budget)

- [`PolicyV1Api$watch_pod_disruption_budget_list_for_all_namespaces()`](#method-PolicyV1Api-watch_pod_disruption_budget_list_for_all_namespaces)

- [`PolicyV1Api$clone()`](#method-PolicyV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    PolicyV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getPolicyV1APIResources get available resources
  listPolicyV1NamespacedPodDisruptionBudget list or watch objects of
  kind PodDisruptionBudget

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    PolicyV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_namespaced_pod_disruption_budget()`

#### Usage

    PolicyV1Api$list_namespaced_pod_disruption_budget(
      namespace,
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

  = NULL createPolicyV1NamespacedPodDisruptionBudget create a
  PodDisruptionBudget

------------------------------------------------------------------------

### Method `create_namespaced_pod_disruption_budget()`

#### Usage

    PolicyV1Api$create_namespaced_pod_disruption_budget(
      namespace,
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

  = NULL deletePolicyV1CollectionNamespacedPodDisruptionBudget delete
  collection of PodDisruptionBudget

------------------------------------------------------------------------

### Method `delete_collection_namespaced_pod_disruption_budget()`

#### Usage

    PolicyV1Api$delete_collection_namespaced_pod_disruption_budget(
      namespace,
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

  = NULL readPolicyV1NamespacedPodDisruptionBudget read the specified
  PodDisruptionBudget

------------------------------------------------------------------------

### Method `read_namespaced_pod_disruption_budget()`

#### Usage

    PolicyV1Api$read_namespaced_pod_disruption_budget(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replacePolicyV1NamespacedPodDisruptionBudget replace the
  specified PodDisruptionBudget

------------------------------------------------------------------------

### Method `replace_namespaced_pod_disruption_budget()`

#### Usage

    PolicyV1Api$replace_namespaced_pod_disruption_budget(
      name,
      namespace,
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

  = NULL patchPolicyV1NamespacedPodDisruptionBudget partially update the
  specified PodDisruptionBudget

------------------------------------------------------------------------

### Method `patch_namespaced_pod_disruption_budget()`

#### Usage

    PolicyV1Api$patch_namespaced_pod_disruption_budget(
      name,
      namespace,
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
  deletePolicyV1NamespacedPodDisruptionBudget delete a
  PodDisruptionBudget

------------------------------------------------------------------------

### Method `delete_namespaced_pod_disruption_budget()`

#### Usage

    PolicyV1Api$delete_namespaced_pod_disruption_budget(
      name,
      namespace,
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

  = NULL readPolicyV1NamespacedPodDisruptionBudgetStatus read status of
  the specified PodDisruptionBudget

------------------------------------------------------------------------

### Method `read_namespaced_pod_disruption_budget_status()`

#### Usage

    PolicyV1Api$read_namespaced_pod_disruption_budget_status(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replacePolicyV1NamespacedPodDisruptionBudgetStatus replace
  status of the specified PodDisruptionBudget

------------------------------------------------------------------------

### Method `replace_namespaced_pod_disruption_budget_status()`

#### Usage

    PolicyV1Api$replace_namespaced_pod_disruption_budget_status(
      name,
      namespace,
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

  = NULL patchPolicyV1NamespacedPodDisruptionBudgetStatus partially
  update status of the specified PodDisruptionBudget

------------------------------------------------------------------------

### Method `patch_namespaced_pod_disruption_budget_status()`

#### Usage

    PolicyV1Api$patch_namespaced_pod_disruption_budget_status(
      name,
      namespace,
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
  listPolicyV1PodDisruptionBudgetForAllNamespaces list or watch objects
  of kind PodDisruptionBudget

------------------------------------------------------------------------

### Method `list_pod_disruption_budget_for_all_namespaces()`

#### Usage

    PolicyV1Api$list_pod_disruption_budget_for_all_namespaces(
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

  = NULL watchPolicyV1NamespacedPodDisruptionBudgetList watch individual
  changes to a list of PodDisruptionBudget. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_pod_disruption_budget_list()`

#### Usage

    PolicyV1Api$watch_namespaced_pod_disruption_budget_list(
      namespace,
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

  = NULL watchPolicyV1NamespacedPodDisruptionBudget watch changes to an
  object of kind PodDisruptionBudget. deprecated: use the 'watch'
  parameter with a list operation instead, filtered to a single item
  with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_pod_disruption_budget()`

#### Usage

    PolicyV1Api$watch_namespaced_pod_disruption_budget(
      name,
      namespace,
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

  = NULL watchPolicyV1PodDisruptionBudgetListForAllNamespaces watch
  individual changes to a list of PodDisruptionBudget. deprecated: use
  the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_pod_disruption_budget_list_for_all_namespaces()`

#### Usage

    PolicyV1Api$watch_pod_disruption_budget_list_for_all_namespaces(
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

    PolicyV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
