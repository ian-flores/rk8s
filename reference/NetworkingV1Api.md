# NetworkingV1Api

NetworkingV1Api

NetworkingV1Api

## Details

Typed Kubernetes API client for the \`NetworkingV1\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`NetworkingV1Api$new()`](#method-NetworkingV1Api-new)

- [`NetworkingV1Api$get_api_resources()`](#method-NetworkingV1Api-get_api_resources)

- [`NetworkingV1Api$list_ingress_class()`](#method-NetworkingV1Api-list_ingress_class)

- [`NetworkingV1Api$create_ingress_class()`](#method-NetworkingV1Api-create_ingress_class)

- [`NetworkingV1Api$delete_collection_ingress_class()`](#method-NetworkingV1Api-delete_collection_ingress_class)

- [`NetworkingV1Api$read_ingress_class()`](#method-NetworkingV1Api-read_ingress_class)

- [`NetworkingV1Api$replace_ingress_class()`](#method-NetworkingV1Api-replace_ingress_class)

- [`NetworkingV1Api$patch_ingress_class()`](#method-NetworkingV1Api-patch_ingress_class)

- [`NetworkingV1Api$delete_ingress_class()`](#method-NetworkingV1Api-delete_ingress_class)

- [`NetworkingV1Api$list_ingress_for_all_namespaces()`](#method-NetworkingV1Api-list_ingress_for_all_namespaces)

- [`NetworkingV1Api$list_namespaced_ingress()`](#method-NetworkingV1Api-list_namespaced_ingress)

- [`NetworkingV1Api$create_namespaced_ingress()`](#method-NetworkingV1Api-create_namespaced_ingress)

- [`NetworkingV1Api$delete_collection_namespaced_ingress()`](#method-NetworkingV1Api-delete_collection_namespaced_ingress)

- [`NetworkingV1Api$read_namespaced_ingress()`](#method-NetworkingV1Api-read_namespaced_ingress)

- [`NetworkingV1Api$replace_namespaced_ingress()`](#method-NetworkingV1Api-replace_namespaced_ingress)

- [`NetworkingV1Api$patch_namespaced_ingress()`](#method-NetworkingV1Api-patch_namespaced_ingress)

- [`NetworkingV1Api$delete_namespaced_ingress()`](#method-NetworkingV1Api-delete_namespaced_ingress)

- [`NetworkingV1Api$read_namespaced_ingress_status()`](#method-NetworkingV1Api-read_namespaced_ingress_status)

- [`NetworkingV1Api$replace_namespaced_ingress_status()`](#method-NetworkingV1Api-replace_namespaced_ingress_status)

- [`NetworkingV1Api$patch_namespaced_ingress_status()`](#method-NetworkingV1Api-patch_namespaced_ingress_status)

- [`NetworkingV1Api$list_namespaced_network_policy()`](#method-NetworkingV1Api-list_namespaced_network_policy)

- [`NetworkingV1Api$create_namespaced_network_policy()`](#method-NetworkingV1Api-create_namespaced_network_policy)

- [`NetworkingV1Api$delete_collection_namespaced_network_policy()`](#method-NetworkingV1Api-delete_collection_namespaced_network_policy)

- [`NetworkingV1Api$read_namespaced_network_policy()`](#method-NetworkingV1Api-read_namespaced_network_policy)

- [`NetworkingV1Api$replace_namespaced_network_policy()`](#method-NetworkingV1Api-replace_namespaced_network_policy)

- [`NetworkingV1Api$patch_namespaced_network_policy()`](#method-NetworkingV1Api-patch_namespaced_network_policy)

- [`NetworkingV1Api$delete_namespaced_network_policy()`](#method-NetworkingV1Api-delete_namespaced_network_policy)

- [`NetworkingV1Api$list_network_policy_for_all_namespaces()`](#method-NetworkingV1Api-list_network_policy_for_all_namespaces)

- [`NetworkingV1Api$watch_ingress_class_list()`](#method-NetworkingV1Api-watch_ingress_class_list)

- [`NetworkingV1Api$watch_ingress_class()`](#method-NetworkingV1Api-watch_ingress_class)

- [`NetworkingV1Api$watch_ingress_list_for_all_namespaces()`](#method-NetworkingV1Api-watch_ingress_list_for_all_namespaces)

- [`NetworkingV1Api$watch_namespaced_ingress_list()`](#method-NetworkingV1Api-watch_namespaced_ingress_list)

- [`NetworkingV1Api$watch_namespaced_ingress()`](#method-NetworkingV1Api-watch_namespaced_ingress)

- [`NetworkingV1Api$watch_namespaced_network_policy_list()`](#method-NetworkingV1Api-watch_namespaced_network_policy_list)

- [`NetworkingV1Api$watch_namespaced_network_policy()`](#method-NetworkingV1Api-watch_namespaced_network_policy)

- [`NetworkingV1Api$watch_network_policy_list_for_all_namespaces()`](#method-NetworkingV1Api-watch_network_policy_list_for_all_namespaces)

- [`NetworkingV1Api$clone()`](#method-NetworkingV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    NetworkingV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getNetworkingV1APIResources get available resources
  listNetworkingV1IngressClass list or watch objects of kind
  IngressClass

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    NetworkingV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_ingress_class()`

