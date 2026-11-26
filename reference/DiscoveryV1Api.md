# DiscoveryV1Api

DiscoveryV1Api

DiscoveryV1Api

## Details

Typed Kubernetes API client for the \`DiscoveryV1\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`DiscoveryV1Api$new()`](#method-DiscoveryV1Api-new)

- [`DiscoveryV1Api$get_api_resources()`](#method-DiscoveryV1Api-get_api_resources)

- [`DiscoveryV1Api$list_endpoint_slice_for_all_namespaces()`](#method-DiscoveryV1Api-list_endpoint_slice_for_all_namespaces)

- [`DiscoveryV1Api$list_namespaced_endpoint_slice()`](#method-DiscoveryV1Api-list_namespaced_endpoint_slice)

- [`DiscoveryV1Api$create_namespaced_endpoint_slice()`](#method-DiscoveryV1Api-create_namespaced_endpoint_slice)

- [`DiscoveryV1Api$delete_collection_namespaced_endpoint_slice()`](#method-DiscoveryV1Api-delete_collection_namespaced_endpoint_slice)

- [`DiscoveryV1Api$read_namespaced_endpoint_slice()`](#method-DiscoveryV1Api-read_namespaced_endpoint_slice)

- [`DiscoveryV1Api$replace_namespaced_endpoint_slice()`](#method-DiscoveryV1Api-replace_namespaced_endpoint_slice)

- [`DiscoveryV1Api$patch_namespaced_endpoint_slice()`](#method-DiscoveryV1Api-patch_namespaced_endpoint_slice)

- [`DiscoveryV1Api$delete_namespaced_endpoint_slice()`](#method-DiscoveryV1Api-delete_namespaced_endpoint_slice)

- [`DiscoveryV1Api$watch_endpoint_slice_list_for_all_namespaces()`](#method-DiscoveryV1Api-watch_endpoint_slice_list_for_all_namespaces)

- [`DiscoveryV1Api$watch_namespaced_endpoint_slice_list()`](#method-DiscoveryV1Api-watch_namespaced_endpoint_slice_list)

- [`DiscoveryV1Api$watch_namespaced_endpoint_slice()`](#method-DiscoveryV1Api-watch_namespaced_endpoint_slice)

- [`DiscoveryV1Api$clone()`](#method-DiscoveryV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    DiscoveryV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getDiscoveryV1APIResources get available resources
  listDiscoveryV1EndpointSliceForAllNamespaces list or watch objects of
  kind EndpointSlice

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    DiscoveryV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_endpoint_slice_for_all_namespaces()`

#### Usage

    DiscoveryV1Api$list_endpoint_slice_for_all_namespaces(
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

  = NULL listDiscoveryV1NamespacedEndpointSlice list or watch objects of
  kind EndpointSlice

------------------------------------------------------------------------

### Method `list_namespaced_endpoint_slice()`

#### Usage

    DiscoveryV1Api$list_namespaced_endpoint_slice(
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

  = NULL createDiscoveryV1NamespacedEndpointSlice create an
  EndpointSlice

------------------------------------------------------------------------

### Method `create_namespaced_endpoint_slice()`

#### Usage

    DiscoveryV1Api$create_namespaced_endpoint_slice(
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

  = NULL deleteDiscoveryV1CollectionNamespacedEndpointSlice delete
  collection of EndpointSlice

------------------------------------------------------------------------

### Method `delete_collection_namespaced_endpoint_slice()`

#### Usage

    DiscoveryV1Api$delete_collection_namespaced_endpoint_slice(
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

  = NULL readDiscoveryV1NamespacedEndpointSlice read the specified
  EndpointSlice

------------------------------------------------------------------------

### Method `read_namespaced_endpoint_slice()`

#### Usage

    DiscoveryV1Api$read_namespaced_endpoint_slice(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceDiscoveryV1NamespacedEndpointSlice replace the specified
  EndpointSlice

------------------------------------------------------------------------

### Method `replace_namespaced_endpoint_slice()`

#### Usage

    DiscoveryV1Api$replace_namespaced_endpoint_slice(
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

  = NULL patchDiscoveryV1NamespacedEndpointSlice partially update the
  specified EndpointSlice

------------------------------------------------------------------------

### Method `patch_namespaced_endpoint_slice()`

#### Usage

    DiscoveryV1Api$patch_namespaced_endpoint_slice(
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
  deleteDiscoveryV1NamespacedEndpointSlice delete an EndpointSlice

------------------------------------------------------------------------

### Method `delete_namespaced_endpoint_slice()`

#### Usage

    DiscoveryV1Api$delete_namespaced_endpoint_slice(
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

  = NULL watchDiscoveryV1EndpointSliceListForAllNamespaces watch
  individual changes to a list of EndpointSlice. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_endpoint_slice_list_for_all_namespaces()`

#### Usage

    DiscoveryV1Api$watch_endpoint_slice_list_for_all_namespaces(
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

  = NULL watchDiscoveryV1NamespacedEndpointSliceList watch individual
  changes to a list of EndpointSlice. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_endpoint_slice_list()`

#### Usage

    DiscoveryV1Api$watch_namespaced_endpoint_slice_list(
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

  = NULL watchDiscoveryV1NamespacedEndpointSlice watch changes to an
  object of kind EndpointSlice. deprecated: use the 'watch' parameter
  with a list operation instead, filtered to a single item with the
  'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_endpoint_slice()`

#### Usage

    DiscoveryV1Api$watch_namespaced_endpoint_slice(
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

    DiscoveryV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
