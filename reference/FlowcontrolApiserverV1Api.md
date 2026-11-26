# FlowcontrolApiserverV1Api

FlowcontrolApiserverV1Api

FlowcontrolApiserverV1Api

## Details

Typed Kubernetes API client for the \`FlowcontrolApiserverV1\` surface.
See generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`FlowcontrolApiserverV1Api$new()`](#method-FlowcontrolApiserverV1Api-new)

- [`FlowcontrolApiserverV1Api$get_api_resources()`](#method-FlowcontrolApiserverV1Api-get_api_resources)

- [`FlowcontrolApiserverV1Api$list_flow_schema()`](#method-FlowcontrolApiserverV1Api-list_flow_schema)

- [`FlowcontrolApiserverV1Api$create_flow_schema()`](#method-FlowcontrolApiserverV1Api-create_flow_schema)

- [`FlowcontrolApiserverV1Api$delete_collection_flow_schema()`](#method-FlowcontrolApiserverV1Api-delete_collection_flow_schema)

- [`FlowcontrolApiserverV1Api$read_flow_schema()`](#method-FlowcontrolApiserverV1Api-read_flow_schema)

- [`FlowcontrolApiserverV1Api$replace_flow_schema()`](#method-FlowcontrolApiserverV1Api-replace_flow_schema)

- [`FlowcontrolApiserverV1Api$patch_flow_schema()`](#method-FlowcontrolApiserverV1Api-patch_flow_schema)

- [`FlowcontrolApiserverV1Api$delete_flow_schema()`](#method-FlowcontrolApiserverV1Api-delete_flow_schema)

- [`FlowcontrolApiserverV1Api$read_flow_schema_status()`](#method-FlowcontrolApiserverV1Api-read_flow_schema_status)

- [`FlowcontrolApiserverV1Api$replace_flow_schema_status()`](#method-FlowcontrolApiserverV1Api-replace_flow_schema_status)

- [`FlowcontrolApiserverV1Api$patch_flow_schema_status()`](#method-FlowcontrolApiserverV1Api-patch_flow_schema_status)

- [`FlowcontrolApiserverV1Api$list_priority_level_configuration()`](#method-FlowcontrolApiserverV1Api-list_priority_level_configuration)

- [`FlowcontrolApiserverV1Api$create_priority_level_configuration()`](#method-FlowcontrolApiserverV1Api-create_priority_level_configuration)

- [`FlowcontrolApiserverV1Api$delete_collection_priority_level_configuration()`](#method-FlowcontrolApiserverV1Api-delete_collection_priority_level_configuration)

- [`FlowcontrolApiserverV1Api$read_priority_level_configuration()`](#method-FlowcontrolApiserverV1Api-read_priority_level_configuration)

- [`FlowcontrolApiserverV1Api$replace_priority_level_configuration()`](#method-FlowcontrolApiserverV1Api-replace_priority_level_configuration)

- [`FlowcontrolApiserverV1Api$patch_priority_level_configuration()`](#method-FlowcontrolApiserverV1Api-patch_priority_level_configuration)

- [`FlowcontrolApiserverV1Api$delete_priority_level_configuration()`](#method-FlowcontrolApiserverV1Api-delete_priority_level_configuration)

- [`FlowcontrolApiserverV1Api$read_priority_level_configuration_status()`](#method-FlowcontrolApiserverV1Api-read_priority_level_configuration_status)

- [`FlowcontrolApiserverV1Api$replace_priority_level_configuration_status()`](#method-FlowcontrolApiserverV1Api-replace_priority_level_configuration_status)

- [`FlowcontrolApiserverV1Api$patch_priority_level_configuration_status()`](#method-FlowcontrolApiserverV1Api-patch_priority_level_configuration_status)

- [`FlowcontrolApiserverV1Api$watch_flow_schema_list()`](#method-FlowcontrolApiserverV1Api-watch_flow_schema_list)

- [`FlowcontrolApiserverV1Api$watch_flow_schema()`](#method-FlowcontrolApiserverV1Api-watch_flow_schema)

- [`FlowcontrolApiserverV1Api$watch_priority_level_configuration_list()`](#method-FlowcontrolApiserverV1Api-watch_priority_level_configuration_list)

- [`FlowcontrolApiserverV1Api$watch_priority_level_configuration()`](#method-FlowcontrolApiserverV1Api-watch_priority_level_configuration)

- [`FlowcontrolApiserverV1Api$clone()`](#method-FlowcontrolApiserverV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    FlowcontrolApiserverV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getFlowcontrolApiserverV1APIResources get available
  resources listFlowcontrolApiserverV1FlowSchema list or watch objects
  of kind FlowSchema

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    FlowcontrolApiserverV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_flow_schema()`

