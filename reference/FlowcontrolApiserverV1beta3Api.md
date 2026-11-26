# FlowcontrolApiserverV1beta3Api

FlowcontrolApiserverV1beta3Api

FlowcontrolApiserverV1beta3Api

## Details

Typed Kubernetes API client for the \`FlowcontrolApiserverV1beta3\`
surface. See generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`FlowcontrolApiserverV1beta3Api$new()`](#method-FlowcontrolApiserverV1beta3Api-new)

- [`FlowcontrolApiserverV1beta3Api$get_api_resources()`](#method-FlowcontrolApiserverV1beta3Api-get_api_resources)

- [`FlowcontrolApiserverV1beta3Api$list_flow_schema()`](#method-FlowcontrolApiserverV1beta3Api-list_flow_schema)

- [`FlowcontrolApiserverV1beta3Api$create_flow_schema()`](#method-FlowcontrolApiserverV1beta3Api-create_flow_schema)

- [`FlowcontrolApiserverV1beta3Api$delete_collection_flow_schema()`](#method-FlowcontrolApiserverV1beta3Api-delete_collection_flow_schema)

- [`FlowcontrolApiserverV1beta3Api$read_flow_schema()`](#method-FlowcontrolApiserverV1beta3Api-read_flow_schema)

- [`FlowcontrolApiserverV1beta3Api$replace_flow_schema()`](#method-FlowcontrolApiserverV1beta3Api-replace_flow_schema)

- [`FlowcontrolApiserverV1beta3Api$patch_flow_schema()`](#method-FlowcontrolApiserverV1beta3Api-patch_flow_schema)

- [`FlowcontrolApiserverV1beta3Api$delete_flow_schema()`](#method-FlowcontrolApiserverV1beta3Api-delete_flow_schema)

- [`FlowcontrolApiserverV1beta3Api$read_flow_schema_status()`](#method-FlowcontrolApiserverV1beta3Api-read_flow_schema_status)

- [`FlowcontrolApiserverV1beta3Api$replace_flow_schema_status()`](#method-FlowcontrolApiserverV1beta3Api-replace_flow_schema_status)

- [`FlowcontrolApiserverV1beta3Api$patch_flow_schema_status()`](#method-FlowcontrolApiserverV1beta3Api-patch_flow_schema_status)

- [`FlowcontrolApiserverV1beta3Api$list_priority_level_configuration()`](#method-FlowcontrolApiserverV1beta3Api-list_priority_level_configuration)

- [`FlowcontrolApiserverV1beta3Api$create_priority_level_configuration()`](#method-FlowcontrolApiserverV1beta3Api-create_priority_level_configuration)

- [`FlowcontrolApiserverV1beta3Api$delete_collection_priority_level_configuration()`](#method-FlowcontrolApiserverV1beta3Api-delete_collection_priority_level_configuration)

- [`FlowcontrolApiserverV1beta3Api$read_priority_level_configuration()`](#method-FlowcontrolApiserverV1beta3Api-read_priority_level_configuration)

- [`FlowcontrolApiserverV1beta3Api$replace_priority_level_configuration()`](#method-FlowcontrolApiserverV1beta3Api-replace_priority_level_configuration)

- [`FlowcontrolApiserverV1beta3Api$patch_priority_level_configuration()`](#method-FlowcontrolApiserverV1beta3Api-patch_priority_level_configuration)

- [`FlowcontrolApiserverV1beta3Api$delete_priority_level_configuration()`](#method-FlowcontrolApiserverV1beta3Api-delete_priority_level_configuration)

- [`FlowcontrolApiserverV1beta3Api$read_priority_level_configuration_status()`](#method-FlowcontrolApiserverV1beta3Api-read_priority_level_configuration_status)

- [`FlowcontrolApiserverV1beta3Api$replace_priority_level_configuration_status()`](#method-FlowcontrolApiserverV1beta3Api-replace_priority_level_configuration_status)

- [`FlowcontrolApiserverV1beta3Api$patch_priority_level_configuration_status()`](#method-FlowcontrolApiserverV1beta3Api-patch_priority_level_configuration_status)

- [`FlowcontrolApiserverV1beta3Api$watch_flow_schema_list()`](#method-FlowcontrolApiserverV1beta3Api-watch_flow_schema_list)

- [`FlowcontrolApiserverV1beta3Api$watch_flow_schema()`](#method-FlowcontrolApiserverV1beta3Api-watch_flow_schema)

- [`FlowcontrolApiserverV1beta3Api$watch_priority_level_configuration_list()`](#method-FlowcontrolApiserverV1beta3Api-watch_priority_level_configuration_list)

- [`FlowcontrolApiserverV1beta3Api$watch_priority_level_configuration()`](#method-FlowcontrolApiserverV1beta3Api-watch_priority_level_configuration)

- [`FlowcontrolApiserverV1beta3Api$clone()`](#method-FlowcontrolApiserverV1beta3Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    FlowcontrolApiserverV1beta3Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getFlowcontrolApiserverV1beta3APIResources get
  available resources listFlowcontrolApiserverV1beta3FlowSchema list or
  watch objects of kind FlowSchema

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    FlowcontrolApiserverV1beta3Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_flow_schema()`

