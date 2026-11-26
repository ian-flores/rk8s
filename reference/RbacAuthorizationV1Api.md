# RbacAuthorizationV1Api

RbacAuthorizationV1Api

RbacAuthorizationV1Api

## Details

Typed Kubernetes API client for the \`RbacAuthorizationV1\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`RbacAuthorizationV1Api$new()`](#method-RbacAuthorizationV1Api-new)

- [`RbacAuthorizationV1Api$get_api_resources()`](#method-RbacAuthorizationV1Api-get_api_resources)

- [`RbacAuthorizationV1Api$list_cluster_role_binding()`](#method-RbacAuthorizationV1Api-list_cluster_role_binding)

- [`RbacAuthorizationV1Api$create_cluster_role_binding()`](#method-RbacAuthorizationV1Api-create_cluster_role_binding)

- [`RbacAuthorizationV1Api$delete_collection_cluster_role_binding()`](#method-RbacAuthorizationV1Api-delete_collection_cluster_role_binding)

- [`RbacAuthorizationV1Api$read_cluster_role_binding()`](#method-RbacAuthorizationV1Api-read_cluster_role_binding)

- [`RbacAuthorizationV1Api$replace_cluster_role_binding()`](#method-RbacAuthorizationV1Api-replace_cluster_role_binding)

- [`RbacAuthorizationV1Api$patch_cluster_role_binding()`](#method-RbacAuthorizationV1Api-patch_cluster_role_binding)

- [`RbacAuthorizationV1Api$delete_cluster_role_binding()`](#method-RbacAuthorizationV1Api-delete_cluster_role_binding)

- [`RbacAuthorizationV1Api$list_cluster_role()`](#method-RbacAuthorizationV1Api-list_cluster_role)

- [`RbacAuthorizationV1Api$create_cluster_role()`](#method-RbacAuthorizationV1Api-create_cluster_role)

- [`RbacAuthorizationV1Api$delete_collection_cluster_role()`](#method-RbacAuthorizationV1Api-delete_collection_cluster_role)

- [`RbacAuthorizationV1Api$read_cluster_role()`](#method-RbacAuthorizationV1Api-read_cluster_role)

- [`RbacAuthorizationV1Api$replace_cluster_role()`](#method-RbacAuthorizationV1Api-replace_cluster_role)

- [`RbacAuthorizationV1Api$patch_cluster_role()`](#method-RbacAuthorizationV1Api-patch_cluster_role)

- [`RbacAuthorizationV1Api$delete_cluster_role()`](#method-RbacAuthorizationV1Api-delete_cluster_role)

- [`RbacAuthorizationV1Api$list_namespaced_role_binding()`](#method-RbacAuthorizationV1Api-list_namespaced_role_binding)

- [`RbacAuthorizationV1Api$create_namespaced_role_binding()`](#method-RbacAuthorizationV1Api-create_namespaced_role_binding)

- [`RbacAuthorizationV1Api$delete_collection_namespaced_role_binding()`](#method-RbacAuthorizationV1Api-delete_collection_namespaced_role_binding)

- [`RbacAuthorizationV1Api$read_namespaced_role_binding()`](#method-RbacAuthorizationV1Api-read_namespaced_role_binding)

- [`RbacAuthorizationV1Api$replace_namespaced_role_binding()`](#method-RbacAuthorizationV1Api-replace_namespaced_role_binding)

- [`RbacAuthorizationV1Api$patch_namespaced_role_binding()`](#method-RbacAuthorizationV1Api-patch_namespaced_role_binding)

- [`RbacAuthorizationV1Api$delete_namespaced_role_binding()`](#method-RbacAuthorizationV1Api-delete_namespaced_role_binding)

- [`RbacAuthorizationV1Api$list_namespaced_role()`](#method-RbacAuthorizationV1Api-list_namespaced_role)

- [`RbacAuthorizationV1Api$create_namespaced_role()`](#method-RbacAuthorizationV1Api-create_namespaced_role)

- [`RbacAuthorizationV1Api$delete_collection_namespaced_role()`](#method-RbacAuthorizationV1Api-delete_collection_namespaced_role)

- [`RbacAuthorizationV1Api$read_namespaced_role()`](#method-RbacAuthorizationV1Api-read_namespaced_role)

- [`RbacAuthorizationV1Api$replace_namespaced_role()`](#method-RbacAuthorizationV1Api-replace_namespaced_role)

- [`RbacAuthorizationV1Api$patch_namespaced_role()`](#method-RbacAuthorizationV1Api-patch_namespaced_role)

- [`RbacAuthorizationV1Api$delete_namespaced_role()`](#method-RbacAuthorizationV1Api-delete_namespaced_role)

- [`RbacAuthorizationV1Api$list_role_binding_for_all_namespaces()`](#method-RbacAuthorizationV1Api-list_role_binding_for_all_namespaces)

- [`RbacAuthorizationV1Api$list_role_for_all_namespaces()`](#method-RbacAuthorizationV1Api-list_role_for_all_namespaces)

- [`RbacAuthorizationV1Api$watch_cluster_role_binding_list()`](#method-RbacAuthorizationV1Api-watch_cluster_role_binding_list)

- [`RbacAuthorizationV1Api$watch_cluster_role_binding()`](#method-RbacAuthorizationV1Api-watch_cluster_role_binding)

- [`RbacAuthorizationV1Api$watch_cluster_role_list()`](#method-RbacAuthorizationV1Api-watch_cluster_role_list)

- [`RbacAuthorizationV1Api$watch_cluster_role()`](#method-RbacAuthorizationV1Api-watch_cluster_role)

- [`RbacAuthorizationV1Api$watch_namespaced_role_binding_list()`](#method-RbacAuthorizationV1Api-watch_namespaced_role_binding_list)

- [`RbacAuthorizationV1Api$watch_namespaced_role_binding()`](#method-RbacAuthorizationV1Api-watch_namespaced_role_binding)

- [`RbacAuthorizationV1Api$watch_namespaced_role_list()`](#method-RbacAuthorizationV1Api-watch_namespaced_role_list)

- [`RbacAuthorizationV1Api$watch_namespaced_role()`](#method-RbacAuthorizationV1Api-watch_namespaced_role)

- [`RbacAuthorizationV1Api$watch_role_binding_list_for_all_namespaces()`](#method-RbacAuthorizationV1Api-watch_role_binding_list_for_all_namespaces)

- [`RbacAuthorizationV1Api$watch_role_list_for_all_namespaces()`](#method-RbacAuthorizationV1Api-watch_role_list_for_all_namespaces)

- [`RbacAuthorizationV1Api$clone()`](#method-RbacAuthorizationV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    RbacAuthorizationV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getRbacAuthorizationV1APIResources get available
  resources listRbacAuthorizationV1ClusterRoleBinding list or watch
  objects of kind ClusterRoleBinding

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    RbacAuthorizationV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_cluster_role_binding()`

