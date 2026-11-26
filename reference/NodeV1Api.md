# NodeV1Api

NodeV1Api

NodeV1Api

## Details

Typed Kubernetes API client for the \`NodeV1\` surface. See generated
methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`NodeV1Api$new()`](#method-NodeV1Api-new)

- [`NodeV1Api$get_api_resources()`](#method-NodeV1Api-get_api_resources)

- [`NodeV1Api$list_runtime_class()`](#method-NodeV1Api-list_runtime_class)

- [`NodeV1Api$create_runtime_class()`](#method-NodeV1Api-create_runtime_class)

- [`NodeV1Api$delete_collection_runtime_class()`](#method-NodeV1Api-delete_collection_runtime_class)

- [`NodeV1Api$read_runtime_class()`](#method-NodeV1Api-read_runtime_class)

- [`NodeV1Api$replace_runtime_class()`](#method-NodeV1Api-replace_runtime_class)

- [`NodeV1Api$patch_runtime_class()`](#method-NodeV1Api-patch_runtime_class)

- [`NodeV1Api$delete_runtime_class()`](#method-NodeV1Api-delete_runtime_class)

- [`NodeV1Api$watch_runtime_class_list()`](#method-NodeV1Api-watch_runtime_class_list)

- [`NodeV1Api$watch_runtime_class()`](#method-NodeV1Api-watch_runtime_class)

- [`NodeV1Api$clone()`](#method-NodeV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    NodeV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getNodeV1APIResources get available resources
  listNodeV1RuntimeClass list or watch objects of kind RuntimeClass

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    NodeV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_runtime_class()`

#### Usage

    NodeV1Api$list_runtime_class(
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

  = NULL createNodeV1RuntimeClass create a RuntimeClass

------------------------------------------------------------------------

### Method `create_runtime_class()`

#### Usage

    NodeV1Api$create_runtime_class(
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

  = NULL deleteNodeV1CollectionRuntimeClass delete collection of
  RuntimeClass

------------------------------------------------------------------------

### Method `delete_collection_runtime_class()`

#### Usage

    NodeV1Api$delete_collection_runtime_class(
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

  = NULL readNodeV1RuntimeClass read the specified RuntimeClass

------------------------------------------------------------------------

### Method `read_runtime_class()`

#### Usage

    NodeV1Api$read_runtime_class(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceNodeV1RuntimeClass replace the specified RuntimeClass

------------------------------------------------------------------------

### Method `replace_runtime_class()`

#### Usage

    NodeV1Api$replace_runtime_class(
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

  = NULL patchNodeV1RuntimeClass partially update the specified
  RuntimeClass

------------------------------------------------------------------------

### Method `patch_runtime_class()`

#### Usage

    NodeV1Api$patch_runtime_class(
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

  = "application/json-patch+json" deleteNodeV1RuntimeClass delete a
  RuntimeClass

------------------------------------------------------------------------

### Method `delete_runtime_class()`

#### Usage

    NodeV1Api$delete_runtime_class(
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

  = NULL watchNodeV1RuntimeClassList watch individual changes to a list
  of RuntimeClass. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_runtime_class_list()`

#### Usage

    NodeV1Api$watch_runtime_class_list(
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

  = NULL watchNodeV1RuntimeClass watch changes to an object of kind
  RuntimeClass. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_runtime_class()`

#### Usage

    NodeV1Api$watch_runtime_class(
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

    NodeV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
