# StorageV1beta1Api

StorageV1beta1Api

StorageV1beta1Api

## Details

Typed Kubernetes API client for the \`StorageV1beta1\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`StorageV1beta1Api$new()`](#method-StorageV1beta1Api-new)

- [`StorageV1beta1Api$get_api_resources()`](#method-StorageV1beta1Api-get_api_resources)

- [`StorageV1beta1Api$list_volume_attributes_class()`](#method-StorageV1beta1Api-list_volume_attributes_class)

- [`StorageV1beta1Api$create_volume_attributes_class()`](#method-StorageV1beta1Api-create_volume_attributes_class)

- [`StorageV1beta1Api$delete_collection_volume_attributes_class()`](#method-StorageV1beta1Api-delete_collection_volume_attributes_class)

- [`StorageV1beta1Api$read_volume_attributes_class()`](#method-StorageV1beta1Api-read_volume_attributes_class)

- [`StorageV1beta1Api$replace_volume_attributes_class()`](#method-StorageV1beta1Api-replace_volume_attributes_class)

- [`StorageV1beta1Api$patch_volume_attributes_class()`](#method-StorageV1beta1Api-patch_volume_attributes_class)

- [`StorageV1beta1Api$delete_volume_attributes_class()`](#method-StorageV1beta1Api-delete_volume_attributes_class)

- [`StorageV1beta1Api$watch_volume_attributes_class_list()`](#method-StorageV1beta1Api-watch_volume_attributes_class_list)

- [`StorageV1beta1Api$watch_volume_attributes_class()`](#method-StorageV1beta1Api-watch_volume_attributes_class)

- [`StorageV1beta1Api$clone()`](#method-StorageV1beta1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    StorageV1beta1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getStorageV1beta1APIResources get available
  resources listStorageV1beta1VolumeAttributesClass list or watch
  objects of kind VolumeAttributesClass

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    StorageV1beta1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_volume_attributes_class()`

#### Usage

    StorageV1beta1Api$list_volume_attributes_class(
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

  = NULL createStorageV1beta1VolumeAttributesClass create a
  VolumeAttributesClass

------------------------------------------------------------------------

### Method `create_volume_attributes_class()`

#### Usage

    StorageV1beta1Api$create_volume_attributes_class(
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

  = NULL deleteStorageV1beta1CollectionVolumeAttributesClass delete
  collection of VolumeAttributesClass

------------------------------------------------------------------------

### Method `delete_collection_volume_attributes_class()`

#### Usage

    StorageV1beta1Api$delete_collection_volume_attributes_class(
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

  = NULL readStorageV1beta1VolumeAttributesClass read the specified
  VolumeAttributesClass

------------------------------------------------------------------------

### Method `read_volume_attributes_class()`

#### Usage

    StorageV1beta1Api$read_volume_attributes_class(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceStorageV1beta1VolumeAttributesClass replace the
  specified VolumeAttributesClass

------------------------------------------------------------------------

### Method `replace_volume_attributes_class()`

#### Usage

    StorageV1beta1Api$replace_volume_attributes_class(
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

  = NULL patchStorageV1beta1VolumeAttributesClass partially update the
  specified VolumeAttributesClass

------------------------------------------------------------------------

### Method `patch_volume_attributes_class()`

#### Usage

    StorageV1beta1Api$patch_volume_attributes_class(
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
  deleteStorageV1beta1VolumeAttributesClass delete a
  VolumeAttributesClass

------------------------------------------------------------------------

### Method `delete_volume_attributes_class()`

#### Usage

    StorageV1beta1Api$delete_volume_attributes_class(
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

  = NULL watchStorageV1beta1VolumeAttributesClassList watch individual
  changes to a list of VolumeAttributesClass. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_volume_attributes_class_list()`

#### Usage

    StorageV1beta1Api$watch_volume_attributes_class_list(
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

  = NULL watchStorageV1beta1VolumeAttributesClass watch changes to an
  object of kind VolumeAttributesClass. deprecated: use the 'watch'
  parameter with a list operation instead, filtered to a single item
  with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_volume_attributes_class()`

#### Usage

    StorageV1beta1Api$watch_volume_attributes_class(
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

    StorageV1beta1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
