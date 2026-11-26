# CoordinationV1Api

CoordinationV1Api

CoordinationV1Api

## Details

Typed Kubernetes API client for the \`CoordinationV1\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`CoordinationV1Api$new()`](#method-CoordinationV1Api-new)

- [`CoordinationV1Api$get_api_resources()`](#method-CoordinationV1Api-get_api_resources)

- [`CoordinationV1Api$list_lease_for_all_namespaces()`](#method-CoordinationV1Api-list_lease_for_all_namespaces)

- [`CoordinationV1Api$list_namespaced_lease()`](#method-CoordinationV1Api-list_namespaced_lease)

- [`CoordinationV1Api$create_namespaced_lease()`](#method-CoordinationV1Api-create_namespaced_lease)

- [`CoordinationV1Api$delete_collection_namespaced_lease()`](#method-CoordinationV1Api-delete_collection_namespaced_lease)

- [`CoordinationV1Api$read_namespaced_lease()`](#method-CoordinationV1Api-read_namespaced_lease)

- [`CoordinationV1Api$replace_namespaced_lease()`](#method-CoordinationV1Api-replace_namespaced_lease)

- [`CoordinationV1Api$patch_namespaced_lease()`](#method-CoordinationV1Api-patch_namespaced_lease)

- [`CoordinationV1Api$delete_namespaced_lease()`](#method-CoordinationV1Api-delete_namespaced_lease)

- [`CoordinationV1Api$watch_lease_list_for_all_namespaces()`](#method-CoordinationV1Api-watch_lease_list_for_all_namespaces)

- [`CoordinationV1Api$watch_namespaced_lease_list()`](#method-CoordinationV1Api-watch_namespaced_lease_list)

- [`CoordinationV1Api$watch_namespaced_lease()`](#method-CoordinationV1Api-watch_namespaced_lease)

- [`CoordinationV1Api$clone()`](#method-CoordinationV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    CoordinationV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getCoordinationV1APIResources get available
  resources listCoordinationV1LeaseForAllNamespaces list or watch
  objects of kind Lease

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    CoordinationV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_lease_for_all_namespaces()`

#### Usage

    CoordinationV1Api$list_lease_for_all_namespaces(
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

  = NULL listCoordinationV1NamespacedLease list or watch objects of kind
  Lease

------------------------------------------------------------------------

### Method `list_namespaced_lease()`

#### Usage

    CoordinationV1Api$list_namespaced_lease(
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

  = NULL createCoordinationV1NamespacedLease create a Lease

------------------------------------------------------------------------

### Method `create_namespaced_lease()`

#### Usage

    CoordinationV1Api$create_namespaced_lease(
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

  = NULL deleteCoordinationV1CollectionNamespacedLease delete collection
  of Lease

------------------------------------------------------------------------

### Method `delete_collection_namespaced_lease()`

#### Usage

    CoordinationV1Api$delete_collection_namespaced_lease(
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

  = NULL readCoordinationV1NamespacedLease read the specified Lease

------------------------------------------------------------------------

### Method `read_namespaced_lease()`

#### Usage

    CoordinationV1Api$read_namespaced_lease(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoordinationV1NamespacedLease replace the specified
  Lease

------------------------------------------------------------------------

### Method `replace_namespaced_lease()`

#### Usage

    CoordinationV1Api$replace_namespaced_lease(
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

  = NULL patchCoordinationV1NamespacedLease partially update the
  specified Lease

------------------------------------------------------------------------

### Method `patch_namespaced_lease()`

#### Usage

    CoordinationV1Api$patch_namespaced_lease(
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

  = "application/json-patch+json" deleteCoordinationV1NamespacedLease
  delete a Lease

------------------------------------------------------------------------

### Method `delete_namespaced_lease()`

#### Usage

    CoordinationV1Api$delete_namespaced_lease(
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

  = NULL watchCoordinationV1LeaseListForAllNamespaces watch individual
  changes to a list of Lease. deprecated: use the 'watch' parameter with
  a list operation instead.

------------------------------------------------------------------------

### Method `watch_lease_list_for_all_namespaces()`

#### Usage

    CoordinationV1Api$watch_lease_list_for_all_namespaces(
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

  = NULL watchCoordinationV1NamespacedLeaseList watch individual changes
  to a list of Lease. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_lease_list()`

#### Usage

    CoordinationV1Api$watch_namespaced_lease_list(
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

  = NULL watchCoordinationV1NamespacedLease watch changes to an object
  of kind Lease. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_lease()`

#### Usage

    CoordinationV1Api$watch_namespaced_lease(
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

    CoordinationV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
