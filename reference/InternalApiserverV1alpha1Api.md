# InternalApiserverV1alpha1Api

InternalApiserverV1alpha1Api

InternalApiserverV1alpha1Api

## Details

Typed Kubernetes API client for the \`InternalApiserverV1alpha1\`
surface. See generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`InternalApiserverV1alpha1Api$new()`](#method-InternalApiserverV1alpha1Api-new)

- [`InternalApiserverV1alpha1Api$get_api_resources()`](#method-InternalApiserverV1alpha1Api-get_api_resources)

- [`InternalApiserverV1alpha1Api$list_storage_version()`](#method-InternalApiserverV1alpha1Api-list_storage_version)

- [`InternalApiserverV1alpha1Api$create_storage_version()`](#method-InternalApiserverV1alpha1Api-create_storage_version)

- [`InternalApiserverV1alpha1Api$delete_collection_storage_version()`](#method-InternalApiserverV1alpha1Api-delete_collection_storage_version)

- [`InternalApiserverV1alpha1Api$read_storage_version()`](#method-InternalApiserverV1alpha1Api-read_storage_version)

- [`InternalApiserverV1alpha1Api$replace_storage_version()`](#method-InternalApiserverV1alpha1Api-replace_storage_version)

- [`InternalApiserverV1alpha1Api$patch_storage_version()`](#method-InternalApiserverV1alpha1Api-patch_storage_version)

- [`InternalApiserverV1alpha1Api$delete_storage_version()`](#method-InternalApiserverV1alpha1Api-delete_storage_version)

- [`InternalApiserverV1alpha1Api$read_storage_version_status()`](#method-InternalApiserverV1alpha1Api-read_storage_version_status)

- [`InternalApiserverV1alpha1Api$replace_storage_version_status()`](#method-InternalApiserverV1alpha1Api-replace_storage_version_status)

- [`InternalApiserverV1alpha1Api$patch_storage_version_status()`](#method-InternalApiserverV1alpha1Api-patch_storage_version_status)

- [`InternalApiserverV1alpha1Api$watch_storage_version_list()`](#method-InternalApiserverV1alpha1Api-watch_storage_version_list)

- [`InternalApiserverV1alpha1Api$watch_storage_version()`](#method-InternalApiserverV1alpha1Api-watch_storage_version)

- [`InternalApiserverV1alpha1Api$clone()`](#method-InternalApiserverV1alpha1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    InternalApiserverV1alpha1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getInternalApiserverV1alpha1APIResources get
  available resources listInternalApiserverV1alpha1StorageVersion list
  or watch objects of kind StorageVersion

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    InternalApiserverV1alpha1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_storage_version()`

#### Usage

    InternalApiserverV1alpha1Api$list_storage_version(
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

  = NULL createInternalApiserverV1alpha1StorageVersion create a
  StorageVersion

------------------------------------------------------------------------

### Method `create_storage_version()`

#### Usage

    InternalApiserverV1alpha1Api$create_storage_version(
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

  = NULL deleteInternalApiserverV1alpha1CollectionStorageVersion delete
  collection of StorageVersion

------------------------------------------------------------------------

### Method `delete_collection_storage_version()`

#### Usage

    InternalApiserverV1alpha1Api$delete_collection_storage_version(
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

  = NULL readInternalApiserverV1alpha1StorageVersion read the specified
  StorageVersion

------------------------------------------------------------------------

### Method `read_storage_version()`

#### Usage

    InternalApiserverV1alpha1Api$read_storage_version(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceInternalApiserverV1alpha1StorageVersion replace the
  specified StorageVersion

------------------------------------------------------------------------

### Method `replace_storage_version()`

#### Usage

    InternalApiserverV1alpha1Api$replace_storage_version(
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

  = NULL patchInternalApiserverV1alpha1StorageVersion partially update
  the specified StorageVersion

------------------------------------------------------------------------

### Method `patch_storage_version()`

#### Usage

    InternalApiserverV1alpha1Api$patch_storage_version(
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
  deleteInternalApiserverV1alpha1StorageVersion delete a StorageVersion

------------------------------------------------------------------------

### Method `delete_storage_version()`

#### Usage

    InternalApiserverV1alpha1Api$delete_storage_version(
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

  = NULL readInternalApiserverV1alpha1StorageVersionStatus read status
  of the specified StorageVersion

------------------------------------------------------------------------

### Method `read_storage_version_status()`

#### Usage

    InternalApiserverV1alpha1Api$read_storage_version_status(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceInternalApiserverV1alpha1StorageVersionStatus replace
  status of the specified StorageVersion

------------------------------------------------------------------------

### Method `replace_storage_version_status()`

#### Usage

    InternalApiserverV1alpha1Api$replace_storage_version_status(
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

  = NULL patchInternalApiserverV1alpha1StorageVersionStatus partially
  update status of the specified StorageVersion

------------------------------------------------------------------------

### Method `patch_storage_version_status()`

#### Usage

    InternalApiserverV1alpha1Api$patch_storage_version_status(
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
  watchInternalApiserverV1alpha1StorageVersionList watch individual
  changes to a list of StorageVersion. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_storage_version_list()`

#### Usage

    InternalApiserverV1alpha1Api$watch_storage_version_list(
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

  = NULL watchInternalApiserverV1alpha1StorageVersion watch changes to
  an object of kind StorageVersion. deprecated: use the 'watch'
  parameter with a list operation instead, filtered to a single item
  with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_storage_version()`

#### Usage

    InternalApiserverV1alpha1Api$watch_storage_version(
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

    InternalApiserverV1alpha1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
