# ApiregistrationV1Api

ApiregistrationV1Api

ApiregistrationV1Api

## Details

Typed Kubernetes API client for the \`ApiregistrationV1\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`ApiregistrationV1Api$new()`](#method-ApiregistrationV1Api-new)

- [`ApiregistrationV1Api$get_api_resources()`](#method-ApiregistrationV1Api-get_api_resources)

- [`ApiregistrationV1Api$list_api_service()`](#method-ApiregistrationV1Api-list_api_service)

- [`ApiregistrationV1Api$create_api_service()`](#method-ApiregistrationV1Api-create_api_service)

- [`ApiregistrationV1Api$delete_collection_api_service()`](#method-ApiregistrationV1Api-delete_collection_api_service)

- [`ApiregistrationV1Api$read_api_service()`](#method-ApiregistrationV1Api-read_api_service)

- [`ApiregistrationV1Api$replace_api_service()`](#method-ApiregistrationV1Api-replace_api_service)

- [`ApiregistrationV1Api$patch_api_service()`](#method-ApiregistrationV1Api-patch_api_service)

- [`ApiregistrationV1Api$delete_api_service()`](#method-ApiregistrationV1Api-delete_api_service)

- [`ApiregistrationV1Api$read_api_service_status()`](#method-ApiregistrationV1Api-read_api_service_status)

- [`ApiregistrationV1Api$replace_api_service_status()`](#method-ApiregistrationV1Api-replace_api_service_status)

- [`ApiregistrationV1Api$patch_api_service_status()`](#method-ApiregistrationV1Api-patch_api_service_status)

- [`ApiregistrationV1Api$watch_api_service_list()`](#method-ApiregistrationV1Api-watch_api_service_list)

- [`ApiregistrationV1Api$watch_api_service()`](#method-ApiregistrationV1Api-watch_api_service)

- [`ApiregistrationV1Api$clone()`](#method-ApiregistrationV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    ApiregistrationV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getApiregistrationV1APIResources get available
  resources listApiregistrationV1APIService list or watch objects of
  kind APIService

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    ApiregistrationV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_api_service()`

#### Usage

    ApiregistrationV1Api$list_api_service(
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

  = NULL createApiregistrationV1APIService create an APIService

------------------------------------------------------------------------

### Method `create_api_service()`

#### Usage

    ApiregistrationV1Api$create_api_service(
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

  = NULL deleteApiregistrationV1CollectionAPIService delete collection
  of APIService

------------------------------------------------------------------------

### Method `delete_collection_api_service()`

#### Usage

    ApiregistrationV1Api$delete_collection_api_service(
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

  = NULL readApiregistrationV1APIService read the specified APIService

------------------------------------------------------------------------

### Method `read_api_service()`

#### Usage

    ApiregistrationV1Api$read_api_service(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceApiregistrationV1APIService replace the specified
  APIService

------------------------------------------------------------------------

### Method `replace_api_service()`

#### Usage

    ApiregistrationV1Api$replace_api_service(
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

  = NULL patchApiregistrationV1APIService partially update the specified
  APIService

------------------------------------------------------------------------

### Method `patch_api_service()`

#### Usage

    ApiregistrationV1Api$patch_api_service(
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

  = "application/json-patch+json" deleteApiregistrationV1APIService
  delete an APIService

------------------------------------------------------------------------

### Method `delete_api_service()`

#### Usage

    ApiregistrationV1Api$delete_api_service(
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

  = NULL readApiregistrationV1APIServiceStatus read status of the
  specified APIService

------------------------------------------------------------------------

### Method `read_api_service_status()`

#### Usage

    ApiregistrationV1Api$read_api_service_status(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceApiregistrationV1APIServiceStatus replace status of the
  specified APIService

------------------------------------------------------------------------

### Method `replace_api_service_status()`

#### Usage

    ApiregistrationV1Api$replace_api_service_status(
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

  = NULL patchApiregistrationV1APIServiceStatus partially update status
  of the specified APIService

------------------------------------------------------------------------

### Method `patch_api_service_status()`

#### Usage

    ApiregistrationV1Api$patch_api_service_status(
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

  = "application/json-patch+json" watchApiregistrationV1APIServiceList
  watch individual changes to a list of APIService. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_api_service_list()`

#### Usage

    ApiregistrationV1Api$watch_api_service_list(
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

  = NULL watchApiregistrationV1APIService watch changes to an object of
  kind APIService. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_api_service()`

#### Usage

    ApiregistrationV1Api$watch_api_service(
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

    ApiregistrationV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
