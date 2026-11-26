# ResourceV1alpha3Api

ResourceV1alpha3Api

ResourceV1alpha3Api

## Details

Typed Kubernetes API client for the \`ResourceV1alpha3\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`ResourceV1alpha3Api$new()`](#method-ResourceV1alpha3Api-new)

- [`ResourceV1alpha3Api$get_api_resources()`](#method-ResourceV1alpha3Api-get_api_resources)

- [`ResourceV1alpha3Api$list_device_class()`](#method-ResourceV1alpha3Api-list_device_class)

- [`ResourceV1alpha3Api$create_device_class()`](#method-ResourceV1alpha3Api-create_device_class)

- [`ResourceV1alpha3Api$delete_collection_device_class()`](#method-ResourceV1alpha3Api-delete_collection_device_class)

- [`ResourceV1alpha3Api$read_device_class()`](#method-ResourceV1alpha3Api-read_device_class)

- [`ResourceV1alpha3Api$replace_device_class()`](#method-ResourceV1alpha3Api-replace_device_class)

- [`ResourceV1alpha3Api$patch_device_class()`](#method-ResourceV1alpha3Api-patch_device_class)

- [`ResourceV1alpha3Api$delete_device_class()`](#method-ResourceV1alpha3Api-delete_device_class)

- [`ResourceV1alpha3Api$list_namespaced_pod_scheduling_context()`](#method-ResourceV1alpha3Api-list_namespaced_pod_scheduling_context)

- [`ResourceV1alpha3Api$create_namespaced_pod_scheduling_context()`](#method-ResourceV1alpha3Api-create_namespaced_pod_scheduling_context)

- [`ResourceV1alpha3Api$delete_collection_namespaced_pod_scheduling_context()`](#method-ResourceV1alpha3Api-delete_collection_namespaced_pod_scheduling_context)

- [`ResourceV1alpha3Api$read_namespaced_pod_scheduling_context()`](#method-ResourceV1alpha3Api-read_namespaced_pod_scheduling_context)

- [`ResourceV1alpha3Api$replace_namespaced_pod_scheduling_context()`](#method-ResourceV1alpha3Api-replace_namespaced_pod_scheduling_context)

- [`ResourceV1alpha3Api$patch_namespaced_pod_scheduling_context()`](#method-ResourceV1alpha3Api-patch_namespaced_pod_scheduling_context)

- [`ResourceV1alpha3Api$delete_namespaced_pod_scheduling_context()`](#method-ResourceV1alpha3Api-delete_namespaced_pod_scheduling_context)

- [`ResourceV1alpha3Api$read_namespaced_pod_scheduling_context_status()`](#method-ResourceV1alpha3Api-read_namespaced_pod_scheduling_context_status)

- [`ResourceV1alpha3Api$replace_namespaced_pod_scheduling_context_status()`](#method-ResourceV1alpha3Api-replace_namespaced_pod_scheduling_context_status)

- [`ResourceV1alpha3Api$patch_namespaced_pod_scheduling_context_status()`](#method-ResourceV1alpha3Api-patch_namespaced_pod_scheduling_context_status)

- [`ResourceV1alpha3Api$list_namespaced_resource_claim()`](#method-ResourceV1alpha3Api-list_namespaced_resource_claim)

- [`ResourceV1alpha3Api$create_namespaced_resource_claim()`](#method-ResourceV1alpha3Api-create_namespaced_resource_claim)

- [`ResourceV1alpha3Api$delete_collection_namespaced_resource_claim()`](#method-ResourceV1alpha3Api-delete_collection_namespaced_resource_claim)

- [`ResourceV1alpha3Api$read_namespaced_resource_claim()`](#method-ResourceV1alpha3Api-read_namespaced_resource_claim)

- [`ResourceV1alpha3Api$replace_namespaced_resource_claim()`](#method-ResourceV1alpha3Api-replace_namespaced_resource_claim)

- [`ResourceV1alpha3Api$patch_namespaced_resource_claim()`](#method-ResourceV1alpha3Api-patch_namespaced_resource_claim)

- [`ResourceV1alpha3Api$delete_namespaced_resource_claim()`](#method-ResourceV1alpha3Api-delete_namespaced_resource_claim)

- [`ResourceV1alpha3Api$read_namespaced_resource_claim_status()`](#method-ResourceV1alpha3Api-read_namespaced_resource_claim_status)

- [`ResourceV1alpha3Api$replace_namespaced_resource_claim_status()`](#method-ResourceV1alpha3Api-replace_namespaced_resource_claim_status)

- [`ResourceV1alpha3Api$patch_namespaced_resource_claim_status()`](#method-ResourceV1alpha3Api-patch_namespaced_resource_claim_status)

- [`ResourceV1alpha3Api$list_namespaced_resource_claim_template()`](#method-ResourceV1alpha3Api-list_namespaced_resource_claim_template)

- [`ResourceV1alpha3Api$create_namespaced_resource_claim_template()`](#method-ResourceV1alpha3Api-create_namespaced_resource_claim_template)

- [`ResourceV1alpha3Api$delete_collection_namespaced_resource_claim_template()`](#method-ResourceV1alpha3Api-delete_collection_namespaced_resource_claim_template)

- [`ResourceV1alpha3Api$read_namespaced_resource_claim_template()`](#method-ResourceV1alpha3Api-read_namespaced_resource_claim_template)

- [`ResourceV1alpha3Api$replace_namespaced_resource_claim_template()`](#method-ResourceV1alpha3Api-replace_namespaced_resource_claim_template)

- [`ResourceV1alpha3Api$patch_namespaced_resource_claim_template()`](#method-ResourceV1alpha3Api-patch_namespaced_resource_claim_template)

- [`ResourceV1alpha3Api$delete_namespaced_resource_claim_template()`](#method-ResourceV1alpha3Api-delete_namespaced_resource_claim_template)

- [`ResourceV1alpha3Api$list_pod_scheduling_context_for_all_namespaces()`](#method-ResourceV1alpha3Api-list_pod_scheduling_context_for_all_namespaces)

- [`ResourceV1alpha3Api$list_resource_claim_for_all_namespaces()`](#method-ResourceV1alpha3Api-list_resource_claim_for_all_namespaces)

- [`ResourceV1alpha3Api$list_resource_claim_template_for_all_namespaces()`](#method-ResourceV1alpha3Api-list_resource_claim_template_for_all_namespaces)

- [`ResourceV1alpha3Api$list_resource_slice()`](#method-ResourceV1alpha3Api-list_resource_slice)

- [`ResourceV1alpha3Api$create_resource_slice()`](#method-ResourceV1alpha3Api-create_resource_slice)

- [`ResourceV1alpha3Api$delete_collection_resource_slice()`](#method-ResourceV1alpha3Api-delete_collection_resource_slice)

- [`ResourceV1alpha3Api$read_resource_slice()`](#method-ResourceV1alpha3Api-read_resource_slice)

- [`ResourceV1alpha3Api$replace_resource_slice()`](#method-ResourceV1alpha3Api-replace_resource_slice)

- [`ResourceV1alpha3Api$patch_resource_slice()`](#method-ResourceV1alpha3Api-patch_resource_slice)

- [`ResourceV1alpha3Api$delete_resource_slice()`](#method-ResourceV1alpha3Api-delete_resource_slice)

- [`ResourceV1alpha3Api$watch_device_class_list()`](#method-ResourceV1alpha3Api-watch_device_class_list)

- [`ResourceV1alpha3Api$watch_device_class()`](#method-ResourceV1alpha3Api-watch_device_class)

- [`ResourceV1alpha3Api$watch_namespaced_pod_scheduling_context_list()`](#method-ResourceV1alpha3Api-watch_namespaced_pod_scheduling_context_list)

- [`ResourceV1alpha3Api$watch_namespaced_pod_scheduling_context()`](#method-ResourceV1alpha3Api-watch_namespaced_pod_scheduling_context)

- [`ResourceV1alpha3Api$watch_namespaced_resource_claim_list()`](#method-ResourceV1alpha3Api-watch_namespaced_resource_claim_list)

- [`ResourceV1alpha3Api$watch_namespaced_resource_claim()`](#method-ResourceV1alpha3Api-watch_namespaced_resource_claim)

- [`ResourceV1alpha3Api$watch_namespaced_resource_claim_template_list()`](#method-ResourceV1alpha3Api-watch_namespaced_resource_claim_template_list)

- [`ResourceV1alpha3Api$watch_namespaced_resource_claim_template()`](#method-ResourceV1alpha3Api-watch_namespaced_resource_claim_template)

- [`ResourceV1alpha3Api$watch_pod_scheduling_context_list_for_all_namespaces()`](#method-ResourceV1alpha3Api-watch_pod_scheduling_context_list_for_all_namespaces)

- [`ResourceV1alpha3Api$watch_resource_claim_list_for_all_namespaces()`](#method-ResourceV1alpha3Api-watch_resource_claim_list_for_all_namespaces)

- [`ResourceV1alpha3Api$watch_resource_claim_template_list_for_all_namespaces()`](#method-ResourceV1alpha3Api-watch_resource_claim_template_list_for_all_namespaces)

- [`ResourceV1alpha3Api$watch_resource_slice_list()`](#method-ResourceV1alpha3Api-watch_resource_slice_list)

- [`ResourceV1alpha3Api$watch_resource_slice()`](#method-ResourceV1alpha3Api-watch_resource_slice)

- [`ResourceV1alpha3Api$clone()`](#method-ResourceV1alpha3Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    ResourceV1alpha3Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getResourceV1alpha3APIResources get available
  resources listResourceV1alpha3DeviceClass list or watch objects of
  kind DeviceClass

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    ResourceV1alpha3Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_device_class()`

