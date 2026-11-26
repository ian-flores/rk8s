# EventsV1Api

EventsV1Api

EventsV1Api

## Details

Typed Kubernetes API client for the \`EventsV1\` surface. See generated
methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`EventsV1Api$new()`](#method-EventsV1Api-new)

- [`EventsV1Api$get_api_resources()`](#method-EventsV1Api-get_api_resources)

- [`EventsV1Api$list_event_for_all_namespaces()`](#method-EventsV1Api-list_event_for_all_namespaces)

- [`EventsV1Api$list_namespaced_event()`](#method-EventsV1Api-list_namespaced_event)

- [`EventsV1Api$create_namespaced_event()`](#method-EventsV1Api-create_namespaced_event)

- [`EventsV1Api$delete_collection_namespaced_event()`](#method-EventsV1Api-delete_collection_namespaced_event)

- [`EventsV1Api$read_namespaced_event()`](#method-EventsV1Api-read_namespaced_event)

- [`EventsV1Api$replace_namespaced_event()`](#method-EventsV1Api-replace_namespaced_event)

- [`EventsV1Api$patch_namespaced_event()`](#method-EventsV1Api-patch_namespaced_event)

- [`EventsV1Api$delete_namespaced_event()`](#method-EventsV1Api-delete_namespaced_event)

- [`EventsV1Api$watch_event_list_for_all_namespaces()`](#method-EventsV1Api-watch_event_list_for_all_namespaces)

- [`EventsV1Api$watch_namespaced_event_list()`](#method-EventsV1Api-watch_namespaced_event_list)

- [`EventsV1Api$watch_namespaced_event()`](#method-EventsV1Api-watch_namespaced_event)

- [`EventsV1Api$clone()`](#method-EventsV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    EventsV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getEventsV1APIResources get available resources
  listEventsV1EventForAllNamespaces list or watch objects of kind Event

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    EventsV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_event_for_all_namespaces()`

#### Usage

    EventsV1Api$list_event_for_all_namespaces(
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

  = NULL listEventsV1NamespacedEvent list or watch objects of kind Event

------------------------------------------------------------------------

### Method `list_namespaced_event()`

#### Usage

    EventsV1Api$list_namespaced_event(
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

  = NULL createEventsV1NamespacedEvent create an Event

------------------------------------------------------------------------

### Method `create_namespaced_event()`

#### Usage

    EventsV1Api$create_namespaced_event(
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

  = NULL deleteEventsV1CollectionNamespacedEvent delete collection of
  Event

------------------------------------------------------------------------

### Method `delete_collection_namespaced_event()`

#### Usage

    EventsV1Api$delete_collection_namespaced_event(
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

  = NULL readEventsV1NamespacedEvent read the specified Event

------------------------------------------------------------------------

### Method `read_namespaced_event()`

#### Usage

    EventsV1Api$read_namespaced_event(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceEventsV1NamespacedEvent replace the specified Event

------------------------------------------------------------------------

### Method `replace_namespaced_event()`

#### Usage

    EventsV1Api$replace_namespaced_event(
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

  = NULL patchEventsV1NamespacedEvent partially update the specified
  Event

------------------------------------------------------------------------

### Method `patch_namespaced_event()`

#### Usage

    EventsV1Api$patch_namespaced_event(
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

  = "application/json-patch+json" deleteEventsV1NamespacedEvent delete
  an Event

------------------------------------------------------------------------

### Method `delete_namespaced_event()`

#### Usage

    EventsV1Api$delete_namespaced_event(
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

  = NULL watchEventsV1EventListForAllNamespaces watch individual changes
  to a list of Event. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_event_list_for_all_namespaces()`

#### Usage

    EventsV1Api$watch_event_list_for_all_namespaces(
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

  = NULL watchEventsV1NamespacedEventList watch individual changes to a
  list of Event. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_event_list()`

#### Usage

    EventsV1Api$watch_namespaced_event_list(
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

  = NULL watchEventsV1NamespacedEvent watch changes to an object of kind
  Event. deprecated: use the 'watch' parameter with a list operation
  instead, filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_event()`

#### Usage

    EventsV1Api$watch_namespaced_event(
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

    EventsV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
