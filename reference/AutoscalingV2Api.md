# AutoscalingV2Api

AutoscalingV2Api

AutoscalingV2Api

## Details

Typed Kubernetes API client for the \`AutoscalingV2\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`AutoscalingV2Api$new()`](#method-AutoscalingV2Api-new)

- [`AutoscalingV2Api$get_api_resources()`](#method-AutoscalingV2Api-get_api_resources)

- [`AutoscalingV2Api$list_horizontal_pod_autoscaler_for_all_namespaces()`](#method-AutoscalingV2Api-list_horizontal_pod_autoscaler_for_all_namespaces)

- [`AutoscalingV2Api$list_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV2Api-list_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV2Api$create_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV2Api-create_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV2Api$delete_collection_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV2Api-delete_collection_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV2Api$read_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV2Api-read_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV2Api$replace_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV2Api-replace_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV2Api$patch_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV2Api-patch_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV2Api$delete_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV2Api-delete_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV2Api$read_namespaced_horizontal_pod_autoscaler_status()`](#method-AutoscalingV2Api-read_namespaced_horizontal_pod_autoscaler_status)

- [`AutoscalingV2Api$replace_namespaced_horizontal_pod_autoscaler_status()`](#method-AutoscalingV2Api-replace_namespaced_horizontal_pod_autoscaler_status)

- [`AutoscalingV2Api$patch_namespaced_horizontal_pod_autoscaler_status()`](#method-AutoscalingV2Api-patch_namespaced_horizontal_pod_autoscaler_status)

- [`AutoscalingV2Api$watch_horizontal_pod_autoscaler_list_for_all_namespaces()`](#method-AutoscalingV2Api-watch_horizontal_pod_autoscaler_list_for_all_namespaces)

- [`AutoscalingV2Api$watch_namespaced_horizontal_pod_autoscaler_list()`](#method-AutoscalingV2Api-watch_namespaced_horizontal_pod_autoscaler_list)

- [`AutoscalingV2Api$watch_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV2Api-watch_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV2Api$clone()`](#method-AutoscalingV2Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    AutoscalingV2Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getAutoscalingV2APIResources get available resources
  listAutoscalingV2HorizontalPodAutoscalerForAllNamespaces list or watch
  objects of kind HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    AutoscalingV2Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_horizontal_pod_autoscaler_for_all_namespaces()`

#### Usage

    AutoscalingV2Api$list_horizontal_pod_autoscaler_for_all_namespaces(
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

  = NULL listAutoscalingV2NamespacedHorizontalPodAutoscaler list or
  watch objects of kind HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `list_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV2Api$list_namespaced_horizontal_pod_autoscaler(
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

  = NULL createAutoscalingV2NamespacedHorizontalPodAutoscaler create a
  HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `create_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV2Api$create_namespaced_horizontal_pod_autoscaler(
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

  = NULL deleteAutoscalingV2CollectionNamespacedHorizontalPodAutoscaler
  delete collection of HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `delete_collection_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV2Api$delete_collection_namespaced_horizontal_pod_autoscaler(
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

  = NULL readAutoscalingV2NamespacedHorizontalPodAutoscaler read the
  specified HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `read_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV2Api$read_namespaced_horizontal_pod_autoscaler(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceAutoscalingV2NamespacedHorizontalPodAutoscaler replace
  the specified HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `replace_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV2Api$replace_namespaced_horizontal_pod_autoscaler(
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

  = NULL patchAutoscalingV2NamespacedHorizontalPodAutoscaler partially
  update the specified HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `patch_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV2Api$patch_namespaced_horizontal_pod_autoscaler(
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
  deleteAutoscalingV2NamespacedHorizontalPodAutoscaler delete a
  HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `delete_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV2Api$delete_namespaced_horizontal_pod_autoscaler(
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

  = NULL readAutoscalingV2NamespacedHorizontalPodAutoscalerStatus read
  status of the specified HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `read_namespaced_horizontal_pod_autoscaler_status()`

#### Usage

    AutoscalingV2Api$read_namespaced_horizontal_pod_autoscaler_status(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceAutoscalingV2NamespacedHorizontalPodAutoscalerStatus
  replace status of the specified HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `replace_namespaced_horizontal_pod_autoscaler_status()`

#### Usage

    AutoscalingV2Api$replace_namespaced_horizontal_pod_autoscaler_status(
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

  = NULL patchAutoscalingV2NamespacedHorizontalPodAutoscalerStatus
  partially update status of the specified HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `patch_namespaced_horizontal_pod_autoscaler_status()`

#### Usage

    AutoscalingV2Api$patch_namespaced_horizontal_pod_autoscaler_status(
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
  watchAutoscalingV2HorizontalPodAutoscalerListForAllNamespaces watch
  individual changes to a list of HorizontalPodAutoscaler. deprecated:
  use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_horizontal_pod_autoscaler_list_for_all_namespaces()`

#### Usage

    AutoscalingV2Api$watch_horizontal_pod_autoscaler_list_for_all_namespaces(
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

  = NULL watchAutoscalingV2NamespacedHorizontalPodAutoscalerList watch
  individual changes to a list of HorizontalPodAutoscaler. deprecated:
  use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_horizontal_pod_autoscaler_list()`

#### Usage

    AutoscalingV2Api$watch_namespaced_horizontal_pod_autoscaler_list(
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

  = NULL watchAutoscalingV2NamespacedHorizontalPodAutoscaler watch
  changes to an object of kind HorizontalPodAutoscaler. deprecated: use
  the 'watch' parameter with a list operation instead, filtered to a
  single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV2Api$watch_namespaced_horizontal_pod_autoscaler(
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

    AutoscalingV2Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