#### Usage

    NetworkingV1Api$list_ingress_class(
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

  = NULL createNetworkingV1IngressClass create an IngressClass

------------------------------------------------------------------------

### Method `create_ingress_class()`

#### Usage

    NetworkingV1Api$create_ingress_class(
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

  = NULL deleteNetworkingV1CollectionIngressClass delete collection of
  IngressClass

------------------------------------------------------------------------

### Method `delete_collection_ingress_class()`

#### Usage

    NetworkingV1Api$delete_collection_ingress_class(
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

  = NULL readNetworkingV1IngressClass read the specified IngressClass

------------------------------------------------------------------------

### Method `read_ingress_class()`

#### Usage

    NetworkingV1Api$read_ingress_class(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceNetworkingV1IngressClass replace the specified
  IngressClass

------------------------------------------------------------------------

### Method `replace_ingress_class()`

#### Usage

    NetworkingV1Api$replace_ingress_class(
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

  = NULL patchNetworkingV1IngressClass partially update the specified
  IngressClass

------------------------------------------------------------------------

### Method `patch_ingress_class()`

#### Usage

    NetworkingV1Api$patch_ingress_class(
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

  = "application/json-patch+json" deleteNetworkingV1IngressClass delete
  an IngressClass

------------------------------------------------------------------------

### Method `delete_ingress_class()`

#### Usage

    NetworkingV1Api$delete_ingress_class(
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

  = NULL listNetworkingV1IngressForAllNamespaces list or watch objects
  of kind Ingress

------------------------------------------------------------------------

### Method `list_ingress_for_all_namespaces()`

#### Usage

    NetworkingV1Api$list_ingress_for_all_namespaces(
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

  = NULL listNetworkingV1NamespacedIngress list or watch objects of kind
  Ingress

------------------------------------------------------------------------

### Method `list_namespaced_ingress()`

#### Usage

    NetworkingV1Api$list_namespaced_ingress(
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

  = NULL createNetworkingV1NamespacedIngress create an Ingress

------------------------------------------------------------------------

### Method `create_namespaced_ingress()`

#### Usage

    NetworkingV1Api$create_namespaced_ingress(
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

  = NULL deleteNetworkingV1CollectionNamespacedIngress delete collection
  of Ingress

------------------------------------------------------------------------

### Method `delete_collection_namespaced_ingress()`

#### Usage

    NetworkingV1Api$delete_collection_namespaced_ingress(
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

  = NULL readNetworkingV1NamespacedIngress read the specified Ingress

------------------------------------------------------------------------

### Method `read_namespaced_ingress()`

#### Usage

    NetworkingV1Api$read_namespaced_ingress(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceNetworkingV1NamespacedIngress replace the specified
  Ingress

------------------------------------------------------------------------

### Method `replace_namespaced_ingress()`

#### Usage

    NetworkingV1Api$replace_namespaced_ingress(
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

  = NULL patchNetworkingV1NamespacedIngress partially update the
  specified Ingress

------------------------------------------------------------------------

### Method `patch_namespaced_ingress()`

#### Usage

    NetworkingV1Api$patch_namespaced_ingress(
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

  = "application/json-patch+json" deleteNetworkingV1NamespacedIngress
  delete an Ingress

------------------------------------------------------------------------

### Method `delete_namespaced_ingress()`

#### Usage

    NetworkingV1Api$delete_namespaced_ingress(
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

  = NULL readNetworkingV1NamespacedIngressStatus read status of the
  specified Ingress

------------------------------------------------------------------------

### Method `read_namespaced_ingress_status()`

#### Usage

    NetworkingV1Api$read_namespaced_ingress_status(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceNetworkingV1NamespacedIngressStatus replace status of
  the specified Ingress

------------------------------------------------------------------------

### Method `replace_namespaced_ingress_status()`

#### Usage

    NetworkingV1Api$replace_namespaced_ingress_status(
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

  = NULL patchNetworkingV1NamespacedIngressStatus partially update
  status of the specified Ingress

------------------------------------------------------------------------

### Method `patch_namespaced_ingress_status()`

#### Usage

    NetworkingV1Api$patch_namespaced_ingress_status(
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
  listNetworkingV1NamespacedNetworkPolicy list or watch objects of kind
  NetworkPolicy

------------------------------------------------------------------------

### Method `list_namespaced_network_policy()`

#### Usage

    NetworkingV1Api$list_namespaced_network_policy(
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

  = NULL createNetworkingV1NamespacedNetworkPolicy create a
  NetworkPolicy

------------------------------------------------------------------------

### Method `create_namespaced_network_policy()`

#### Usage

    NetworkingV1Api$create_namespaced_network_policy(
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

  = NULL deleteNetworkingV1CollectionNamespacedNetworkPolicy delete
  collection of NetworkPolicy

------------------------------------------------------------------------

### Method `delete_collection_namespaced_network_policy()`

#### Usage

    NetworkingV1Api$delete_collection_namespaced_network_policy(
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

  = NULL readNetworkingV1NamespacedNetworkPolicy read the specified
  NetworkPolicy

------------------------------------------------------------------------

### Method `read_namespaced_network_policy()`

#### Usage

    NetworkingV1Api$read_namespaced_network_policy(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceNetworkingV1NamespacedNetworkPolicy replace the
  specified NetworkPolicy

------------------------------------------------------------------------

### Method `replace_namespaced_network_policy()`

#### Usage

    NetworkingV1Api$replace_namespaced_network_policy(
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

  = NULL patchNetworkingV1NamespacedNetworkPolicy partially update the
  specified NetworkPolicy

------------------------------------------------------------------------

### Method `patch_namespaced_network_policy()`

#### Usage

    NetworkingV1Api$patch_namespaced_network_policy(
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
  deleteNetworkingV1NamespacedNetworkPolicy delete a NetworkPolicy

------------------------------------------------------------------------

### Method `delete_namespaced_network_policy()`

#### Usage

    NetworkingV1Api$delete_namespaced_network_policy(
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

  = NULL listNetworkingV1NetworkPolicyForAllNamespaces list or watch
  objects of kind NetworkPolicy

------------------------------------------------------------------------

### Method `list_network_policy_for_all_namespaces()`

#### Usage

    NetworkingV1Api$list_network_policy_for_all_namespaces(
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

  = NULL watchNetworkingV1IngressClassList watch individual changes to a
  list of IngressClass. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_ingress_class_list()`

#### Usage

    NetworkingV1Api$watch_ingress_class_list(
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

  = NULL watchNetworkingV1IngressClass watch changes to an object of
  kind IngressClass. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_ingress_class()`

#### Usage

    NetworkingV1Api$watch_ingress_class(
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

  = NULL watchNetworkingV1IngressListForAllNamespaces watch individual
  changes to a list of Ingress. deprecated: use the 'watch' parameter
  with a list operation instead.

------------------------------------------------------------------------

### Method `watch_ingress_list_for_all_namespaces()`

#### Usage

    NetworkingV1Api$watch_ingress_list_for_all_namespaces(
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

  = NULL watchNetworkingV1NamespacedIngressList watch individual changes
  to a list of Ingress. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_ingress_list()`

#### Usage

    NetworkingV1Api$watch_namespaced_ingress_list(
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

  = NULL watchNetworkingV1NamespacedIngress watch changes to an object
  of kind Ingress. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_ingress()`

#### Usage

    NetworkingV1Api$watch_namespaced_ingress(
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

  = NULL watchNetworkingV1NamespacedNetworkPolicyList watch individual
  changes to a list of NetworkPolicy. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_network_policy_list()`

#### Usage

    NetworkingV1Api$watch_namespaced_network_policy_list(
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

  = NULL watchNetworkingV1NamespacedNetworkPolicy watch changes to an
  object of kind NetworkPolicy. deprecated: use the 'watch' parameter
  with a list operation instead, filtered to a single item with the
  'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_network_policy()`

#### Usage

    NetworkingV1Api$watch_namespaced_network_policy(
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

  = NULL watchNetworkingV1NetworkPolicyListForAllNamespaces watch
  individual changes to a list of NetworkPolicy. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_network_policy_list_for_all_namespaces()`

#### Usage

    NetworkingV1Api$watch_network_policy_list_for_all_namespaces(
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

    NetworkingV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
