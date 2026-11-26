# BatchV1Api

BatchV1Api

BatchV1Api

## Details

Typed Kubernetes API client for the \`BatchV1\` surface. See generated
methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`BatchV1Api$new()`](#method-BatchV1Api-new)

- [`BatchV1Api$get_api_resources()`](#method-BatchV1Api-get_api_resources)

- [`BatchV1Api$list_cron_job_for_all_namespaces()`](#method-BatchV1Api-list_cron_job_for_all_namespaces)

- [`BatchV1Api$list_job_for_all_namespaces()`](#method-BatchV1Api-list_job_for_all_namespaces)

- [`BatchV1Api$list_namespaced_cron_job()`](#method-BatchV1Api-list_namespaced_cron_job)

- [`BatchV1Api$create_namespaced_cron_job()`](#method-BatchV1Api-create_namespaced_cron_job)

- [`BatchV1Api$delete_collection_namespaced_cron_job()`](#method-BatchV1Api-delete_collection_namespaced_cron_job)

- [`BatchV1Api$read_namespaced_cron_job()`](#method-BatchV1Api-read_namespaced_cron_job)

- [`BatchV1Api$replace_namespaced_cron_job()`](#method-BatchV1Api-replace_namespaced_cron_job)

- [`BatchV1Api$patch_namespaced_cron_job()`](#method-BatchV1Api-patch_namespaced_cron_job)

- [`BatchV1Api$delete_namespaced_cron_job()`](#method-BatchV1Api-delete_namespaced_cron_job)

- [`BatchV1Api$read_namespaced_cron_job_status()`](#method-BatchV1Api-read_namespaced_cron_job_status)

- [`BatchV1Api$replace_namespaced_cron_job_status()`](#method-BatchV1Api-replace_namespaced_cron_job_status)

- [`BatchV1Api$patch_namespaced_cron_job_status()`](#method-BatchV1Api-patch_namespaced_cron_job_status)

- [`BatchV1Api$list_namespaced_job()`](#method-BatchV1Api-list_namespaced_job)

- [`BatchV1Api$create_namespaced_job()`](#method-BatchV1Api-create_namespaced_job)

- [`BatchV1Api$delete_collection_namespaced_job()`](#method-BatchV1Api-delete_collection_namespaced_job)

- [`BatchV1Api$read_namespaced_job()`](#method-BatchV1Api-read_namespaced_job)

- [`BatchV1Api$replace_namespaced_job()`](#method-BatchV1Api-replace_namespaced_job)

- [`BatchV1Api$patch_namespaced_job()`](#method-BatchV1Api-patch_namespaced_job)

- [`BatchV1Api$delete_namespaced_job()`](#method-BatchV1Api-delete_namespaced_job)

- [`BatchV1Api$read_namespaced_job_status()`](#method-BatchV1Api-read_namespaced_job_status)

- [`BatchV1Api$replace_namespaced_job_status()`](#method-BatchV1Api-replace_namespaced_job_status)

- [`BatchV1Api$patch_namespaced_job_status()`](#method-BatchV1Api-patch_namespaced_job_status)

- [`BatchV1Api$watch_cron_job_list_for_all_namespaces()`](#method-BatchV1Api-watch_cron_job_list_for_all_namespaces)

- [`BatchV1Api$watch_job_list_for_all_namespaces()`](#method-BatchV1Api-watch_job_list_for_all_namespaces)

- [`BatchV1Api$watch_namespaced_cron_job_list()`](#method-BatchV1Api-watch_namespaced_cron_job_list)

- [`BatchV1Api$watch_namespaced_cron_job()`](#method-BatchV1Api-watch_namespaced_cron_job)

- [`BatchV1Api$watch_namespaced_job_list()`](#method-BatchV1Api-watch_namespaced_job_list)

- [`BatchV1Api$watch_namespaced_job()`](#method-BatchV1Api-watch_namespaced_job)

- [`BatchV1Api$clone()`](#method-BatchV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    BatchV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getBatchV1APIResources get available resources
  listBatchV1CronJobForAllNamespaces list or watch objects of kind
  CronJob

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    BatchV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_cron_job_for_all_namespaces()`