#### Usage

    FlowcontrolApiserverV1beta3Api$list_flow_schema(
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

  = NULL createFlowcontrolApiserverV1beta3FlowSchema create a FlowSchema

------------------------------------------------------------------------

### Method `create_flow_schema()`

#### Usage

    FlowcontrolApiserverV1beta3Api$create_flow_schema(
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

  = NULL deleteFlowcontrolApiserverV1beta3CollectionFlowSchema delete
  collection of FlowSchema

------------------------------------------------------------------------

### Method `delete_collection_flow_schema()`

#### Usage

    FlowcontrolApiserverV1beta3Api$delete_collection_flow_schema(
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

  = NULL readFlowcontrolApiserverV1beta3FlowSchema read the specified
  FlowSchema

------------------------------------------------------------------------

### Method `read_flow_schema()`

#### Usage

    FlowcontrolApiserverV1beta3Api$read_flow_schema(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceFlowcontrolApiserverV1beta3FlowSchema replace the
  specified FlowSchema

------------------------------------------------------------------------

### Method `replace_flow_schema()`

#### Usage

    FlowcontrolApiserverV1beta3Api$replace_flow_schema(
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

  = NULL patchFlowcontrolApiserverV1beta3FlowSchema partially update the
  specified FlowSchema

------------------------------------------------------------------------

### Method `patch_flow_schema()`

#### Usage

    FlowcontrolApiserverV1beta3Api$patch_flow_schema(
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
  deleteFlowcontrolApiserverV1beta3FlowSchema delete a FlowSchema

------------------------------------------------------------------------

### Method `delete_flow_schema()`

#### Usage

    FlowcontrolApiserverV1beta3Api$delete_flow_schema(
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

  = NULL readFlowcontrolApiserverV1beta3FlowSchemaStatus read status of
  the specified FlowSchema

------------------------------------------------------------------------

### Method `read_flow_schema_status()`

#### Usage

    FlowcontrolApiserverV1beta3Api$read_flow_schema_status(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceFlowcontrolApiserverV1beta3FlowSchemaStatus replace
  status of the specified FlowSchema

------------------------------------------------------------------------

### Method `replace_flow_schema_status()`

#### Usage

    FlowcontrolApiserverV1beta3Api$replace_flow_schema_status(
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

  = NULL patchFlowcontrolApiserverV1beta3FlowSchemaStatus partially
  update status of the specified FlowSchema

------------------------------------------------------------------------

### Method `patch_flow_schema_status()`

#### Usage

    FlowcontrolApiserverV1beta3Api$patch_flow_schema_status(
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
  listFlowcontrolApiserverV1beta3PriorityLevelConfiguration list or
  watch objects of kind PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `list_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1beta3Api$list_priority_level_configuration(
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

  = NULL createFlowcontrolApiserverV1beta3PriorityLevelConfiguration
  create a PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `create_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1beta3Api$create_priority_level_configuration(
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
  deleteFlowcontrolApiserverV1beta3CollectionPriorityLevelConfiguration
  delete collection of PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `delete_collection_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1beta3Api$delete_collection_priority_level_configuration(
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

  = NULL readFlowcontrolApiserverV1beta3PriorityLevelConfiguration read
  the specified PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `read_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1beta3Api$read_priority_level_configuration(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceFlowcontrolApiserverV1beta3PriorityLevelConfiguration
  replace the specified PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `replace_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1beta3Api$replace_priority_level_configuration(
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

  = NULL patchFlowcontrolApiserverV1beta3PriorityLevelConfiguration
  partially update the specified PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `patch_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1beta3Api$patch_priority_level_configuration(
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
  deleteFlowcontrolApiserverV1beta3PriorityLevelConfiguration delete a
  PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `delete_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1beta3Api$delete_priority_level_configuration(
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

  = NULL readFlowcontrolApiserverV1beta3PriorityLevelConfigurationStatus
  read status of the specified PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `read_priority_level_configuration_status()`

#### Usage

    FlowcontrolApiserverV1beta3Api$read_priority_level_configuration_status(
      name,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL
  replaceFlowcontrolApiserverV1beta3PriorityLevelConfigurationStatus
  replace status of the specified PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `replace_priority_level_configuration_status()`

#### Usage

    FlowcontrolApiserverV1beta3Api$replace_priority_level_configuration_status(
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

  = NULL
  patchFlowcontrolApiserverV1beta3PriorityLevelConfigurationStatus
  partially update status of the specified PriorityLevelConfiguration

------------------------------------------------------------------------

### Method `patch_priority_level_configuration_status()`

#### Usage

    FlowcontrolApiserverV1beta3Api$patch_priority_level_configuration_status(
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
  watchFlowcontrolApiserverV1beta3FlowSchemaList watch individual
  changes to a list of FlowSchema. deprecated: use the 'watch' parameter
  with a list operation instead.

------------------------------------------------------------------------

### Method `watch_flow_schema_list()`

#### Usage

    FlowcontrolApiserverV1beta3Api$watch_flow_schema_list(
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

  = NULL watchFlowcontrolApiserverV1beta3FlowSchema watch changes to an
  object of kind FlowSchema. deprecated: use the 'watch' parameter with
  a list operation instead, filtered to a single item with the
  'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_flow_schema()`

#### Usage

    FlowcontrolApiserverV1beta3Api$watch_flow_schema(
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

  = NULL watchFlowcontrolApiserverV1beta3PriorityLevelConfigurationList
  watch individual changes to a list of PriorityLevelConfiguration.
  deprecated: use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_priority_level_configuration_list()`

#### Usage

    FlowcontrolApiserverV1beta3Api$watch_priority_level_configuration_list(
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

  = NULL watchFlowcontrolApiserverV1beta3PriorityLevelConfiguration
  watch changes to an object of kind PriorityLevelConfiguration.
  deprecated: use the 'watch' parameter with a list operation instead,
  filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_priority_level_configuration()`

#### Usage

    FlowcontrolApiserverV1beta3Api$watch_priority_level_configuration(
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

    FlowcontrolApiserverV1beta3Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
