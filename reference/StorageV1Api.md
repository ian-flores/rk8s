# StorageV1Api

StorageV1Api

StorageV1Api

## Details

Typed Kubernetes API client for the \`StorageV1\` surface. See generated
methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`StorageV1Api$new()`](#method-StorageV1Api-new)

- [`StorageV1Api$get_api_resources()`](#method-StorageV1Api-get_api_resources)

- [`StorageV1Api$list_csi_driver()`](#method-StorageV1Api-list_csi_driver)

- [`StorageV1Api$create_csi_driver()`](#method-StorageV1Api-create_csi_driver)

- [`StorageV1Api$delete_collection_csi_driver()`](#method-StorageV1Api-delete_collection_csi_driver)

- [`StorageV1Api$read_csi_driver()`](#method-StorageV1Api-read_csi_driver)

- [`StorageV1Api$replace_csi_driver()`](#method-StorageV1Api-replace_csi_driver)

- [`StorageV1Api$patch_csi_driver()`](#method-StorageV1Api-patch_csi_driver)

- [`StorageV1Api$delete_csi_driver()`](#method-StorageV1Api-delete_csi_driver)

- [`StorageV1Api$list_csi_node()`](#method-StorageV1Api-list_csi_node)

- [`StorageV1Api$create_csi_node()`](#method-StorageV1Api-create_csi_node)

- [`StorageV1Api$delete_collection_csi_node()`](#method-StorageV1Api-delete_collection_csi_node)

- [`StorageV1Api$read_csi_node()`](#method-StorageV1Api-read_csi_node)

- [`StorageV1Api$replace_csi_node()`](#method-StorageV1Api-replace_csi_node)

- [`StorageV1Api$patch_csi_node()`](#method-StorageV1Api-patch_csi_node)

- [`StorageV1Api$delete_csi_node()`](#method-StorageV1Api-delete_csi_node)

- [`StorageV1Api$list_csi_storage_capacity_for_all_namespaces()`](#method-StorageV1Api-list_csi_storage_capacity_for_all_namespaces)

- [`StorageV1Api$list_namespaced_csi_storage_capacity()`](#method-StorageV1Api-list_namespaced_csi_storage_capacity)

- [`StorageV1Api$create_namespaced_csi_storage_capacity()`](#method-StorageV1Api-create_namespaced_csi_storage_capacity)

- [`StorageV1Api$delete_collection_namespaced_csi_storage_capacity()`](#method-StorageV1Api-delete_collection_namespaced_csi_storage_capacity)

- [`StorageV1Api$read_namespaced_csi_storage_capacity()`](#method-StorageV1Api-read_namespaced_csi_storage_capacity)

- [`StorageV1Api$replace_namespaced_csi_storage_capacity()`](#method-StorageV1Api-replace_namespaced_csi_storage_capacity)

- [`StorageV1Api$patch_namespaced_csi_storage_capacity()`](#method-StorageV1Api-patch_namespaced_csi_storage_capacity)

- [`StorageV1Api$delete_namespaced_csi_storage_capacity()`](#method-StorageV1Api-delete_namespaced_csi_storage_capacity)

- [`StorageV1Api$list_storage_class()`](#method-StorageV1Api-list_storage_class)

- [`StorageV1Api$create_storage_class()`](#method-StorageV1Api-create_storage_class)

- [`StorageV1Api$delete_collection_storage_class()`](#method-StorageV1Api-delete_collection_storage_class)

- [`StorageV1Api$read_storage_class()`](#method-StorageV1Api-read_storage_class)

- [`StorageV1Api$replace_storage_class()`](#method-StorageV1Api-replace_storage_class)

- [`StorageV1Api$patch_storage_class()`](#method-StorageV1Api-patch_storage_class)

- [`StorageV1Api$delete_storage_class()`](#method-StorageV1Api-delete_storage_class)

- [`StorageV1Api$list_volume_attachment()`](#method-StorageV1Api-list_volume_attachment)

- [`StorageV1Api$create_volume_attachment()`](#method-StorageV1Api-create_volume_attachment)

- [`StorageV1Api$delete_collection_volume_attachment()`](#method-StorageV1Api-delete_collection_volume_attachment)

- [`StorageV1Api$read_volume_attachment()`](#method-StorageV1Api-read_volume_attachment)

- [`StorageV1Api$replace_volume_attachment()`](#method-StorageV1Api-replace_volume_attachment)

- [`StorageV1Api$patch_volume_attachment()`](#method-StorageV1Api-patch_volume_attachment)

- [`StorageV1Api$delete_volume_attachment()`](#method-StorageV1Api-delete_volume_attachment)

- [`StorageV1Api$read_volume_attachment_status()`](#method-StorageV1Api-read_volume_attachment_status)

- [`StorageV1Api$replace_volume_attachment_status()`](#method-StorageV1Api-replace_volume_attachment_status)

- [`StorageV1Api$patch_volume_attachment_status()`](#method-StorageV1Api-patch_volume_attachment_status)

- [`StorageV1Api$watch_csi_driver_list()`](#method-StorageV1Api-watch_csi_driver_list)

- [`StorageV1Api$watch_csi_driver()`](#method-StorageV1Api-watch_csi_driver)

- [`StorageV1Api$watch_csi_node_list()`](#method-StorageV1Api-watch_csi_node_list)

- [`StorageV1Api$watch_csi_node()`](#method-StorageV1Api-watch_csi_node)

- [`StorageV1Api$watch_csi_storage_capacity_list_for_all_namespaces()`](#method-StorageV1Api-watch_csi_storage_capacity_list_for_all_namespaces)

- [`StorageV1Api$watch_namespaced_csi_storage_capacity_list()`](#method-StorageV1Api-watch_namespaced_csi_storage_capacity_list)

- [`StorageV1Api$watch_namespaced_csi_storage_capacity()`](#method-StorageV1Api-watch_namespaced_csi_storage_capacity)

- [`StorageV1Api$watch_storage_class_list()`](#method-StorageV1Api-watch_storage_class_list)

- [`StorageV1Api$watch_storage_class()`](#method-StorageV1Api-watch_storage_class)

- [`StorageV1Api$watch_volume_attachment_list()`](#method-StorageV1Api-watch_volume_attachment_list)

- [`StorageV1Api$watch_volume_attachment()`](#method-StorageV1Api-watch_volume_attachment)

- [`StorageV1Api$clone()`](#method-StorageV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    StorageV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getStorageV1APIResources get available resources
  listStorageV1CSIDriver list or watch objects of kind CSIDriver

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    StorageV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_csi_driver()`