#### Usage

    BatchV1Api$list_cron_job_for_all_namespaces(
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

  = NULL listBatchV1JobForAllNamespaces list or watch objects of kind
  Job

------------------------------------------------------------------------

### Method `list_job_for_all_namespaces()`

#### Usage

    BatchV1Api$list_job_for_all_namespaces(
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

  = NULL listBatchV1NamespacedCronJob list or watch objects of kind
  CronJob

------------------------------------------------------------------------

### Method `list_namespaced_cron_job()`

#### Usage

    BatchV1Api$list_namespaced_cron_job(
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

  = NULL createBatchV1NamespacedCronJob create a CronJob

------------------------------------------------------------------------

### Method `create_namespaced_cron_job()`

#### Usage

    BatchV1Api$create_namespaced_cron_job(
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

  = NULL deleteBatchV1CollectionNamespacedCronJob delete collection of
  CronJob

------------------------------------------------------------------------

### Method `delete_collection_namespaced_cron_job()`

#### Usage

    BatchV1Api$delete_collection_namespaced_cron_job(
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

  = NULL readBatchV1NamespacedCronJob read the specified CronJob

------------------------------------------------------------------------

### Method `read_namespaced_cron_job()`

#### Usage

    BatchV1Api$read_namespaced_cron_job(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceBatchV1NamespacedCronJob replace the specified CronJob

------------------------------------------------------------------------

### Method `replace_namespaced_cron_job()`

#### Usage

    BatchV1Api$replace_namespaced_cron_job(
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

  = NULL patchBatchV1NamespacedCronJob partially update the specified
  CronJob

------------------------------------------------------------------------

### Method `patch_namespaced_cron_job()`

#### Usage

    BatchV1Api$patch_namespaced_cron_job(
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

  = "application/json-patch+json" deleteBatchV1NamespacedCronJob delete
  a CronJob

------------------------------------------------------------------------

### Method `delete_namespaced_cron_job()`

#### Usage

    BatchV1Api$delete_namespaced_cron_job(
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

  = NULL readBatchV1NamespacedCronJobStatus read status of the specified
  CronJob

------------------------------------------------------------------------

### Method `read_namespaced_cron_job_status()`

#### Usage

    BatchV1Api$read_namespaced_cron_job_status(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceBatchV1NamespacedCronJobStatus replace status of the
  specified CronJob

------------------------------------------------------------------------

### Method `replace_namespaced_cron_job_status()`

#### Usage

    BatchV1Api$replace_namespaced_cron_job_status(
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

  = NULL patchBatchV1NamespacedCronJobStatus partially update status of
  the specified CronJob

------------------------------------------------------------------------

### Method `patch_namespaced_cron_job_status()`

#### Usage

    BatchV1Api$patch_namespaced_cron_job_status(
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

  = "application/json-patch+json" listBatchV1NamespacedJob list or watch
  objects of kind Job

------------------------------------------------------------------------

### Method `list_namespaced_job()`

#### Usage

    BatchV1Api$list_namespaced_job(
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

  = NULL createBatchV1NamespacedJob create a Job

------------------------------------------------------------------------

### Method `create_namespaced_job()`

#### Usage

    BatchV1Api$create_namespaced_job(
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

  = NULL deleteBatchV1CollectionNamespacedJob delete collection of Job

------------------------------------------------------------------------

### Method `delete_collection_namespaced_job()`

#### Usage

    BatchV1Api$delete_collection_namespaced_job(
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

  = NULL readBatchV1NamespacedJob read the specified Job

------------------------------------------------------------------------

### Method `read_namespaced_job()`

#### Usage

    BatchV1Api$read_namespaced_job(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceBatchV1NamespacedJob replace the specified Job

------------------------------------------------------------------------

### Method `replace_namespaced_job()`

#### Usage

    BatchV1Api$replace_namespaced_job(
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

  = NULL patchBatchV1NamespacedJob partially update the specified Job

------------------------------------------------------------------------

### Method `patch_namespaced_job()`

#### Usage

    BatchV1Api$patch_namespaced_job(
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

  = "application/json-patch+json" deleteBatchV1NamespacedJob delete a
  Job

------------------------------------------------------------------------

### Method `delete_namespaced_job()`

#### Usage

    BatchV1Api$delete_namespaced_job(
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

  = NULL readBatchV1NamespacedJobStatus read status of the specified Job

------------------------------------------------------------------------

### Method `read_namespaced_job_status()`

#### Usage

    BatchV1Api$read_namespaced_job_status(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceBatchV1NamespacedJobStatus replace status of the
  specified Job

------------------------------------------------------------------------

### Method `replace_namespaced_job_status()`

#### Usage

    BatchV1Api$replace_namespaced_job_status(
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

  = NULL patchBatchV1NamespacedJobStatus partially update status of the
  specified Job

------------------------------------------------------------------------

### Method `patch_namespaced_job_status()`

#### Usage

    BatchV1Api$patch_namespaced_job_status(
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
  watchBatchV1CronJobListForAllNamespaces watch individual changes to a
  list of CronJob. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_cron_job_list_for_all_namespaces()`

#### Usage

    BatchV1Api$watch_cron_job_list_for_all_namespaces(
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

  = NULL watchBatchV1JobListForAllNamespaces watch individual changes to
  a list of Job. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_job_list_for_all_namespaces()`

#### Usage

    BatchV1Api$watch_job_list_for_all_namespaces(
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

  = NULL watchBatchV1NamespacedCronJobList watch individual changes to a
  list of CronJob. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_cron_job_list()`

#### Usage

    BatchV1Api$watch_namespaced_cron_job_list(
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

  = NULL watchBatchV1NamespacedCronJob watch changes to an object of
  kind CronJob. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_cron_job()`

#### Usage

    BatchV1Api$watch_namespaced_cron_job(
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

  = NULL watchBatchV1NamespacedJobList watch individual changes to a
  list of Job. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_job_list()`

#### Usage

    BatchV1Api$watch_namespaced_job_list(
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

  = NULL watchBatchV1NamespacedJob watch changes to an object of kind
  Job. deprecated: use the 'watch' parameter with a list operation
  instead, filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_job()`

#### Usage

    BatchV1Api$watch_namespaced_job(
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

    BatchV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