#### Usage

    RbacAuthorizationV1Api$list_cluster_role_binding(
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

  = NULL createRbacAuthorizationV1ClusterRoleBinding create a
  ClusterRoleBinding

------------------------------------------------------------------------

### Method `create_cluster_role_binding()`

#### Usage

    RbacAuthorizationV1Api$create_cluster_role_binding(
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

  = NULL deleteRbacAuthorizationV1CollectionClusterRoleBinding delete
  collection of ClusterRoleBinding

------------------------------------------------------------------------

### Method `delete_collection_cluster_role_binding()`

#### Usage

    RbacAuthorizationV1Api$delete_collection_cluster_role_binding(
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

  = NULL readRbacAuthorizationV1ClusterRoleBinding read the specified
  ClusterRoleBinding

------------------------------------------------------------------------

### Method `read_cluster_role_binding()`

#### Usage

    RbacAuthorizationV1Api$read_cluster_role_binding(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceRbacAuthorizationV1ClusterRoleBinding replace the
  specified ClusterRoleBinding

------------------------------------------------------------------------

### Method `replace_cluster_role_binding()`

#### Usage

    RbacAuthorizationV1Api$replace_cluster_role_binding(
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

  = NULL patchRbacAuthorizationV1ClusterRoleBinding partially update the
  specified ClusterRoleBinding

------------------------------------------------------------------------

### Method `patch_cluster_role_binding()`

#### Usage

    RbacAuthorizationV1Api$patch_cluster_role_binding(
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
  deleteRbacAuthorizationV1ClusterRoleBinding delete a
  ClusterRoleBinding

------------------------------------------------------------------------

### Method `delete_cluster_role_binding()`

#### Usage

    RbacAuthorizationV1Api$delete_cluster_role_binding(
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

  = NULL listRbacAuthorizationV1ClusterRole list or watch objects of
  kind ClusterRole

------------------------------------------------------------------------

### Method `list_cluster_role()`

#### Usage

    RbacAuthorizationV1Api$list_cluster_role(
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

  = NULL createRbacAuthorizationV1ClusterRole create a ClusterRole

------------------------------------------------------------------------

### Method `create_cluster_role()`

#### Usage

    RbacAuthorizationV1Api$create_cluster_role(
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

  = NULL deleteRbacAuthorizationV1CollectionClusterRole delete
  collection of ClusterRole

------------------------------------------------------------------------

### Method `delete_collection_cluster_role()`

#### Usage

    RbacAuthorizationV1Api$delete_collection_cluster_role(
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

  = NULL readRbacAuthorizationV1ClusterRole read the specified
  ClusterRole

------------------------------------------------------------------------

### Method `read_cluster_role()`

#### Usage

    RbacAuthorizationV1Api$read_cluster_role(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceRbacAuthorizationV1ClusterRole replace the specified
  ClusterRole

------------------------------------------------------------------------

### Method `replace_cluster_role()`

#### Usage

    RbacAuthorizationV1Api$replace_cluster_role(
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

  = NULL patchRbacAuthorizationV1ClusterRole partially update the
  specified ClusterRole

------------------------------------------------------------------------

### Method `patch_cluster_role()`

#### Usage

    RbacAuthorizationV1Api$patch_cluster_role(
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

  = "application/json-patch+json" deleteRbacAuthorizationV1ClusterRole
  delete a ClusterRole

------------------------------------------------------------------------

### Method `delete_cluster_role()`

#### Usage

    RbacAuthorizationV1Api$delete_cluster_role(
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

  = NULL listRbacAuthorizationV1NamespacedRoleBinding list or watch
  objects of kind RoleBinding

------------------------------------------------------------------------

### Method `list_namespaced_role_binding()`

#### Usage

    RbacAuthorizationV1Api$list_namespaced_role_binding(
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

  = NULL createRbacAuthorizationV1NamespacedRoleBinding create a
  RoleBinding

------------------------------------------------------------------------

### Method `create_namespaced_role_binding()`

#### Usage

    RbacAuthorizationV1Api$create_namespaced_role_binding(
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

  = NULL deleteRbacAuthorizationV1CollectionNamespacedRoleBinding delete
  collection of RoleBinding

------------------------------------------------------------------------

### Method `delete_collection_namespaced_role_binding()`

#### Usage

    RbacAuthorizationV1Api$delete_collection_namespaced_role_binding(
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

  = NULL readRbacAuthorizationV1NamespacedRoleBinding read the specified
  RoleBinding

------------------------------------------------------------------------

### Method `read_namespaced_role_binding()`

#### Usage

    RbacAuthorizationV1Api$read_namespaced_role_binding(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceRbacAuthorizationV1NamespacedRoleBinding replace the
  specified RoleBinding

------------------------------------------------------------------------

### Method `replace_namespaced_role_binding()`

#### Usage

    RbacAuthorizationV1Api$replace_namespaced_role_binding(
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

  = NULL patchRbacAuthorizationV1NamespacedRoleBinding partially update
  the specified RoleBinding

------------------------------------------------------------------------

### Method `patch_namespaced_role_binding()`

#### Usage

    RbacAuthorizationV1Api$patch_namespaced_role_binding(
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
  deleteRbacAuthorizationV1NamespacedRoleBinding delete a RoleBinding

------------------------------------------------------------------------

### Method `delete_namespaced_role_binding()`

#### Usage

    RbacAuthorizationV1Api$delete_namespaced_role_binding(
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

  = NULL listRbacAuthorizationV1NamespacedRole list or watch objects of
  kind Role

------------------------------------------------------------------------

### Method `list_namespaced_role()`

#### Usage

    RbacAuthorizationV1Api$list_namespaced_role(
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

  = NULL createRbacAuthorizationV1NamespacedRole create a Role

------------------------------------------------------------------------

### Method `create_namespaced_role()`

#### Usage

    RbacAuthorizationV1Api$create_namespaced_role(
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

  = NULL deleteRbacAuthorizationV1CollectionNamespacedRole delete
  collection of Role

------------------------------------------------------------------------

### Method `delete_collection_namespaced_role()`

#### Usage

    RbacAuthorizationV1Api$delete_collection_namespaced_role(
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

  = NULL readRbacAuthorizationV1NamespacedRole read the specified Role

------------------------------------------------------------------------

### Method `read_namespaced_role()`

#### Usage

    RbacAuthorizationV1Api$read_namespaced_role(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceRbacAuthorizationV1NamespacedRole replace the specified
  Role

------------------------------------------------------------------------

### Method `replace_namespaced_role()`

#### Usage

    RbacAuthorizationV1Api$replace_namespaced_role(
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

  = NULL patchRbacAuthorizationV1NamespacedRole partially update the
  specified Role

------------------------------------------------------------------------

### Method `patch_namespaced_role()`

#### Usage

    RbacAuthorizationV1Api$patch_namespaced_role(
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
  deleteRbacAuthorizationV1NamespacedRole delete a Role

------------------------------------------------------------------------

### Method `delete_namespaced_role()`

#### Usage

    RbacAuthorizationV1Api$delete_namespaced_role(
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

  = NULL listRbacAuthorizationV1RoleBindingForAllNamespaces list or
  watch objects of kind RoleBinding

------------------------------------------------------------------------

### Method `list_role_binding_for_all_namespaces()`

#### Usage

    RbacAuthorizationV1Api$list_role_binding_for_all_namespaces(
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

  = NULL listRbacAuthorizationV1RoleForAllNamespaces list or watch
  objects of kind Role

------------------------------------------------------------------------

### Method `list_role_for_all_namespaces()`

#### Usage

    RbacAuthorizationV1Api$list_role_for_all_namespaces(
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

  = NULL watchRbacAuthorizationV1ClusterRoleBindingList watch individual
  changes to a list of ClusterRoleBinding. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_cluster_role_binding_list()`

#### Usage

    RbacAuthorizationV1Api$watch_cluster_role_binding_list(
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

  = NULL watchRbacAuthorizationV1ClusterRoleBinding watch changes to an
  object of kind ClusterRoleBinding. deprecated: use the 'watch'
  parameter with a list operation instead, filtered to a single item
  with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_cluster_role_binding()`

#### Usage

    RbacAuthorizationV1Api$watch_cluster_role_binding(
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

  = NULL watchRbacAuthorizationV1ClusterRoleList watch individual
  changes to a list of ClusterRole. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_cluster_role_list()`

#### Usage

    RbacAuthorizationV1Api$watch_cluster_role_list(
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

  = NULL watchRbacAuthorizationV1ClusterRole watch changes to an object
  of kind ClusterRole. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_cluster_role()`

#### Usage

    RbacAuthorizationV1Api$watch_cluster_role(
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

  = NULL watchRbacAuthorizationV1NamespacedRoleBindingList watch
  individual changes to a list of RoleBinding. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_role_binding_list()`

#### Usage

    RbacAuthorizationV1Api$watch_namespaced_role_binding_list(
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

  = NULL watchRbacAuthorizationV1NamespacedRoleBinding watch changes to
  an object of kind RoleBinding. deprecated: use the 'watch' parameter
  with a list operation instead, filtered to a single item with the
  'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_role_binding()`

#### Usage

    RbacAuthorizationV1Api$watch_namespaced_role_binding(
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

  = NULL watchRbacAuthorizationV1NamespacedRoleList watch individual
  changes to a list of Role. deprecated: use the 'watch' parameter with
  a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_role_list()`

#### Usage

    RbacAuthorizationV1Api$watch_namespaced_role_list(
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

  = NULL watchRbacAuthorizationV1NamespacedRole watch changes to an
  object of kind Role. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_role()`

#### Usage

    RbacAuthorizationV1Api$watch_namespaced_role(
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

  = NULL watchRbacAuthorizationV1RoleBindingListForAllNamespaces watch
  individual changes to a list of RoleBinding. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_role_binding_list_for_all_namespaces()`

#### Usage

    RbacAuthorizationV1Api$watch_role_binding_list_for_all_namespaces(
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

  = NULL watchRbacAuthorizationV1RoleListForAllNamespaces watch
  individual changes to a list of Role. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_role_list_for_all_namespaces()`

#### Usage

    RbacAuthorizationV1Api$watch_role_list_for_all_namespaces(
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

    RbacAuthorizationV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