#### Usage

    StorageV1Api$list_csi_driver(
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

  = NULL createStorageV1CSIDriver create a CSIDriver

------------------------------------------------------------------------

### Method `create_csi_driver()`

#### Usage

    StorageV1Api$create_csi_driver(
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

  = NULL deleteStorageV1CollectionCSIDriver delete collection of
  CSIDriver

------------------------------------------------------------------------

### Method `delete_collection_csi_driver()`

#### Usage

    StorageV1Api$delete_collection_csi_driver(
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

  = NULL readStorageV1CSIDriver read the specified CSIDriver

------------------------------------------------------------------------

### Method `read_csi_driver()`

#### Usage

    StorageV1Api$read_csi_driver(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceStorageV1CSIDriver replace the specified CSIDriver

------------------------------------------------------------------------

### Method `replace_csi_driver()`

#### Usage

    StorageV1Api$replace_csi_driver(
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

  = NULL patchStorageV1CSIDriver partially update the specified
  CSIDriver

------------------------------------------------------------------------

### Method `patch_csi_driver()`

#### Usage

    StorageV1Api$patch_csi_driver(
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

  = "application/json-patch+json" deleteStorageV1CSIDriver delete a
  CSIDriver

------------------------------------------------------------------------

### Method `delete_csi_driver()`

#### Usage

    StorageV1Api$delete_csi_driver(
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

  = NULL listStorageV1CSINode list or watch objects of kind CSINode

------------------------------------------------------------------------

### Method `list_csi_node()`

#### Usage

    StorageV1Api$list_csi_node(
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

  = NULL createStorageV1CSINode create a CSINode

------------------------------------------------------------------------

### Method `create_csi_node()`

#### Usage

    StorageV1Api$create_csi_node(
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

  = NULL deleteStorageV1CollectionCSINode delete collection of CSINode

------------------------------------------------------------------------

### Method `delete_collection_csi_node()`

#### Usage

    StorageV1Api$delete_collection_csi_node(
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

  = NULL readStorageV1CSINode read the specified CSINode

------------------------------------------------------------------------

### Method `read_csi_node()`

#### Usage

    StorageV1Api$read_csi_node(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceStorageV1CSINode replace the specified CSINode

------------------------------------------------------------------------

### Method `replace_csi_node()`

#### Usage

    StorageV1Api$replace_csi_node(
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

  = NULL patchStorageV1CSINode partially update the specified CSINode

------------------------------------------------------------------------

### Method `patch_csi_node()`

#### Usage

    StorageV1Api$patch_csi_node(
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

  = "application/json-patch+json" deleteStorageV1CSINode delete a
  CSINode

------------------------------------------------------------------------

### Method `delete_csi_node()`

#### Usage

    StorageV1Api$delete_csi_node(
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

  = NULL listStorageV1CSIStorageCapacityForAllNamespaces list or watch
  objects of kind CSIStorageCapacity

------------------------------------------------------------------------

### Method `list_csi_storage_capacity_for_all_namespaces()`

#### Usage

    StorageV1Api$list_csi_storage_capacity_for_all_namespaces(
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

  = NULL listStorageV1NamespacedCSIStorageCapacity list or watch objects
  of kind CSIStorageCapacity

------------------------------------------------------------------------

### Method `list_namespaced_csi_storage_capacity()`

#### Usage

    StorageV1Api$list_namespaced_csi_storage_capacity(
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

  = NULL createStorageV1NamespacedCSIStorageCapacity create a
  CSIStorageCapacity

------------------------------------------------------------------------

### Method `create_namespaced_csi_storage_capacity()`

#### Usage

    StorageV1Api$create_namespaced_csi_storage_capacity(
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

  = NULL deleteStorageV1CollectionNamespacedCSIStorageCapacity delete
  collection of CSIStorageCapacity

------------------------------------------------------------------------

### Method `delete_collection_namespaced_csi_storage_capacity()`

#### Usage

    StorageV1Api$delete_collection_namespaced_csi_storage_capacity(
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

  = NULL readStorageV1NamespacedCSIStorageCapacity read the specified
  CSIStorageCapacity

------------------------------------------------------------------------

### Method `read_namespaced_csi_storage_capacity()`

#### Usage

    StorageV1Api$read_namespaced_csi_storage_capacity(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceStorageV1NamespacedCSIStorageCapacity replace the
  specified CSIStorageCapacity

------------------------------------------------------------------------

### Method `replace_namespaced_csi_storage_capacity()`

#### Usage

    StorageV1Api$replace_namespaced_csi_storage_capacity(
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

  = NULL patchStorageV1NamespacedCSIStorageCapacity partially update the
  specified CSIStorageCapacity

------------------------------------------------------------------------

### Method `patch_namespaced_csi_storage_capacity()`

#### Usage

    StorageV1Api$patch_namespaced_csi_storage_capacity(
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
  deleteStorageV1NamespacedCSIStorageCapacity delete a
  CSIStorageCapacity

------------------------------------------------------------------------

### Method `delete_namespaced_csi_storage_capacity()`

#### Usage

    StorageV1Api$delete_namespaced_csi_storage_capacity(
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

  = NULL listStorageV1StorageClass list or watch objects of kind
  StorageClass

------------------------------------------------------------------------

### Method `list_storage_class()`

#### Usage

    StorageV1Api$list_storage_class(
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

  = NULL createStorageV1StorageClass create a StorageClass

------------------------------------------------------------------------

### Method `create_storage_class()`

#### Usage

    StorageV1Api$create_storage_class(
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

  = NULL deleteStorageV1CollectionStorageClass delete collection of
  StorageClass

------------------------------------------------------------------------

### Method `delete_collection_storage_class()`

#### Usage

    StorageV1Api$delete_collection_storage_class(
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

  = NULL readStorageV1StorageClass read the specified StorageClass

------------------------------------------------------------------------

### Method `read_storage_class()`

#### Usage

    StorageV1Api$read_storage_class(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceStorageV1StorageClass replace the specified StorageClass

------------------------------------------------------------------------

### Method `replace_storage_class()`

#### Usage

    StorageV1Api$replace_storage_class(
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

  = NULL patchStorageV1StorageClass partially update the specified
  StorageClass

------------------------------------------------------------------------

### Method `patch_storage_class()`

#### Usage

    StorageV1Api$patch_storage_class(
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

  = "application/json-patch+json" deleteStorageV1StorageClass delete a
  StorageClass

------------------------------------------------------------------------

### Method `delete_storage_class()`

#### Usage

    StorageV1Api$delete_storage_class(
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

  = NULL listStorageV1VolumeAttachment list or watch objects of kind
  VolumeAttachment

------------------------------------------------------------------------

### Method `list_volume_attachment()`

#### Usage

    StorageV1Api$list_volume_attachment(
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

  = NULL createStorageV1VolumeAttachment create a VolumeAttachment

------------------------------------------------------------------------

### Method `create_volume_attachment()`

#### Usage

    StorageV1Api$create_volume_attachment(
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

  = NULL deleteStorageV1CollectionVolumeAttachment delete collection of
  VolumeAttachment

------------------------------------------------------------------------

### Method `delete_collection_volume_attachment()`

#### Usage

    StorageV1Api$delete_collection_volume_attachment(
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

  = NULL readStorageV1VolumeAttachment read the specified
  VolumeAttachment

------------------------------------------------------------------------

### Method `read_volume_attachment()`

#### Usage

    StorageV1Api$read_volume_attachment(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceStorageV1VolumeAttachment replace the specified
  VolumeAttachment

------------------------------------------------------------------------

### Method `replace_volume_attachment()`

#### Usage

    StorageV1Api$replace_volume_attachment(
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

  = NULL patchStorageV1VolumeAttachment partially update the specified
  VolumeAttachment

------------------------------------------------------------------------

### Method `patch_volume_attachment()`

#### Usage

    StorageV1Api$patch_volume_attachment(
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

  = "application/json-patch+json" deleteStorageV1VolumeAttachment delete
  a VolumeAttachment

------------------------------------------------------------------------

### Method `delete_volume_attachment()`

#### Usage

    StorageV1Api$delete_volume_attachment(
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

  = NULL readStorageV1VolumeAttachmentStatus read status of the
  specified VolumeAttachment

------------------------------------------------------------------------

### Method `read_volume_attachment_status()`

#### Usage

    StorageV1Api$read_volume_attachment_status(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceStorageV1VolumeAttachmentStatus replace status of the
  specified VolumeAttachment

------------------------------------------------------------------------

### Method `replace_volume_attachment_status()`

#### Usage

    StorageV1Api$replace_volume_attachment_status(
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

  = NULL patchStorageV1VolumeAttachmentStatus partially update status of
  the specified VolumeAttachment

------------------------------------------------------------------------

### Method `patch_volume_attachment_status()`

#### Usage

    StorageV1Api$patch_volume_attachment_status(
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

  = "application/json-patch+json" watchStorageV1CSIDriverList watch
  individual changes to a list of CSIDriver. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_csi_driver_list()`

#### Usage

    StorageV1Api$watch_csi_driver_list(
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

  = NULL watchStorageV1CSIDriver watch changes to an object of kind
  CSIDriver. deprecated: use the 'watch' parameter with a list operation
  instead, filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_csi_driver()`

#### Usage

    StorageV1Api$watch_csi_driver(
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

  = NULL watchStorageV1CSINodeList watch individual changes to a list of
  CSINode. deprecated: use the 'watch' parameter with a list operation
  instead.

------------------------------------------------------------------------

### Method `watch_csi_node_list()`

#### Usage

    StorageV1Api$watch_csi_node_list(
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

  = NULL watchStorageV1CSINode watch changes to an object of kind
  CSINode. deprecated: use the 'watch' parameter with a list operation
  instead, filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_csi_node()`

#### Usage

    StorageV1Api$watch_csi_node(
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

  = NULL watchStorageV1CSIStorageCapacityListForAllNamespaces watch
  individual changes to a list of CSIStorageCapacity. deprecated: use
  the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_csi_storage_capacity_list_for_all_namespaces()`

#### Usage

    StorageV1Api$watch_csi_storage_capacity_list_for_all_namespaces(
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

  = NULL watchStorageV1NamespacedCSIStorageCapacityList watch individual
  changes to a list of CSIStorageCapacity. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_csi_storage_capacity_list()`

#### Usage

    StorageV1Api$watch_namespaced_csi_storage_capacity_list(
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

  = NULL watchStorageV1NamespacedCSIStorageCapacity watch changes to an
  object of kind CSIStorageCapacity. deprecated: use the 'watch'
  parameter with a list operation instead, filtered to a single item
  with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_csi_storage_capacity()`

#### Usage

    StorageV1Api$watch_namespaced_csi_storage_capacity(
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

  = NULL watchStorageV1StorageClassList watch individual changes to a
  list of StorageClass. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_storage_class_list()`

#### Usage

    StorageV1Api$watch_storage_class_list(
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

  = NULL watchStorageV1StorageClass watch changes to an object of kind
  StorageClass. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_storage_class()`

#### Usage

    StorageV1Api$watch_storage_class(
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

  = NULL watchStorageV1VolumeAttachmentList watch individual changes to
  a list of VolumeAttachment. deprecated: use the 'watch' parameter with
  a list operation instead.

------------------------------------------------------------------------

### Method `watch_volume_attachment_list()`

#### Usage

    StorageV1Api$watch_volume_attachment_list(
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

  = NULL watchStorageV1VolumeAttachment watch changes to an object of
  kind VolumeAttachment. deprecated: use the 'watch' parameter with a
  list operation instead, filtered to a single item with the
  'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_volume_attachment()`

#### Usage

    StorageV1Api$watch_volume_attachment(
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

    StorageV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
