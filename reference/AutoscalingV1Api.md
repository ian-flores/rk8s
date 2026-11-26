# AutoscalingV1Api

AutoscalingV1Api

AutoscalingV1Api

## Details

Typed Kubernetes API client for the \`AutoscalingV1\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`AutoscalingV1Api$new()`](#method-AutoscalingV1Api-new)

- [`AutoscalingV1Api$get_api_resources()`](#method-AutoscalingV1Api-get_api_resources)

- [`AutoscalingV1Api$list_horizontal_pod_autoscaler_for_all_namespaces()`](#method-AutoscalingV1Api-list_horizontal_pod_autoscaler_for_all_namespaces)

- [`AutoscalingV1Api$list_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV1Api-list_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV1Api$create_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV1Api-create_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV1Api$delete_collection_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV1Api-delete_collection_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV1Api$read_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV1Api-read_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV1Api$replace_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV1Api-replace_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV1Api$patch_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV1Api-patch_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV1Api$delete_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV1Api-delete_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV1Api$read_namespaced_horizontal_pod_autoscaler_status()`](#method-AutoscalingV1Api-read_namespaced_horizontal_pod_autoscaler_status)

- [`AutoscalingV1Api$replace_namespaced_horizontal_pod_autoscaler_status()`](#method-AutoscalingV1Api-replace_namespaced_horizontal_pod_autoscaler_status)

- [`AutoscalingV1Api$patch_namespaced_horizontal_pod_autoscaler_status()`](#method-AutoscalingV1Api-patch_namespaced_horizontal_pod_autoscaler_status)

- [`AutoscalingV1Api$watch_horizontal_pod_autoscaler_list_for_all_namespaces()`](#method-AutoscalingV1Api-watch_horizontal_pod_autoscaler_list_for_all_namespaces)

- [`AutoscalingV1Api$watch_namespaced_horizontal_pod_autoscaler_list()`](#method-AutoscalingV1Api-watch_namespaced_horizontal_pod_autoscaler_list)

- [`AutoscalingV1Api$watch_namespaced_horizontal_pod_autoscaler()`](#method-AutoscalingV1Api-watch_namespaced_horizontal_pod_autoscaler)

- [`AutoscalingV1Api$clone()`](#method-AutoscalingV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    AutoscalingV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getAutoscalingV1APIResources get available resources
  listAutoscalingV1HorizontalPodAutoscalerForAllNamespaces list or watch
  objects of kind HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    AutoscalingV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_horizontal_pod_autoscaler_for_all_namespaces()`

#### Usage

    AutoscalingV1Api$list_horizontal_pod_autoscaler_for_all_namespaces(
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

  = NULL listAutoscalingV1NamespacedHorizontalPodAutoscaler list or
  watch objects of kind HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `list_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV1Api$list_namespaced_horizontal_pod_autoscaler(
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

  = NULL createAutoscalingV1NamespacedHorizontalPodAutoscaler create a
  HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `create_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV1Api$create_namespaced_horizontal_pod_autoscaler(
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

  = NULL deleteAutoscalingV1CollectionNamespacedHorizontalPodAutoscaler
  delete collection of HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `delete_collection_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV1Api$delete_collection_namespaced_horizontal_pod_autoscaler(
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

  = NULL readAutoscalingV1NamespacedHorizontalPodAutoscaler read the
  specified HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `read_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV1Api$read_namespaced_horizontal_pod_autoscaler(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceAutoscalingV1NamespacedHorizontalPodAutoscaler replace
  the specified HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `replace_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV1Api$replace_namespaced_horizontal_pod_autoscaler(
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

  = NULL patchAutoscalingV1NamespacedHorizontalPodAutoscaler partially
  update the specified HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `patch_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV1Api$patch_namespaced_horizontal_pod_autoscaler(
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
  deleteAutoscalingV1NamespacedHorizontalPodAutoscaler delete a
  HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `delete_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV1Api$delete_namespaced_horizontal_pod_autoscaler(
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

  = NULL readAutoscalingV1NamespacedHorizontalPodAutoscalerStatus read
  status of the specified HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `read_namespaced_horizontal_pod_autoscaler_status()`

#### Usage

    AutoscalingV1Api$read_namespaced_horizontal_pod_autoscaler_status(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceAutoscalingV1NamespacedHorizontalPodAutoscalerStatus
  replace status of the specified HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `replace_namespaced_horizontal_pod_autoscaler_status()`

#### Usage

    AutoscalingV1Api$replace_namespaced_horizontal_pod_autoscaler_status(
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

  = NULL patchAutoscalingV1NamespacedHorizontalPodAutoscalerStatus
  partially update status of the specified HorizontalPodAutoscaler

------------------------------------------------------------------------

### Method `patch_namespaced_horizontal_pod_autoscaler_status()`

#### Usage

    AutoscalingV1Api$patch_namespaced_horizontal_pod_autoscaler_status(
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
  watchAutoscalingV1HorizontalPodAutoscalerListForAllNamespaces watch
  individual changes to a list of HorizontalPodAutoscaler. deprecated:
  use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_horizontal_pod_autoscaler_list_for_all_namespaces()`

#### Usage

    AutoscalingV1Api$watch_horizontal_pod_autoscaler_list_for_all_namespaces(
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

  = NULL watchAutoscalingV1NamespacedHorizontalPodAutoscalerList watch
  individual changes to a list of HorizontalPodAutoscaler. deprecated:
  use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_horizontal_pod_autoscaler_list()`

#### Usage

    AutoscalingV1Api$watch_namespaced_horizontal_pod_autoscaler_list(
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

  = NULL watchAutoscalingV1NamespacedHorizontalPodAutoscaler watch
  changes to an object of kind HorizontalPodAutoscaler. deprecated: use
  the 'watch' parameter with a list operation instead, filtered to a
  single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_horizontal_pod_autoscaler()`

#### Usage

    AutoscalingV1Api$watch_namespaced_horizontal_pod_autoscaler(
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

    AutoscalingV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
