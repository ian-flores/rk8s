# CoordinationV1alpha1Api

CoordinationV1alpha1Api

CoordinationV1alpha1Api

## Details

Typed Kubernetes API client for the \`CoordinationV1alpha1\` surface.
See generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`CoordinationV1alpha1Api$new()`](#method-CoordinationV1alpha1Api-new)

- [`CoordinationV1alpha1Api$get_api_resources()`](#method-CoordinationV1alpha1Api-get_api_resources)

- [`CoordinationV1alpha1Api$list_lease_candidate_for_all_namespaces()`](#method-CoordinationV1alpha1Api-list_lease_candidate_for_all_namespaces)

- [`CoordinationV1alpha1Api$list_namespaced_lease_candidate()`](#method-CoordinationV1alpha1Api-list_namespaced_lease_candidate)

- [`CoordinationV1alpha1Api$create_namespaced_lease_candidate()`](#method-CoordinationV1alpha1Api-create_namespaced_lease_candidate)

- [`CoordinationV1alpha1Api$delete_collection_namespaced_lease_candidate()`](#method-CoordinationV1alpha1Api-delete_collection_namespaced_lease_candidate)

- [`CoordinationV1alpha1Api$read_namespaced_lease_candidate()`](#method-CoordinationV1alpha1Api-read_namespaced_lease_candidate)

- [`CoordinationV1alpha1Api$replace_namespaced_lease_candidate()`](#method-CoordinationV1alpha1Api-replace_namespaced_lease_candidate)

- [`CoordinationV1alpha1Api$patch_namespaced_lease_candidate()`](#method-CoordinationV1alpha1Api-patch_namespaced_lease_candidate)

- [`CoordinationV1alpha1Api$delete_namespaced_lease_candidate()`](#method-CoordinationV1alpha1Api-delete_namespaced_lease_candidate)

- [`CoordinationV1alpha1Api$watch_lease_candidate_list_for_all_namespaces()`](#method-CoordinationV1alpha1Api-watch_lease_candidate_list_for_all_namespaces)

- [`CoordinationV1alpha1Api$watch_namespaced_lease_candidate_list()`](#method-CoordinationV1alpha1Api-watch_namespaced_lease_candidate_list)

- [`CoordinationV1alpha1Api$watch_namespaced_lease_candidate()`](#method-CoordinationV1alpha1Api-watch_namespaced_lease_candidate)

- [`CoordinationV1alpha1Api$clone()`](#method-CoordinationV1alpha1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    CoordinationV1alpha1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getCoordinationV1alpha1APIResources get available
  resources listCoordinationV1alpha1LeaseCandidateForAllNamespaces list
  or watch objects of kind LeaseCandidate

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    CoordinationV1alpha1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_lease_candidate_for_all_namespaces()`

#### Usage

    CoordinationV1alpha1Api$list_lease_candidate_for_all_namespaces(
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

  = NULL listCoordinationV1alpha1NamespacedLeaseCandidate list or watch
  objects of kind LeaseCandidate

------------------------------------------------------------------------

### Method `list_namespaced_lease_candidate()`

#### Usage

    CoordinationV1alpha1Api$list_namespaced_lease_candidate(
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

  = NULL createCoordinationV1alpha1NamespacedLeaseCandidate create a
  LeaseCandidate

------------------------------------------------------------------------

### Method `create_namespaced_lease_candidate()`

#### Usage

    CoordinationV1alpha1Api$create_namespaced_lease_candidate(
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

  = NULL deleteCoordinationV1alpha1CollectionNamespacedLeaseCandidate
  delete collection of LeaseCandidate

------------------------------------------------------------------------

### Method `delete_collection_namespaced_lease_candidate()`

#### Usage

    CoordinationV1alpha1Api$delete_collection_namespaced_lease_candidate(
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

  = NULL readCoordinationV1alpha1NamespacedLeaseCandidate read the
  specified LeaseCandidate

------------------------------------------------------------------------

### Method `read_namespaced_lease_candidate()`

#### Usage

    CoordinationV1alpha1Api$read_namespaced_lease_candidate(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceCoordinationV1alpha1NamespacedLeaseCandidate replace the
  specified LeaseCandidate

------------------------------------------------------------------------

### Method `replace_namespaced_lease_candidate()`

#### Usage

    CoordinationV1alpha1Api$replace_namespaced_lease_candidate(
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

  = NULL patchCoordinationV1alpha1NamespacedLeaseCandidate partially
  update the specified LeaseCandidate

------------------------------------------------------------------------

### Method `patch_namespaced_lease_candidate()`

#### Usage

    CoordinationV1alpha1Api$patch_namespaced_lease_candidate(
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
  deleteCoordinationV1alpha1NamespacedLeaseCandidate delete a
  LeaseCandidate

------------------------------------------------------------------------

### Method `delete_namespaced_lease_candidate()`

#### Usage

    CoordinationV1alpha1Api$delete_namespaced_lease_candidate(
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

  = NULL watchCoordinationV1alpha1LeaseCandidateListForAllNamespaces
  watch individual changes to a list of LeaseCandidate. deprecated: use
  the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_lease_candidate_list_for_all_namespaces()`

#### Usage

    CoordinationV1alpha1Api$watch_lease_candidate_list_for_all_namespaces(
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

  = NULL watchCoordinationV1alpha1NamespacedLeaseCandidateList watch
  individual changes to a list of LeaseCandidate. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_lease_candidate_list()`

#### Usage

    CoordinationV1alpha1Api$watch_namespaced_lease_candidate_list(
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

  = NULL watchCoordinationV1alpha1NamespacedLeaseCandidate watch changes
  to an object of kind LeaseCandidate. deprecated: use the 'watch'
  parameter with a list operation instead, filtered to a single item
  with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_lease_candidate()`

#### Usage

    CoordinationV1alpha1Api$watch_namespaced_lease_candidate(
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

  = NULL

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    CoordinationV1alpha1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
