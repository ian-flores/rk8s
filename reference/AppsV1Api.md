# AppsV1Api

AppsV1Api

AppsV1Api

## Details

Typed Kubernetes API client for the \`AppsV1\` surface. See generated
methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`AppsV1Api$new()`](#method-AppsV1Api-new)

- [`AppsV1Api$get_api_resources()`](#method-AppsV1Api-get_api_resources)

- [`AppsV1Api$list_controller_revision_for_all_namespaces()`](#method-AppsV1Api-list_controller_revision_for_all_namespaces)

- [`AppsV1Api$list_daemon_set_for_all_namespaces()`](#method-AppsV1Api-list_daemon_set_for_all_namespaces)

- [`AppsV1Api$list_deployment_for_all_namespaces()`](#method-AppsV1Api-list_deployment_for_all_namespaces)

- [`AppsV1Api$list_namespaced_controller_revision()`](#method-AppsV1Api-list_namespaced_controller_revision)

- [`AppsV1Api$create_namespaced_controller_revision()`](#method-AppsV1Api-create_namespaced_controller_revision)

- [`AppsV1Api$delete_collection_namespaced_controller_revision()`](#method-AppsV1Api-delete_collection_namespaced_controller_revision)

- [`AppsV1Api$read_namespaced_controller_revision()`](#method-AppsV1Api-read_namespaced_controller_revision)

- [`AppsV1Api$replace_namespaced_controller_revision()`](#method-AppsV1Api-replace_namespaced_controller_revision)

- [`AppsV1Api$patch_namespaced_controller_revision()`](#method-AppsV1Api-patch_namespaced_controller_revision)

- [`AppsV1Api$delete_namespaced_controller_revision()`](#method-AppsV1Api-delete_namespaced_controller_revision)

- [`AppsV1Api$list_namespaced_daemon_set()`](#method-AppsV1Api-list_namespaced_daemon_set)

- [`AppsV1Api$create_namespaced_daemon_set()`](#method-AppsV1Api-create_namespaced_daemon_set)

- [`AppsV1Api$delete_collection_namespaced_daemon_set()`](#method-AppsV1Api-delete_collection_namespaced_daemon_set)

- [`AppsV1Api$read_namespaced_daemon_set()`](#method-AppsV1Api-read_namespaced_daemon_set)

- [`AppsV1Api$replace_namespaced_daemon_set()`](#method-AppsV1Api-replace_namespaced_daemon_set)

- [`AppsV1Api$patch_namespaced_daemon_set()`](#method-AppsV1Api-patch_namespaced_daemon_set)

- [`AppsV1Api$delete_namespaced_daemon_set()`](#method-AppsV1Api-delete_namespaced_daemon_set)

- [`AppsV1Api$read_namespaced_daemon_set_status()`](#method-AppsV1Api-read_namespaced_daemon_set_status)

- [`AppsV1Api$replace_namespaced_daemon_set_status()`](#method-AppsV1Api-replace_namespaced_daemon_set_status)

- [`AppsV1Api$patch_namespaced_daemon_set_status()`](#method-AppsV1Api-patch_namespaced_daemon_set_status)

- [`AppsV1Api$list_namespaced_deployment()`](#method-AppsV1Api-list_namespaced_deployment)

- [`AppsV1Api$create_namespaced_deployment()`](#method-AppsV1Api-create_namespaced_deployment)

- [`AppsV1Api$delete_collection_namespaced_deployment()`](#method-AppsV1Api-delete_collection_namespaced_deployment)

- [`AppsV1Api$read_namespaced_deployment()`](#method-AppsV1Api-read_namespaced_deployment)

- [`AppsV1Api$replace_namespaced_deployment()`](#method-AppsV1Api-replace_namespaced_deployment)

- [`AppsV1Api$patch_namespaced_deployment()`](#method-AppsV1Api-patch_namespaced_deployment)

- [`AppsV1Api$delete_namespaced_deployment()`](#method-AppsV1Api-delete_namespaced_deployment)

- [`AppsV1Api$read_namespaced_deployment_scale()`](#method-AppsV1Api-read_namespaced_deployment_scale)

- [`AppsV1Api$replace_namespaced_deployment_scale()`](#method-AppsV1Api-replace_namespaced_deployment_scale)

- [`AppsV1Api$patch_namespaced_deployment_scale()`](#method-AppsV1Api-patch_namespaced_deployment_scale)

- [`AppsV1Api$read_namespaced_deployment_status()`](#method-AppsV1Api-read_namespaced_deployment_status)

- [`AppsV1Api$replace_namespaced_deployment_status()`](#method-AppsV1Api-replace_namespaced_deployment_status)

- [`AppsV1Api$patch_namespaced_deployment_status()`](#method-AppsV1Api-patch_namespaced_deployment_status)

- [`AppsV1Api$list_namespaced_replica_set()`](#method-AppsV1Api-list_namespaced_replica_set)

- [`AppsV1Api$create_namespaced_replica_set()`](#method-AppsV1Api-create_namespaced_replica_set)

- [`AppsV1Api$delete_collection_namespaced_replica_set()`](#method-AppsV1Api-delete_collection_namespaced_replica_set)

- [`AppsV1Api$read_namespaced_replica_set()`](#method-AppsV1Api-read_namespaced_replica_set)

- [`AppsV1Api$replace_namespaced_replica_set()`](#method-AppsV1Api-replace_namespaced_replica_set)

- [`AppsV1Api$patch_namespaced_replica_set()`](#method-AppsV1Api-patch_namespaced_replica_set)

- [`AppsV1Api$delete_namespaced_replica_set()`](#method-AppsV1Api-delete_namespaced_replica_set)

- [`AppsV1Api$read_namespaced_replica_set_scale()`](#method-AppsV1Api-read_namespaced_replica_set_scale)

- [`AppsV1Api$replace_namespaced_replica_set_scale()`](#method-AppsV1Api-replace_namespaced_replica_set_scale)

- [`AppsV1Api$patch_namespaced_replica_set_scale()`](#method-AppsV1Api-patch_namespaced_replica_set_scale)

- [`AppsV1Api$read_namespaced_replica_set_status()`](#method-AppsV1Api-read_namespaced_replica_set_status)

- [`AppsV1Api$replace_namespaced_replica_set_status()`](#method-AppsV1Api-replace_namespaced_replica_set_status)

- [`AppsV1Api$patch_namespaced_replica_set_status()`](#method-AppsV1Api-patch_namespaced_replica_set_status)

- [`AppsV1Api$list_namespaced_stateful_set()`](#method-AppsV1Api-list_namespaced_stateful_set)

- [`AppsV1Api$create_namespaced_stateful_set()`](#method-AppsV1Api-create_namespaced_stateful_set)

- [`AppsV1Api$delete_collection_namespaced_stateful_set()`](#method-AppsV1Api-delete_collection_namespaced_stateful_set)

- [`AppsV1Api$read_namespaced_stateful_set()`](#method-AppsV1Api-read_namespaced_stateful_set)

- [`AppsV1Api$replace_namespaced_stateful_set()`](#method-AppsV1Api-replace_namespaced_stateful_set)

- [`AppsV1Api$patch_namespaced_stateful_set()`](#method-AppsV1Api-patch_namespaced_stateful_set)

- [`AppsV1Api$delete_namespaced_stateful_set()`](#method-AppsV1Api-delete_namespaced_stateful_set)

- [`AppsV1Api$read_namespaced_stateful_set_scale()`](#method-AppsV1Api-read_namespaced_stateful_set_scale)

- [`AppsV1Api$replace_namespaced_stateful_set_scale()`](#method-AppsV1Api-replace_namespaced_stateful_set_scale)

- [`AppsV1Api$patch_namespaced_stateful_set_scale()`](#method-AppsV1Api-patch_namespaced_stateful_set_scale)

- [`AppsV1Api$read_namespaced_stateful_set_status()`](#method-AppsV1Api-read_namespaced_stateful_set_status)

- [`AppsV1Api$replace_namespaced_stateful_set_status()`](#method-AppsV1Api-replace_namespaced_stateful_set_status)

- [`AppsV1Api$patch_namespaced_stateful_set_status()`](#method-AppsV1Api-patch_namespaced_stateful_set_status)

- [`AppsV1Api$list_replica_set_for_all_namespaces()`](#method-AppsV1Api-list_replica_set_for_all_namespaces)

- [`AppsV1Api$list_stateful_set_for_all_namespaces()`](#method-AppsV1Api-list_stateful_set_for_all_namespaces)

- [`AppsV1Api$watch_controller_revision_list_for_all_namespaces()`](#method-AppsV1Api-watch_controller_revision_list_for_all_namespaces)

- [`AppsV1Api$watch_daemon_set_list_for_all_namespaces()`](#method-AppsV1Api-watch_daemon_set_list_for_all_namespaces)

- [`AppsV1Api$watch_deployment_list_for_all_namespaces()`](#method-AppsV1Api-watch_deployment_list_for_all_namespaces)

- [`AppsV1Api$watch_namespaced_controller_revision_list()`](#method-AppsV1Api-watch_namespaced_controller_revision_list)

- [`AppsV1Api$watch_namespaced_controller_revision()`](#method-AppsV1Api-watch_namespaced_controller_revision)

- [`AppsV1Api$watch_namespaced_daemon_set_list()`](#method-AppsV1Api-watch_namespaced_daemon_set_list)

- [`AppsV1Api$watch_namespaced_daemon_set()`](#method-AppsV1Api-watch_namespaced_daemon_set)

- [`AppsV1Api$watch_namespaced_deployment_list()`](#method-AppsV1Api-watch_namespaced_deployment_list)

- [`AppsV1Api$watch_namespaced_deployment()`](#method-AppsV1Api-watch_namespaced_deployment)

- [`AppsV1Api$watch_namespaced_replica_set_list()`](#method-AppsV1Api-watch_namespaced_replica_set_list)

- [`AppsV1Api$watch_namespaced_replica_set()`](#method-AppsV1Api-watch_namespaced_replica_set)

- [`AppsV1Api$watch_namespaced_stateful_set_list()`](#method-AppsV1Api-watch_namespaced_stateful_set_list)

- [`AppsV1Api$watch_namespaced_stateful_set()`](#method-AppsV1Api-watch_namespaced_stateful_set)

- [`AppsV1Api$watch_replica_set_list_for_all_namespaces()`](#method-AppsV1Api-watch_replica_set_list_for_all_namespaces)

- [`AppsV1Api$watch_stateful_set_list_for_all_namespaces()`](#method-AppsV1Api-watch_stateful_set_list_for_all_namespaces)

- [`AppsV1Api$clone()`](#method-AppsV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    AppsV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getAppsV1APIResources get available resources
  listAppsV1ControllerRevisionForAllNamespaces list or watch objects of
  kind ControllerRevision

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    AppsV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_controller_revision_for_all_namespaces()`

