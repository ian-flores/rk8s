# StoragemigrationV1alpha1Api

StoragemigrationV1alpha1Api

StoragemigrationV1alpha1Api

## Details

Typed Kubernetes API client for the \`StoragemigrationV1alpha1\`
surface. See generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`StoragemigrationV1alpha1Api$new()`](#method-StoragemigrationV1alpha1Api-new)

- [`StoragemigrationV1alpha1Api$get_api_resources()`](#method-StoragemigrationV1alpha1Api-get_api_resources)

- [`StoragemigrationV1alpha1Api$list_storage_version_migration()`](#method-StoragemigrationV1alpha1Api-list_storage_version_migration)

- [`StoragemigrationV1alpha1Api$create_storage_version_migration()`](#method-StoragemigrationV1alpha1Api-create_storage_version_migration)

- [`StoragemigrationV1alpha1Api$delete_collection_storage_version_migration()`](#method-StoragemigrationV1alpha1Api-delete_collection_storage_version_migration)

- [`StoragemigrationV1alpha1Api$read_storage_version_migration()`](#method-StoragemigrationV1alpha1Api-read_storage_version_migration)

- [`StoragemigrationV1alpha1Api$replace_storage_version_migration()`](#method-StoragemigrationV1alpha1Api-replace_storage_version_migration)

- [`StoragemigrationV1alpha1Api$patch_storage_version_migration()`](#method-StoragemigrationV1alpha1Api-patch_storage_version_migration)

- [`StoragemigrationV1alpha1Api$delete_storage_version_migration()`](#method-StoragemigrationV1alpha1Api-delete_storage_version_migration)

- [`StoragemigrationV1alpha1Api$read_storage_version_migration_status()`](#method-StoragemigrationV1alpha1Api-read_storage_version_migration_status)

- [`StoragemigrationV1alpha1Api$replace_storage_version_migration_status()`](#method-StoragemigrationV1alpha1Api-replace_storage_version_migration_status)

- [`StoragemigrationV1alpha1Api$patch_storage_version_migration_status()`](#method-StoragemigrationV1alpha1Api-patch_storage_version_migration_status)

- [`StoragemigrationV1alpha1Api$watch_storage_version_migration_list()`](#method-StoragemigrationV1alpha1Api-watch_storage_version_migration_list)

- [`StoragemigrationV1alpha1Api$watch_storage_version_migration()`](#method-StoragemigrationV1alpha1Api-watch_storage_version_migration)

- [`StoragemigrationV1alpha1Api$clone()`](#method-StoragemigrationV1alpha1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    StoragemigrationV1alpha1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getStoragemigrationV1alpha1APIResources get
  available resources
  listStoragemigrationV1alpha1StorageVersionMigration list or watch
  objects of kind StorageVersionMigration

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    StoragemigrationV1alpha1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_storage_version_migration()`

#### Usage

    StoragemigrationV1alpha1Api$list_storage_version_migration(
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

  = NULL createStoragemigrationV1alpha1StorageVersionMigration create a
  StorageVersionMigration

------------------------------------------------------------------------

### Method `create_storage_version_migration()`

#### Usage

    StoragemigrationV1alpha1Api$create_storage_version_migration(
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

  = NULL deleteStoragemigrationV1alpha1CollectionStorageVersionMigration
  delete collection of StorageVersionMigration

------------------------------------------------------------------------

### Method `delete_collection_storage_version_migration()`

#### Usage

    StoragemigrationV1alpha1Api$delete_collection_storage_version_migration(
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

  = NULL readStoragemigrationV1alpha1StorageVersionMigration read the
  specified StorageVersionMigration

------------------------------------------------------------------------

### Method `read_storage_version_migration()`

#### Usage

    StoragemigrationV1alpha1Api$read_storage_version_migration(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceStoragemigrationV1alpha1StorageVersionMigration replace
  the specified StorageVersionMigration

------------------------------------------------------------------------

### Method `replace_storage_version_migration()`

#### Usage

    StoragemigrationV1alpha1Api$replace_storage_version_migration(
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

  = NULL patchStoragemigrationV1alpha1StorageVersionMigration partially
  update the specified StorageVersionMigration

------------------------------------------------------------------------

### Method `patch_storage_version_migration()`

#### Usage

    StoragemigrationV1alpha1Api$patch_storage_version_migration(
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
  deleteStoragemigrationV1alpha1StorageVersionMigration delete a
  StorageVersionMigration

------------------------------------------------------------------------

### Method `delete_storage_version_migration()`

#### Usage

    StoragemigrationV1alpha1Api$delete_storage_version_migration(
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

  = NULL readStoragemigrationV1alpha1StorageVersionMigrationStatus read
  status of the specified StorageVersionMigration

------------------------------------------------------------------------

### Method `read_storage_version_migration_status()`

#### Usage

    StoragemigrationV1alpha1Api$read_storage_version_migration_status(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceStoragemigrationV1alpha1StorageVersionMigrationStatus
  replace status of the specified StorageVersionMigration

------------------------------------------------------------------------

### Method `replace_storage_version_migration_status()`

#### Usage

    StoragemigrationV1alpha1Api$replace_storage_version_migration_status(
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

  = NULL patchStoragemigrationV1alpha1StorageVersionMigrationStatus
  partially update status of the specified StorageVersionMigration

------------------------------------------------------------------------

### Method `patch_storage_version_migration_status()`

#### Usage

    StoragemigrationV1alpha1Api$patch_storage_version_migration_status(
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
  watchStoragemigrationV1alpha1StorageVersionMigrationList watch
  individual changes to a list of StorageVersionMigration. deprecated:
  use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_storage_version_migration_list()`

#### Usage

    StoragemigrationV1alpha1Api$watch_storage_version_migration_list(
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

  = NULL watchStoragemigrationV1alpha1StorageVersionMigration watch
  changes to an object of kind StorageVersionMigration. deprecated: use
  the 'watch' parameter with a list operation instead, filtered to a
  single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_storage_version_migration()`

#### Usage

    StoragemigrationV1alpha1Api$watch_storage_version_migration(
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

    StoragemigrationV1alpha1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