#### Usage

    ResourceV1alpha3Api$list_device_class(
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

  = NULL createResourceV1alpha3DeviceClass create a DeviceClass

------------------------------------------------------------------------

### Method `create_device_class()`

#### Usage

    ResourceV1alpha3Api$create_device_class(
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

  = NULL deleteResourceV1alpha3CollectionDeviceClass delete collection
  of DeviceClass

------------------------------------------------------------------------

### Method `delete_collection_device_class()`

#### Usage

    ResourceV1alpha3Api$delete_collection_device_class(
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

  = NULL readResourceV1alpha3DeviceClass read the specified DeviceClass

------------------------------------------------------------------------

### Method `read_device_class()`

#### Usage

    ResourceV1alpha3Api$read_device_class(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceResourceV1alpha3DeviceClass replace the specified
  DeviceClass

------------------------------------------------------------------------

### Method `replace_device_class()`

#### Usage

    ResourceV1alpha3Api$replace_device_class(
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

  = NULL patchResourceV1alpha3DeviceClass partially update the specified
  DeviceClass

------------------------------------------------------------------------

### Method `patch_device_class()`

#### Usage

    ResourceV1alpha3Api$patch_device_class(
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

  = "application/json-patch+json" deleteResourceV1alpha3DeviceClass
  delete a DeviceClass

------------------------------------------------------------------------

### Method `delete_device_class()`

#### Usage

    ResourceV1alpha3Api$delete_device_class(
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

  = NULL listResourceV1alpha3NamespacedPodSchedulingContext list or
  watch objects of kind PodSchedulingContext

------------------------------------------------------------------------

### Method `list_namespaced_pod_scheduling_context()`

#### Usage

    ResourceV1alpha3Api$list_namespaced_pod_scheduling_context(
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

  = NULL createResourceV1alpha3NamespacedPodSchedulingContext create a
  PodSchedulingContext

------------------------------------------------------------------------

### Method `create_namespaced_pod_scheduling_context()`

#### Usage

    ResourceV1alpha3Api$create_namespaced_pod_scheduling_context(
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

  = NULL deleteResourceV1alpha3CollectionNamespacedPodSchedulingContext
  delete collection of PodSchedulingContext

------------------------------------------------------------------------

### Method `delete_collection_namespaced_pod_scheduling_context()`

#### Usage

    ResourceV1alpha3Api$delete_collection_namespaced_pod_scheduling_context(
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

  = NULL readResourceV1alpha3NamespacedPodSchedulingContext read the
  specified PodSchedulingContext

------------------------------------------------------------------------

### Method `read_namespaced_pod_scheduling_context()`

#### Usage

    ResourceV1alpha3Api$read_namespaced_pod_scheduling_context(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceResourceV1alpha3NamespacedPodSchedulingContext replace
  the specified PodSchedulingContext

------------------------------------------------------------------------

### Method `replace_namespaced_pod_scheduling_context()`

#### Usage

    ResourceV1alpha3Api$replace_namespaced_pod_scheduling_context(
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

  = NULL patchResourceV1alpha3NamespacedPodSchedulingContext partially
  update the specified PodSchedulingContext

------------------------------------------------------------------------

### Method `patch_namespaced_pod_scheduling_context()`

#### Usage

    ResourceV1alpha3Api$patch_namespaced_pod_scheduling_context(
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
  deleteResourceV1alpha3NamespacedPodSchedulingContext delete a
  PodSchedulingContext

------------------------------------------------------------------------

### Method `delete_namespaced_pod_scheduling_context()`

#### Usage

    ResourceV1alpha3Api$delete_namespaced_pod_scheduling_context(
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

  = NULL readResourceV1alpha3NamespacedPodSchedulingContextStatus read
  status of the specified PodSchedulingContext

------------------------------------------------------------------------

### Method `read_namespaced_pod_scheduling_context_status()`

#### Usage

    ResourceV1alpha3Api$read_namespaced_pod_scheduling_context_status(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceResourceV1alpha3NamespacedPodSchedulingContextStatus
  replace status of the specified PodSchedulingContext

------------------------------------------------------------------------

### Method `replace_namespaced_pod_scheduling_context_status()`

#### Usage

    ResourceV1alpha3Api$replace_namespaced_pod_scheduling_context_status(
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

  = NULL patchResourceV1alpha3NamespacedPodSchedulingContextStatus
  partially update status of the specified PodSchedulingContext

------------------------------------------------------------------------

### Method `patch_namespaced_pod_scheduling_context_status()`

#### Usage

    ResourceV1alpha3Api$patch_namespaced_pod_scheduling_context_status(
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
  listResourceV1alpha3NamespacedResourceClaim list or watch objects of
  kind ResourceClaim

------------------------------------------------------------------------

### Method `list_namespaced_resource_claim()`

#### Usage

    ResourceV1alpha3Api$list_namespaced_resource_claim(
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

  = NULL createResourceV1alpha3NamespacedResourceClaim create a
  ResourceClaim

------------------------------------------------------------------------

### Method `create_namespaced_resource_claim()`

#### Usage

    ResourceV1alpha3Api$create_namespaced_resource_claim(
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

  = NULL deleteResourceV1alpha3CollectionNamespacedResourceClaim delete
  collection of ResourceClaim

------------------------------------------------------------------------

### Method `delete_collection_namespaced_resource_claim()`

#### Usage

    ResourceV1alpha3Api$delete_collection_namespaced_resource_claim(
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

  = NULL readResourceV1alpha3NamespacedResourceClaim read the specified
  ResourceClaim

------------------------------------------------------------------------

### Method `read_namespaced_resource_claim()`

#### Usage

    ResourceV1alpha3Api$read_namespaced_resource_claim(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceResourceV1alpha3NamespacedResourceClaim replace the
  specified ResourceClaim

------------------------------------------------------------------------

### Method `replace_namespaced_resource_claim()`

#### Usage

    ResourceV1alpha3Api$replace_namespaced_resource_claim(
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

  = NULL patchResourceV1alpha3NamespacedResourceClaim partially update
  the specified ResourceClaim

------------------------------------------------------------------------

### Method `patch_namespaced_resource_claim()`

#### Usage

    ResourceV1alpha3Api$patch_namespaced_resource_claim(
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
  deleteResourceV1alpha3NamespacedResourceClaim delete a ResourceClaim

------------------------------------------------------------------------

### Method `delete_namespaced_resource_claim()`

#### Usage

    ResourceV1alpha3Api$delete_namespaced_resource_claim(
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

  = NULL readResourceV1alpha3NamespacedResourceClaimStatus read status
  of the specified ResourceClaim

------------------------------------------------------------------------

### Method `read_namespaced_resource_claim_status()`

#### Usage

    ResourceV1alpha3Api$read_namespaced_resource_claim_status(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceResourceV1alpha3NamespacedResourceClaimStatus replace
  status of the specified ResourceClaim

------------------------------------------------------------------------

### Method `replace_namespaced_resource_claim_status()`

#### Usage

    ResourceV1alpha3Api$replace_namespaced_resource_claim_status(
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

  = NULL patchResourceV1alpha3NamespacedResourceClaimStatus partially
  update status of the specified ResourceClaim

------------------------------------------------------------------------

### Method `patch_namespaced_resource_claim_status()`

#### Usage

    ResourceV1alpha3Api$patch_namespaced_resource_claim_status(
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
  listResourceV1alpha3NamespacedResourceClaimTemplate list or watch
  objects of kind ResourceClaimTemplate

------------------------------------------------------------------------

### Method `list_namespaced_resource_claim_template()`

#### Usage

    ResourceV1alpha3Api$list_namespaced_resource_claim_template(
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

  = NULL createResourceV1alpha3NamespacedResourceClaimTemplate create a
  ResourceClaimTemplate

------------------------------------------------------------------------

### Method `create_namespaced_resource_claim_template()`

#### Usage

    ResourceV1alpha3Api$create_namespaced_resource_claim_template(
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

  = NULL deleteResourceV1alpha3CollectionNamespacedResourceClaimTemplate
  delete collection of ResourceClaimTemplate

------------------------------------------------------------------------

### Method `delete_collection_namespaced_resource_claim_template()`

#### Usage

    ResourceV1alpha3Api$delete_collection_namespaced_resource_claim_template(
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

  = NULL readResourceV1alpha3NamespacedResourceClaimTemplate read the
  specified ResourceClaimTemplate

------------------------------------------------------------------------

### Method `read_namespaced_resource_claim_template()`

#### Usage

    ResourceV1alpha3Api$read_namespaced_resource_claim_template(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceResourceV1alpha3NamespacedResourceClaimTemplate replace
  the specified ResourceClaimTemplate

------------------------------------------------------------------------

### Method `replace_namespaced_resource_claim_template()`

#### Usage

    ResourceV1alpha3Api$replace_namespaced_resource_claim_template(
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

  = NULL patchResourceV1alpha3NamespacedResourceClaimTemplate partially
  update the specified ResourceClaimTemplate

------------------------------------------------------------------------

### Method `patch_namespaced_resource_claim_template()`

#### Usage

    ResourceV1alpha3Api$patch_namespaced_resource_claim_template(
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
  deleteResourceV1alpha3NamespacedResourceClaimTemplate delete a
  ResourceClaimTemplate

------------------------------------------------------------------------

### Method `delete_namespaced_resource_claim_template()`

#### Usage

    ResourceV1alpha3Api$delete_namespaced_resource_claim_template(
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

  = NULL listResourceV1alpha3PodSchedulingContextForAllNamespaces list
  or watch objects of kind PodSchedulingContext

------------------------------------------------------------------------

### Method `list_pod_scheduling_context_for_all_namespaces()`

#### Usage

    ResourceV1alpha3Api$list_pod_scheduling_context_for_all_namespaces(
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

  = NULL listResourceV1alpha3ResourceClaimForAllNamespaces list or watch
  objects of kind ResourceClaim

------------------------------------------------------------------------

### Method `list_resource_claim_for_all_namespaces()`

#### Usage

    ResourceV1alpha3Api$list_resource_claim_for_all_namespaces(
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

  = NULL listResourceV1alpha3ResourceClaimTemplateForAllNamespaces list
  or watch objects of kind ResourceClaimTemplate

------------------------------------------------------------------------

### Method `list_resource_claim_template_for_all_namespaces()`

#### Usage

    ResourceV1alpha3Api$list_resource_claim_template_for_all_namespaces(
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

  = NULL listResourceV1alpha3ResourceSlice list or watch objects of kind
  ResourceSlice

------------------------------------------------------------------------

### Method `list_resource_slice()`

#### Usage

    ResourceV1alpha3Api$list_resource_slice(
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

  = NULL createResourceV1alpha3ResourceSlice create a ResourceSlice

------------------------------------------------------------------------

### Method `create_resource_slice()`

#### Usage

    ResourceV1alpha3Api$create_resource_slice(
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

  = NULL deleteResourceV1alpha3CollectionResourceSlice delete collection
  of ResourceSlice

------------------------------------------------------------------------

### Method `delete_collection_resource_slice()`

#### Usage

    ResourceV1alpha3Api$delete_collection_resource_slice(
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

  = NULL readResourceV1alpha3ResourceSlice read the specified
  ResourceSlice

------------------------------------------------------------------------

### Method `read_resource_slice()`

#### Usage

    ResourceV1alpha3Api$read_resource_slice(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceResourceV1alpha3ResourceSlice replace the specified
  ResourceSlice

------------------------------------------------------------------------

### Method `replace_resource_slice()`

#### Usage

    ResourceV1alpha3Api$replace_resource_slice(
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

  = NULL patchResourceV1alpha3ResourceSlice partially update the
  specified ResourceSlice

------------------------------------------------------------------------

### Method `patch_resource_slice()`

#### Usage

    ResourceV1alpha3Api$patch_resource_slice(
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

  = "application/json-patch+json" deleteResourceV1alpha3ResourceSlice
  delete a ResourceSlice

------------------------------------------------------------------------

### Method `delete_resource_slice()`

#### Usage

    ResourceV1alpha3Api$delete_resource_slice(
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

  = NULL watchResourceV1alpha3DeviceClassList watch individual changes
  to a list of DeviceClass. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_device_class_list()`

#### Usage

    ResourceV1alpha3Api$watch_device_class_list(
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

  = NULL watchResourceV1alpha3DeviceClass watch changes to an object of
  kind DeviceClass. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_device_class()`

#### Usage

    ResourceV1alpha3Api$watch_device_class(
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

  = NULL watchResourceV1alpha3NamespacedPodSchedulingContextList watch
  individual changes to a list of PodSchedulingContext. deprecated: use
  the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_pod_scheduling_context_list()`

#### Usage

    ResourceV1alpha3Api$watch_namespaced_pod_scheduling_context_list(
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

  = NULL watchResourceV1alpha3NamespacedPodSchedulingContext watch
  changes to an object of kind PodSchedulingContext. deprecated: use the
  'watch' parameter with a list operation instead, filtered to a single
  item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_pod_scheduling_context()`

#### Usage

    ResourceV1alpha3Api$watch_namespaced_pod_scheduling_context(
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

  = NULL watchResourceV1alpha3NamespacedResourceClaimList watch
  individual changes to a list of ResourceClaim. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_resource_claim_list()`

#### Usage

    ResourceV1alpha3Api$watch_namespaced_resource_claim_list(
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

  = NULL watchResourceV1alpha3NamespacedResourceClaim watch changes to
  an object of kind ResourceClaim. deprecated: use the 'watch' parameter
  with a list operation instead, filtered to a single item with the
  'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_resource_claim()`

#### Usage

    ResourceV1alpha3Api$watch_namespaced_resource_claim(
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

  = NULL watchResourceV1alpha3NamespacedResourceClaimTemplateList watch
  individual changes to a list of ResourceClaimTemplate. deprecated: use
  the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_resource_claim_template_list()`

#### Usage

    ResourceV1alpha3Api$watch_namespaced_resource_claim_template_list(
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

  = NULL watchResourceV1alpha3NamespacedResourceClaimTemplate watch
  changes to an object of kind ResourceClaimTemplate. deprecated: use
  the 'watch' parameter with a list operation instead, filtered to a
  single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_resource_claim_template()`

#### Usage

    ResourceV1alpha3Api$watch_namespaced_resource_claim_template(
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

  = NULL watchResourceV1alpha3PodSchedulingContextListForAllNamespaces
  watch individual changes to a list of PodSchedulingContext.
  deprecated: use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_pod_scheduling_context_list_for_all_namespaces()`

#### Usage

    ResourceV1alpha3Api$watch_pod_scheduling_context_list_for_all_namespaces(
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

  = NULL watchResourceV1alpha3ResourceClaimListForAllNamespaces watch
  individual changes to a list of ResourceClaim. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_resource_claim_list_for_all_namespaces()`

#### Usage

    ResourceV1alpha3Api$watch_resource_claim_list_for_all_namespaces(
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

  = NULL watchResourceV1alpha3ResourceClaimTemplateListForAllNamespaces
  watch individual changes to a list of ResourceClaimTemplate.
  deprecated: use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_resource_claim_template_list_for_all_namespaces()`

#### Usage

    ResourceV1alpha3Api$watch_resource_claim_template_list_for_all_namespaces(
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

  = NULL watchResourceV1alpha3ResourceSliceList watch individual changes
  to a list of ResourceSlice. deprecated: use the 'watch' parameter with
  a list operation instead.

------------------------------------------------------------------------

### Method `watch_resource_slice_list()`

#### Usage

    ResourceV1alpha3Api$watch_resource_slice_list(
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

  = NULL watchResourceV1alpha3ResourceSlice watch changes to an object
  of kind ResourceSlice. deprecated: use the 'watch' parameter with a
  list operation instead, filtered to a single item with the
  'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_resource_slice()`

#### Usage

    ResourceV1alpha3Api$watch_resource_slice(
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

    ResourceV1alpha3Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