#### Usage

    AppsV1Api$list_controller_revision_for_all_namespaces(
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

  = NULL listAppsV1DaemonSetForAllNamespaces list or watch objects of
  kind DaemonSet

------------------------------------------------------------------------

### Method `list_daemon_set_for_all_namespaces()`

#### Usage

    AppsV1Api$list_daemon_set_for_all_namespaces(
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

  = NULL listAppsV1DeploymentForAllNamespaces list or watch objects of
  kind Deployment

------------------------------------------------------------------------

### Method `list_deployment_for_all_namespaces()`

#### Usage

    AppsV1Api$list_deployment_for_all_namespaces(
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

  = NULL listAppsV1NamespacedControllerRevision list or watch objects of
  kind ControllerRevision

------------------------------------------------------------------------

### Method `list_namespaced_controller_revision()`

#### Usage

    AppsV1Api$list_namespaced_controller_revision(
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

  = NULL createAppsV1NamespacedControllerRevision create a
  ControllerRevision

------------------------------------------------------------------------

### Method `create_namespaced_controller_revision()`

#### Usage

    AppsV1Api$create_namespaced_controller_revision(
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

  = NULL deleteAppsV1CollectionNamespacedControllerRevision delete
  collection of ControllerRevision

------------------------------------------------------------------------

### Method `delete_collection_namespaced_controller_revision()`

#### Usage

    AppsV1Api$delete_collection_namespaced_controller_revision(
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

  = NULL readAppsV1NamespacedControllerRevision read the specified
  ControllerRevision

------------------------------------------------------------------------

### Method `read_namespaced_controller_revision()`

#### Usage

    AppsV1Api$read_namespaced_controller_revision(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceAppsV1NamespacedControllerRevision replace the specified
  ControllerRevision

------------------------------------------------------------------------

### Method `replace_namespaced_controller_revision()`

#### Usage

    AppsV1Api$replace_namespaced_controller_revision(
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

  = NULL patchAppsV1NamespacedControllerRevision partially update the
  specified ControllerRevision

------------------------------------------------------------------------

### Method `patch_namespaced_controller_revision()`

#### Usage

    AppsV1Api$patch_namespaced_controller_revision(
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
  deleteAppsV1NamespacedControllerRevision delete a ControllerRevision

------------------------------------------------------------------------

### Method `delete_namespaced_controller_revision()`

#### Usage

    AppsV1Api$delete_namespaced_controller_revision(
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

  = NULL listAppsV1NamespacedDaemonSet list or watch objects of kind
  DaemonSet

------------------------------------------------------------------------

### Method `list_namespaced_daemon_set()`

#### Usage

    AppsV1Api$list_namespaced_daemon_set(
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

  = NULL createAppsV1NamespacedDaemonSet create a DaemonSet

------------------------------------------------------------------------

### Method `create_namespaced_daemon_set()`

#### Usage

    AppsV1Api$create_namespaced_daemon_set(
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

  = NULL deleteAppsV1CollectionNamespacedDaemonSet delete collection of
  DaemonSet

------------------------------------------------------------------------

### Method `delete_collection_namespaced_daemon_set()`

#### Usage

    AppsV1Api$delete_collection_namespaced_daemon_set(
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

  = NULL readAppsV1NamespacedDaemonSet read the specified DaemonSet

------------------------------------------------------------------------

### Method `read_namespaced_daemon_set()`

#### Usage

    AppsV1Api$read_namespaced_daemon_set(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceAppsV1NamespacedDaemonSet replace the specified
  DaemonSet

------------------------------------------------------------------------

### Method `replace_namespaced_daemon_set()`

#### Usage

    AppsV1Api$replace_namespaced_daemon_set(
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

  = NULL patchAppsV1NamespacedDaemonSet partially update the specified
  DaemonSet

------------------------------------------------------------------------

### Method `patch_namespaced_daemon_set()`

#### Usage

    AppsV1Api$patch_namespaced_daemon_set(
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

  = "application/json-patch+json" deleteAppsV1NamespacedDaemonSet delete
  a DaemonSet

------------------------------------------------------------------------

### Method `delete_namespaced_daemon_set()`

#### Usage

    AppsV1Api$delete_namespaced_daemon_set(
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

  = NULL readAppsV1NamespacedDaemonSetStatus read status of the
  specified DaemonSet

------------------------------------------------------------------------

### Method `read_namespaced_daemon_set_status()`

#### Usage

    AppsV1Api$read_namespaced_daemon_set_status(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceAppsV1NamespacedDaemonSetStatus replace status of the
  specified DaemonSet

------------------------------------------------------------------------

### Method `replace_namespaced_daemon_set_status()`

#### Usage

    AppsV1Api$replace_namespaced_daemon_set_status(
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

  = NULL patchAppsV1NamespacedDaemonSetStatus partially update status of
  the specified DaemonSet

------------------------------------------------------------------------

### Method `patch_namespaced_daemon_set_status()`

#### Usage

    AppsV1Api$patch_namespaced_daemon_set_status(
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

  = "application/json-patch+json" listAppsV1NamespacedDeployment list or
  watch objects of kind Deployment

------------------------------------------------------------------------

### Method `list_namespaced_deployment()`

#### Usage

    AppsV1Api$list_namespaced_deployment(
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

  = NULL createAppsV1NamespacedDeployment create a Deployment

------------------------------------------------------------------------

### Method `create_namespaced_deployment()`

#### Usage

    AppsV1Api$create_namespaced_deployment(
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

  = NULL deleteAppsV1CollectionNamespacedDeployment delete collection of
  Deployment

------------------------------------------------------------------------

### Method `delete_collection_namespaced_deployment()`

#### Usage

    AppsV1Api$delete_collection_namespaced_deployment(
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

  = NULL readAppsV1NamespacedDeployment read the specified Deployment

------------------------------------------------------------------------

### Method `read_namespaced_deployment()`

#### Usage

    AppsV1Api$read_namespaced_deployment(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceAppsV1NamespacedDeployment replace the specified
  Deployment

------------------------------------------------------------------------

### Method `replace_namespaced_deployment()`

#### Usage

    AppsV1Api$replace_namespaced_deployment(
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

  = NULL patchAppsV1NamespacedDeployment partially update the specified
  Deployment

------------------------------------------------------------------------

### Method `patch_namespaced_deployment()`

#### Usage

    AppsV1Api$patch_namespaced_deployment(
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

  = "application/json-patch+json" deleteAppsV1NamespacedDeployment
  delete a Deployment

------------------------------------------------------------------------

### Method `delete_namespaced_deployment()`

#### Usage

    AppsV1Api$delete_namespaced_deployment(
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

  = NULL readAppsV1NamespacedDeploymentScale read scale of the specified
  Deployment

------------------------------------------------------------------------

### Method `read_namespaced_deployment_scale()`

#### Usage

    AppsV1Api$read_namespaced_deployment_scale(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceAppsV1NamespacedDeploymentScale replace scale of the
  specified Deployment

------------------------------------------------------------------------

### Method `replace_namespaced_deployment_scale()`

#### Usage

    AppsV1Api$replace_namespaced_deployment_scale(
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

  = NULL patchAppsV1NamespacedDeploymentScale partially update scale of
  the specified Deployment

------------------------------------------------------------------------

### Method `patch_namespaced_deployment_scale()`

#### Usage

    AppsV1Api$patch_namespaced_deployment_scale(
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

  = "application/json-patch+json" readAppsV1NamespacedDeploymentStatus
  read status of the specified Deployment

------------------------------------------------------------------------

### Method `read_namespaced_deployment_status()`

#### Usage

    AppsV1Api$read_namespaced_deployment_status(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceAppsV1NamespacedDeploymentStatus replace status of the
  specified Deployment

------------------------------------------------------------------------

### Method `replace_namespaced_deployment_status()`

#### Usage

    AppsV1Api$replace_namespaced_deployment_status(
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

  = NULL patchAppsV1NamespacedDeploymentStatus partially update status
  of the specified Deployment

------------------------------------------------------------------------

### Method `patch_namespaced_deployment_status()`

#### Usage

    AppsV1Api$patch_namespaced_deployment_status(
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

  = "application/json-patch+json" listAppsV1NamespacedReplicaSet list or
  watch objects of kind ReplicaSet

------------------------------------------------------------------------

### Method `list_namespaced_replica_set()`

#### Usage

    AppsV1Api$list_namespaced_replica_set(
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

  = NULL createAppsV1NamespacedReplicaSet create a ReplicaSet

------------------------------------------------------------------------

### Method `create_namespaced_replica_set()`

#### Usage

    AppsV1Api$create_namespaced_replica_set(
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

  = NULL deleteAppsV1CollectionNamespacedReplicaSet delete collection of
  ReplicaSet

------------------------------------------------------------------------

### Method `delete_collection_namespaced_replica_set()`

#### Usage

    AppsV1Api$delete_collection_namespaced_replica_set(
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

  = NULL readAppsV1NamespacedReplicaSet read the specified ReplicaSet

------------------------------------------------------------------------

### Method `read_namespaced_replica_set()`

#### Usage

    AppsV1Api$read_namespaced_replica_set(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceAppsV1NamespacedReplicaSet replace the specified
  ReplicaSet

------------------------------------------------------------------------

### Method `replace_namespaced_replica_set()`

#### Usage

    AppsV1Api$replace_namespaced_replica_set(
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

  = NULL patchAppsV1NamespacedReplicaSet partially update the specified
  ReplicaSet

------------------------------------------------------------------------

### Method `patch_namespaced_replica_set()`

#### Usage

    AppsV1Api$patch_namespaced_replica_set(
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

  = "application/json-patch+json" deleteAppsV1NamespacedReplicaSet
  delete a ReplicaSet

------------------------------------------------------------------------

### Method `delete_namespaced_replica_set()`

#### Usage

    AppsV1Api$delete_namespaced_replica_set(
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

  = NULL readAppsV1NamespacedReplicaSetScale read scale of the specified
  ReplicaSet

------------------------------------------------------------------------

### Method `read_namespaced_replica_set_scale()`

#### Usage

    AppsV1Api$read_namespaced_replica_set_scale(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceAppsV1NamespacedReplicaSetScale replace scale of the
  specified ReplicaSet

------------------------------------------------------------------------

### Method `replace_namespaced_replica_set_scale()`

#### Usage

    AppsV1Api$replace_namespaced_replica_set_scale(
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

  = NULL patchAppsV1NamespacedReplicaSetScale partially update scale of
  the specified ReplicaSet

------------------------------------------------------------------------

### Method `patch_namespaced_replica_set_scale()`

#### Usage

    AppsV1Api$patch_namespaced_replica_set_scale(
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

  = "application/json-patch+json" readAppsV1NamespacedReplicaSetStatus
  read status of the specified ReplicaSet

------------------------------------------------------------------------

### Method `read_namespaced_replica_set_status()`

#### Usage

    AppsV1Api$read_namespaced_replica_set_status(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceAppsV1NamespacedReplicaSetStatus replace status of the
  specified ReplicaSet

------------------------------------------------------------------------

### Method `replace_namespaced_replica_set_status()`

#### Usage

    AppsV1Api$replace_namespaced_replica_set_status(
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

  = NULL patchAppsV1NamespacedReplicaSetStatus partially update status
  of the specified ReplicaSet

------------------------------------------------------------------------

### Method `patch_namespaced_replica_set_status()`

#### Usage

    AppsV1Api$patch_namespaced_replica_set_status(
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

  = "application/json-patch+json" listAppsV1NamespacedStatefulSet list
  or watch objects of kind StatefulSet

------------------------------------------------------------------------

### Method `list_namespaced_stateful_set()`

#### Usage

    AppsV1Api$list_namespaced_stateful_set(
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

  = NULL createAppsV1NamespacedStatefulSet create a StatefulSet

------------------------------------------------------------------------

### Method `create_namespaced_stateful_set()`

#### Usage

    AppsV1Api$create_namespaced_stateful_set(
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

  = NULL deleteAppsV1CollectionNamespacedStatefulSet delete collection
  of StatefulSet

------------------------------------------------------------------------

### Method `delete_collection_namespaced_stateful_set()`

#### Usage

    AppsV1Api$delete_collection_namespaced_stateful_set(
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

  = NULL readAppsV1NamespacedStatefulSet read the specified StatefulSet

------------------------------------------------------------------------

### Method `read_namespaced_stateful_set()`

#### Usage

    AppsV1Api$read_namespaced_stateful_set(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceAppsV1NamespacedStatefulSet replace the specified
  StatefulSet

------------------------------------------------------------------------

### Method `replace_namespaced_stateful_set()`

#### Usage

    AppsV1Api$replace_namespaced_stateful_set(
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

  = NULL patchAppsV1NamespacedStatefulSet partially update the specified
  StatefulSet

------------------------------------------------------------------------

### Method `patch_namespaced_stateful_set()`

#### Usage

    AppsV1Api$patch_namespaced_stateful_set(
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

  = "application/json-patch+json" deleteAppsV1NamespacedStatefulSet
  delete a StatefulSet

------------------------------------------------------------------------

### Method `delete_namespaced_stateful_set()`

#### Usage

    AppsV1Api$delete_namespaced_stateful_set(
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

  = NULL readAppsV1NamespacedStatefulSetScale read scale of the
  specified StatefulSet

------------------------------------------------------------------------

### Method `read_namespaced_stateful_set_scale()`

#### Usage

    AppsV1Api$read_namespaced_stateful_set_scale(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceAppsV1NamespacedStatefulSetScale replace scale of the
  specified StatefulSet

------------------------------------------------------------------------

### Method `replace_namespaced_stateful_set_scale()`

#### Usage

    AppsV1Api$replace_namespaced_stateful_set_scale(
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

  = NULL patchAppsV1NamespacedStatefulSetScale partially update scale of
  the specified StatefulSet

------------------------------------------------------------------------

### Method `patch_namespaced_stateful_set_scale()`

#### Usage

    AppsV1Api$patch_namespaced_stateful_set_scale(
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

  = "application/json-patch+json" readAppsV1NamespacedStatefulSetStatus
  read status of the specified StatefulSet

------------------------------------------------------------------------

### Method `read_namespaced_stateful_set_status()`

#### Usage

    AppsV1Api$read_namespaced_stateful_set_status(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceAppsV1NamespacedStatefulSetStatus replace status of the
  specified StatefulSet

------------------------------------------------------------------------

### Method `replace_namespaced_stateful_set_status()`

#### Usage

    AppsV1Api$replace_namespaced_stateful_set_status(
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

  = NULL patchAppsV1NamespacedStatefulSetStatus partially update status
  of the specified StatefulSet

------------------------------------------------------------------------

### Method `patch_namespaced_stateful_set_status()`

#### Usage

    AppsV1Api$patch_namespaced_stateful_set_status(
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

  = "application/json-patch+json" listAppsV1ReplicaSetForAllNamespaces
  list or watch objects of kind ReplicaSet

------------------------------------------------------------------------

### Method `list_replica_set_for_all_namespaces()`

#### Usage

    AppsV1Api$list_replica_set_for_all_namespaces(
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

  = NULL listAppsV1StatefulSetForAllNamespaces list or watch objects of
  kind StatefulSet

------------------------------------------------------------------------

### Method `list_stateful_set_for_all_namespaces()`

#### Usage

    AppsV1Api$list_stateful_set_for_all_namespaces(
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

  = NULL watchAppsV1ControllerRevisionListForAllNamespaces watch
  individual changes to a list of ControllerRevision. deprecated: use
  the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_controller_revision_list_for_all_namespaces()`

#### Usage

    AppsV1Api$watch_controller_revision_list_for_all_namespaces(
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

  = NULL watchAppsV1DaemonSetListForAllNamespaces watch individual
  changes to a list of DaemonSet. deprecated: use the 'watch' parameter
  with a list operation instead.

------------------------------------------------------------------------

### Method `watch_daemon_set_list_for_all_namespaces()`

#### Usage

    AppsV1Api$watch_daemon_set_list_for_all_namespaces(
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

  = NULL watchAppsV1DeploymentListForAllNamespaces watch individual
  changes to a list of Deployment. deprecated: use the 'watch' parameter
  with a list operation instead.

------------------------------------------------------------------------

### Method `watch_deployment_list_for_all_namespaces()`

#### Usage

    AppsV1Api$watch_deployment_list_for_all_namespaces(
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

  = NULL watchAppsV1NamespacedControllerRevisionList watch individual
  changes to a list of ControllerRevision. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_controller_revision_list()`

#### Usage

    AppsV1Api$watch_namespaced_controller_revision_list(
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

  = NULL watchAppsV1NamespacedControllerRevision watch changes to an
  object of kind ControllerRevision. deprecated: use the 'watch'
  parameter with a list operation instead, filtered to a single item
  with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_controller_revision()`

#### Usage

    AppsV1Api$watch_namespaced_controller_revision(
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

  = NULL watchAppsV1NamespacedDaemonSetList watch individual changes to
  a list of DaemonSet. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_daemon_set_list()`

#### Usage

    AppsV1Api$watch_namespaced_daemon_set_list(
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

  = NULL watchAppsV1NamespacedDaemonSet watch changes to an object of
  kind DaemonSet. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_daemon_set()`

#### Usage

    AppsV1Api$watch_namespaced_daemon_set(
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

  = NULL watchAppsV1NamespacedDeploymentList watch individual changes to
  a list of Deployment. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_deployment_list()`

#### Usage

    AppsV1Api$watch_namespaced_deployment_list(
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

  = NULL watchAppsV1NamespacedDeployment watch changes to an object of
  kind Deployment. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_deployment()`

#### Usage

    AppsV1Api$watch_namespaced_deployment(
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

  = NULL watchAppsV1NamespacedReplicaSetList watch individual changes to
  a list of ReplicaSet. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_replica_set_list()`

#### Usage

    AppsV1Api$watch_namespaced_replica_set_list(
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

  = NULL watchAppsV1NamespacedReplicaSet watch changes to an object of
  kind ReplicaSet. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_replica_set()`

#### Usage

    AppsV1Api$watch_namespaced_replica_set(
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

  = NULL watchAppsV1NamespacedStatefulSetList watch individual changes
  to a list of StatefulSet. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_stateful_set_list()`

#### Usage

    AppsV1Api$watch_namespaced_stateful_set_list(
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

  = NULL watchAppsV1NamespacedStatefulSet watch changes to an object of
  kind StatefulSet. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_stateful_set()`

#### Usage

    AppsV1Api$watch_namespaced_stateful_set(
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

  = NULL watchAppsV1ReplicaSetListForAllNamespaces watch individual
  changes to a list of ReplicaSet. deprecated: use the 'watch' parameter
  with a list operation instead.

------------------------------------------------------------------------

### Method `watch_replica_set_list_for_all_namespaces()`

#### Usage

    AppsV1Api$watch_replica_set_list_for_all_namespaces(
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

  = NULL watchAppsV1StatefulSetListForAllNamespaces watch individual
  changes to a list of StatefulSet. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_stateful_set_list_for_all_namespaces()`

#### Usage

    AppsV1Api$watch_stateful_set_list_for_all_namespaces(
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

    AppsV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
