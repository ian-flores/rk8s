# SchedulingV1Api

SchedulingV1Api

SchedulingV1Api

## Details

Typed Kubernetes API client for the \`SchedulingV1\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`SchedulingV1Api$new()`](#method-SchedulingV1Api-new)

- [`SchedulingV1Api$get_api_resources()`](#method-SchedulingV1Api-get_api_resources)

- [`SchedulingV1Api$list_priority_class()`](#method-SchedulingV1Api-list_priority_class)

- [`SchedulingV1Api$create_priority_class()`](#method-SchedulingV1Api-create_priority_class)

- [`SchedulingV1Api$delete_collection_priority_class()`](#method-SchedulingV1Api-delete_collection_priority_class)

- [`SchedulingV1Api$read_priority_class()`](#method-SchedulingV1Api-read_priority_class)

- [`SchedulingV1Api$replace_priority_class()`](#method-SchedulingV1Api-replace_priority_class)

- [`SchedulingV1Api$patch_priority_class()`](#method-SchedulingV1Api-patch_priority_class)

- [`SchedulingV1Api$delete_priority_class()`](#method-SchedulingV1Api-delete_priority_class)

- [`SchedulingV1Api$watch_priority_class_list()`](#method-SchedulingV1Api-watch_priority_class_list)

- [`SchedulingV1Api$watch_priority_class()`](#method-SchedulingV1Api-watch_priority_class)

- [`SchedulingV1Api$clone()`](#method-SchedulingV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    SchedulingV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getSchedulingV1APIResources get available resources
  listSchedulingV1PriorityClass list or watch objects of kind
  PriorityClass

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    SchedulingV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_priority_class()`

#### Usage

    SchedulingV1Api$list_priority_class(
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

  = NULL createSchedulingV1PriorityClass create a PriorityClass

------------------------------------------------------------------------

### Method `create_priority_class()`

#### Usage

    SchedulingV1Api$create_priority_class(
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

  = NULL deleteSchedulingV1CollectionPriorityClass delete collection of
  PriorityClass

------------------------------------------------------------------------

### Method `delete_collection_priority_class()`

#### Usage

    SchedulingV1Api$delete_collection_priority_class(
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

  = NULL readSchedulingV1PriorityClass read the specified PriorityClass

------------------------------------------------------------------------

### Method `read_priority_class()`

#### Usage

    SchedulingV1Api$read_priority_class(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceSchedulingV1PriorityClass replace the specified
  PriorityClass

------------------------------------------------------------------------

### Method `replace_priority_class()`

#### Usage

    SchedulingV1Api$replace_priority_class(
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

  = NULL patchSchedulingV1PriorityClass partially update the specified
  PriorityClass

------------------------------------------------------------------------

### Method `patch_priority_class()`

#### Usage

    SchedulingV1Api$patch_priority_class(
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

  = "application/json-patch+json" deleteSchedulingV1PriorityClass delete
  a PriorityClass

------------------------------------------------------------------------

### Method `delete_priority_class()`

#### Usage

    SchedulingV1Api$delete_priority_class(
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

  = NULL watchSchedulingV1PriorityClassList watch individual changes to
  a list of PriorityClass. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_priority_class_list()`

#### Usage

    SchedulingV1Api$watch_priority_class_list(
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

  = NULL watchSchedulingV1PriorityClass watch changes to an object of
  kind PriorityClass. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_priority_class()`

#### Usage

    SchedulingV1Api$watch_priority_class(
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

    SchedulingV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
