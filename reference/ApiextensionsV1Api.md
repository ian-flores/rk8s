# ApiextensionsV1Api

ApiextensionsV1Api

ApiextensionsV1Api

## Details

Typed Kubernetes API client for the \`ApiextensionsV1\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`ApiextensionsV1Api$new()`](#method-ApiextensionsV1Api-new)

- [`ApiextensionsV1Api$get_api_resources()`](#method-ApiextensionsV1Api-get_api_resources)

- [`ApiextensionsV1Api$list_custom_resource_definition()`](#method-ApiextensionsV1Api-list_custom_resource_definition)

- [`ApiextensionsV1Api$create_custom_resource_definition()`](#method-ApiextensionsV1Api-create_custom_resource_definition)

- [`ApiextensionsV1Api$delete_collection_custom_resource_definition()`](#method-ApiextensionsV1Api-delete_collection_custom_resource_definition)

- [`ApiextensionsV1Api$read_custom_resource_definition()`](#method-ApiextensionsV1Api-read_custom_resource_definition)

- [`ApiextensionsV1Api$replace_custom_resource_definition()`](#method-ApiextensionsV1Api-replace_custom_resource_definition)

- [`ApiextensionsV1Api$patch_custom_resource_definition()`](#method-ApiextensionsV1Api-patch_custom_resource_definition)

- [`ApiextensionsV1Api$delete_custom_resource_definition()`](#method-ApiextensionsV1Api-delete_custom_resource_definition)

- [`ApiextensionsV1Api$read_custom_resource_definition_status()`](#method-ApiextensionsV1Api-read_custom_resource_definition_status)

- [`ApiextensionsV1Api$replace_custom_resource_definition_status()`](#method-ApiextensionsV1Api-replace_custom_resource_definition_status)

- [`ApiextensionsV1Api$patch_custom_resource_definition_status()`](#method-ApiextensionsV1Api-patch_custom_resource_definition_status)

- [`ApiextensionsV1Api$watch_custom_resource_definition_list()`](#method-ApiextensionsV1Api-watch_custom_resource_definition_list)

- [`ApiextensionsV1Api$watch_custom_resource_definition()`](#method-ApiextensionsV1Api-watch_custom_resource_definition)

- [`ApiextensionsV1Api$clone()`](#method-ApiextensionsV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    ApiextensionsV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getApiextensionsV1APIResources get available
  resources listApiextensionsV1CustomResourceDefinition list or watch
  objects of kind CustomResourceDefinition

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    ApiextensionsV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_custom_resource_definition()`

#### Usage

    ApiextensionsV1Api$list_custom_resource_definition(
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

  = NULL createApiextensionsV1CustomResourceDefinition create a
  CustomResourceDefinition

------------------------------------------------------------------------

### Method `create_custom_resource_definition()`

#### Usage

    ApiextensionsV1Api$create_custom_resource_definition(
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

  = NULL deleteApiextensionsV1CollectionCustomResourceDefinition delete
  collection of CustomResourceDefinition

------------------------------------------------------------------------

### Method `delete_collection_custom_resource_definition()`

#### Usage

    ApiextensionsV1Api$delete_collection_custom_resource_definition(
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

  = NULL readApiextensionsV1CustomResourceDefinition read the specified
  CustomResourceDefinition

------------------------------------------------------------------------

### Method `read_custom_resource_definition()`

#### Usage

    ApiextensionsV1Api$read_custom_resource_definition(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceApiextensionsV1CustomResourceDefinition replace the
  specified CustomResourceDefinition

------------------------------------------------------------------------

### Method `replace_custom_resource_definition()`

#### Usage

    ApiextensionsV1Api$replace_custom_resource_definition(
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

  = NULL patchApiextensionsV1CustomResourceDefinition partially update
  the specified CustomResourceDefinition

------------------------------------------------------------------------

### Method `patch_custom_resource_definition()`

#### Usage

    ApiextensionsV1Api$patch_custom_resource_definition(
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
  deleteApiextensionsV1CustomResourceDefinition delete a
  CustomResourceDefinition

------------------------------------------------------------------------

### Method `delete_custom_resource_definition()`

#### Usage

    ApiextensionsV1Api$delete_custom_resource_definition(
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

  = NULL readApiextensionsV1CustomResourceDefinitionStatus read status
  of the specified CustomResourceDefinition

------------------------------------------------------------------------

### Method `read_custom_resource_definition_status()`

#### Usage

    ApiextensionsV1Api$read_custom_resource_definition_status(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceApiextensionsV1CustomResourceDefinitionStatus replace
  status of the specified CustomResourceDefinition

------------------------------------------------------------------------

### Method `replace_custom_resource_definition_status()`

#### Usage

    ApiextensionsV1Api$replace_custom_resource_definition_status(
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

  = NULL patchApiextensionsV1CustomResourceDefinitionStatus partially
  update status of the specified CustomResourceDefinition

------------------------------------------------------------------------

### Method `patch_custom_resource_definition_status()`

#### Usage

    ApiextensionsV1Api$patch_custom_resource_definition_status(
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
  watchApiextensionsV1CustomResourceDefinitionList watch individual
  changes to a list of CustomResourceDefinition. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_custom_resource_definition_list()`

#### Usage

    ApiextensionsV1Api$watch_custom_resource_definition_list(
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

  = NULL watchApiextensionsV1CustomResourceDefinition watch changes to
  an object of kind CustomResourceDefinition. deprecated: use the
  'watch' parameter with a list operation instead, filtered to a single
  item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_custom_resource_definition()`

#### Usage

    ApiextensionsV1Api$watch_custom_resource_definition(
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

    ApiextensionsV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
