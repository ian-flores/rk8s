# NetworkingV1beta1Api

NetworkingV1beta1Api

NetworkingV1beta1Api

## Details

Typed Kubernetes API client for the \`NetworkingV1beta1\` surface. See
generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`NetworkingV1beta1Api$new()`](#method-NetworkingV1beta1Api-new)

- [`NetworkingV1beta1Api$get_api_resources()`](#method-NetworkingV1beta1Api-get_api_resources)

- [`NetworkingV1beta1Api$list_ip_address()`](#method-NetworkingV1beta1Api-list_ip_address)

- [`NetworkingV1beta1Api$create_ip_address()`](#method-NetworkingV1beta1Api-create_ip_address)

- [`NetworkingV1beta1Api$delete_collection_ip_address()`](#method-NetworkingV1beta1Api-delete_collection_ip_address)

- [`NetworkingV1beta1Api$read_ip_address()`](#method-NetworkingV1beta1Api-read_ip_address)

- [`NetworkingV1beta1Api$replace_ip_address()`](#method-NetworkingV1beta1Api-replace_ip_address)

- [`NetworkingV1beta1Api$patch_ip_address()`](#method-NetworkingV1beta1Api-patch_ip_address)

- [`NetworkingV1beta1Api$delete_ip_address()`](#method-NetworkingV1beta1Api-delete_ip_address)

- [`NetworkingV1beta1Api$list_service_cidr()`](#method-NetworkingV1beta1Api-list_service_cidr)

- [`NetworkingV1beta1Api$create_service_cidr()`](#method-NetworkingV1beta1Api-create_service_cidr)

- [`NetworkingV1beta1Api$delete_collection_service_cidr()`](#method-NetworkingV1beta1Api-delete_collection_service_cidr)

- [`NetworkingV1beta1Api$read_service_cidr()`](#method-NetworkingV1beta1Api-read_service_cidr)

- [`NetworkingV1beta1Api$replace_service_cidr()`](#method-NetworkingV1beta1Api-replace_service_cidr)

- [`NetworkingV1beta1Api$patch_service_cidr()`](#method-NetworkingV1beta1Api-patch_service_cidr)

- [`NetworkingV1beta1Api$delete_service_cidr()`](#method-NetworkingV1beta1Api-delete_service_cidr)

- [`NetworkingV1beta1Api$read_service_cidr_status()`](#method-NetworkingV1beta1Api-read_service_cidr_status)

- [`NetworkingV1beta1Api$replace_service_cidr_status()`](#method-NetworkingV1beta1Api-replace_service_cidr_status)

- [`NetworkingV1beta1Api$patch_service_cidr_status()`](#method-NetworkingV1beta1Api-patch_service_cidr_status)

- [`NetworkingV1beta1Api$watch_ip_address_list()`](#method-NetworkingV1beta1Api-watch_ip_address_list)

- [`NetworkingV1beta1Api$watch_ip_address()`](#method-NetworkingV1beta1Api-watch_ip_address)

- [`NetworkingV1beta1Api$watch_service_cidr_list()`](#method-NetworkingV1beta1Api-watch_service_cidr_list)

- [`NetworkingV1beta1Api$watch_service_cidr()`](#method-NetworkingV1beta1Api-watch_service_cidr)

- [`NetworkingV1beta1Api$clone()`](#method-NetworkingV1beta1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    NetworkingV1beta1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getNetworkingV1beta1APIResources get available
  resources listNetworkingV1beta1IPAddress list or watch objects of kind
  IPAddress

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    NetworkingV1beta1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_ip_address()`