#### Usage

    FlowcontrolApiserverV1Api$list_flow_schema(
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

  = NULL createFlowcontrolApiserverV1FlowSchema create a FlowSchema

------------------------------------------------------------------------

### Method `create_flow_schema()`

#### Usage

    FlowcontrolApiserverV1Api$create_flow_schema(
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

  = NULL deleteFlowcontrolApiserverV1CollectionFlowSchema delete
  collection of FlowSchema

------------------------------------------------------------------------

### Method `delete_collection_flow_schema()`

#### Usage

    FlowcontrolApiserverV1Api$delete_collection_flow_schema(
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

  = NULL readFlowcontrolApiserverV1FlowSchema read the specified
  FlowSchema

------------------------------------------------------------------------

### Method `read_flow_schema()`

#### Usage

    FlowcontrolApiserverV1Api$read_flow_schema(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceFlowcontrolApiserverV1FlowSchema replace the specified
  FlowSchema

------------------------------------------------------------------------

### Method `replace_flow_schema()`

#### Usage

    FlowcontrolApiserverV1Api$replace_flow_schema(
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

  = NULL patchFlowcontrolApiserverV1FlowSchema partially update the
  specified FlowSchema

------------------------------------------------------------------------

### Method `patch_flow_schema()`

#### Usage

    FlowcontrolApiserverV1Api$patch_flow_schema(
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

  = "application/json-patch+json" deleteFlowcontrolApiserverV1FlowSchema
  delete a FlowSchema

------------------------------------------------------------------------

### Method `delete_flow_schema()`

#### Usage

    FlowcontrolApiserverV1Api$delete_flow_schema(
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

  = NULL readFlowcontrolApiserverV1FlowSchemaStatus read status of the
  specified FlowSchema

------------------------------------------------------------------------

### Method `read_flow_schema_status()`

#### Usage

    FlowcontrolApiserverV1Api$read_flow_schema_status(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceFlowcontrolApiserverV1FlowSchemaStatus replace status of
  the specified FlowSchema

------------------------------------------------------------------------

### Method `replace_flow_schema_status()`

#### Usage

    FlowcontrolApiserverV1Api$replace_flow_schema_status(
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

  = NULL patchFlowcontrolApiserverV1FlowSchemaStatus partially update
  status of the specified FlowSchema

------------------------------------------------------------------------

### Method `patch_flow_schema_status()`

#### Usage

    FlowcontrolApiserverV1Api$patch_flow_schema_status(
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
  listFlowcontrolApiserverV1PriorityLevelConfiguration list or watch
  objects of kind PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `list_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1Api$list_priority_level_configuration(
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

  = NULL createFlowcontrolApiserverV1PriorityLevelConfiguration create a
  PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `create_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1Api$create_priority_level_configuration(
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

  = NULL
  deleteFlowcontrolApiserverV1CollectionPriorityLevelConfiguration
  delete collection of PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `delete_collection_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1Api$delete_collection_priority_level_configuration(
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

  = NULL readFlowcontrolApiserverV1PriorityLevelConfiguration read the
  specified PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `read_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1Api$read_priority_level_configuration(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceFlowcontrolApiserverV1PriorityLevelConfiguration replace
  the specified PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `replace_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1Api$replace_priority_level_configuration(
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

  = NULL patchFlowcontrolApiserverV1PriorityLevelConfiguration partially
  update the specified PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `patch_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1Api$patch_priority_level_configuration(
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
  deleteFlowcontrolApiserverV1PriorityLevelConfiguration delete a
  PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `delete_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1Api$delete_priority_level_configuration(
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

  = NULL readFlowcontrolApiserverV1PriorityLevelConfigurationStatus read
  status of the specified PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `read_priority_level_configuration_status()`

#### Usage

    FlowcontrolApiserverV1Api$read_priority_level_configuration_status(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceFlowcontrolApiserverV1PriorityLevelConfigurationStatus
  replace status of the specified PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `replace_priority_level_configuration_status()`

#### Usage

    FlowcontrolApiserverV1Api$replace_priority_level_configuration_status(
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

  = NULL patchFlowcontrolApiserverV1PriorityLevelConfigurationStatus
  partially update status of the specified PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `patch_priority_level_configuration_status()`

#### Usage

    FlowcontrolApiserverV1Api$patch_priority_level_configuration_status(
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
  watchFlowcontrolApiserverV1FlowSchemaList watch individual changes to
  a list of FlowSchema. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_flow_schema_list()`

#### Usage

    FlowcontrolApiserverV1Api$watch_flow_schema_list(
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

  = NULL watchFlowcontrolApiserverV1FlowSchema watch changes to an
  object of kind FlowSchema. deprecated: use the 'watch' parameter with
  a list operation instead, filtered to a single item with the
  'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_flow_schema()`

#### Usage

    FlowcontrolApiserverV1Api$watch_flow_schema(
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

  = NULL watchFlowcontrolApiserverV1PriorityLevelConfigurationList watch
  individual changes to a list of PriorityLevelConfiguration.
  deprecated: use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_priority_level_configuration_list()`

#### Usage

    FlowcontrolApiserverV1Api$watch_priority_level_configuration_list(
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

  = NULL watchFlowcontrolApiserverV1PriorityLevelConfiguration watch
  changes to an object of kind PriorityLevelConfiguration. deprecated:
  use the 'watch' parameter with a list operation instead, filtered to a
  single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1Api$watch_priority_level_configuration(
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

    FlowcontrolApiserverV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