#### Usage

    NetworkingV1beta1Api$list_ip_address(
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

  = NULL createNetworkingV1beta1IPAddress create an IPAddress

------------------------------------------------------------------------

### Method `create_ip_address()`

#### Usage

    NetworkingV1beta1Api$create_ip_address(
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

  = NULL deleteNetworkingV1beta1CollectionIPAddress delete collection of
  IPAddress

------------------------------------------------------------------------

### Method `delete_collection_ip_address()`

#### Usage

    NetworkingV1beta1Api$delete_collection_ip_address(
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

  = NULL readNetworkingV1beta1IPAddress read the specified IPAddress

------------------------------------------------------------------------

### Method `read_ip_address()`

#### Usage

    NetworkingV1beta1Api$read_ip_address(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceNetworkingV1beta1IPAddress replace the specified
  IPAddress

------------------------------------------------------------------------

### Method `replace_ip_address()`

#### Usage

    NetworkingV1beta1Api$replace_ip_address(
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

  = NULL patchNetworkingV1beta1IPAddress partially update the specified
  IPAddress

------------------------------------------------------------------------

### Method `patch_ip_address()`

#### Usage

    NetworkingV1beta1Api$patch_ip_address(
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

  = "application/json-patch+json" deleteNetworkingV1beta1IPAddress
  delete an IPAddress

------------------------------------------------------------------------

### Method `delete_ip_address()`

#### Usage

    NetworkingV1beta1Api$delete_ip_address(
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

  = NULL listNetworkingV1beta1ServiceCIDR list or watch objects of kind
  ServiceCIDR

------------------------------------------------------------------------

### Method `list_service_cidr()`

#### Usage

    NetworkingV1beta1Api$list_service_cidr(
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

  = NULL createNetworkingV1beta1ServiceCIDR create a ServiceCIDR

------------------------------------------------------------------------

### Method `create_service_cidr()`

#### Usage

    NetworkingV1beta1Api$create_service_cidr(
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

  = NULL deleteNetworkingV1beta1CollectionServiceCIDR delete collection
  of ServiceCIDR

------------------------------------------------------------------------

### Method `delete_collection_service_cidr()`

#### Usage

    NetworkingV1beta1Api$delete_collection_service_cidr(
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

  = NULL readNetworkingV1beta1ServiceCIDR read the specified ServiceCIDR

------------------------------------------------------------------------

### Method `read_service_cidr()`

#### Usage

    NetworkingV1beta1Api$read_service_cidr(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceNetworkingV1beta1ServiceCIDR replace the specified
  ServiceCIDR

------------------------------------------------------------------------

### Method `replace_service_cidr()`

#### Usage

    NetworkingV1beta1Api$replace_service_cidr(
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

  = NULL patchNetworkingV1beta1ServiceCIDR partially update the
  specified ServiceCIDR

------------------------------------------------------------------------

### Method `patch_service_cidr()`

#### Usage

    NetworkingV1beta1Api$patch_service_cidr(
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

  = "application/json-patch+json" deleteNetworkingV1beta1ServiceCIDR
  delete a ServiceCIDR

------------------------------------------------------------------------

### Method `delete_service_cidr()`

#### Usage

    NetworkingV1beta1Api$delete_service_cidr(
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

  = NULL readNetworkingV1beta1ServiceCIDRStatus read status of the
  specified ServiceCIDR

------------------------------------------------------------------------

### Method `read_service_cidr_status()`

#### Usage

    NetworkingV1beta1Api$read_service_cidr_status(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceNetworkingV1beta1ServiceCIDRStatus replace status of the
  specified ServiceCIDR

------------------------------------------------------------------------

### Method `replace_service_cidr_status()`

#### Usage

    NetworkingV1beta1Api$replace_service_cidr_status(
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

  = NULL patchNetworkingV1beta1ServiceCIDRStatus partially update status
  of the specified ServiceCIDR

------------------------------------------------------------------------

### Method `patch_service_cidr_status()`

#### Usage

    NetworkingV1beta1Api$patch_service_cidr_status(
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

  = "application/json-patch+json" watchNetworkingV1beta1IPAddressList
  watch individual changes to a list of IPAddress. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_ip_address_list()`

#### Usage

    NetworkingV1beta1Api$watch_ip_address_list(
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

  = NULL watchNetworkingV1beta1IPAddress watch changes to an object of
  kind IPAddress. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_ip_address()`

#### Usage

    NetworkingV1beta1Api$watch_ip_address(
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

  = NULL watchNetworkingV1beta1ServiceCIDRList watch individual changes
  to a list of ServiceCIDR. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_service_cidr_list()`

#### Usage

    NetworkingV1beta1Api$watch_service_cidr_list(
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

  = NULL watchNetworkingV1beta1ServiceCIDR watch changes to an object of
  kind ServiceCIDR. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_service_cidr()`

#### Usage

    NetworkingV1beta1Api$watch_service_cidr(
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

    NetworkingV1beta1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
