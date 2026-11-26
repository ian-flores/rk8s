# CertificatesV1alpha1Api

CertificatesV1alpha1Api

CertificatesV1alpha1Api

## Details

Typed Kubernetes API client for the \`CertificatesV1alpha1\` surface.
See generated methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`CertificatesV1alpha1Api$new()`](#method-CertificatesV1alpha1Api-new)

- [`CertificatesV1alpha1Api$get_api_resources()`](#method-CertificatesV1alpha1Api-get_api_resources)

- [`CertificatesV1alpha1Api$list_cluster_trust_bundle()`](#method-CertificatesV1alpha1Api-list_cluster_trust_bundle)

- [`CertificatesV1alpha1Api$create_cluster_trust_bundle()`](#method-CertificatesV1alpha1Api-create_cluster_trust_bundle)

- [`CertificatesV1alpha1Api$delete_collection_cluster_trust_bundle()`](#method-CertificatesV1alpha1Api-delete_collection_cluster_trust_bundle)

- [`CertificatesV1alpha1Api$read_cluster_trust_bundle()`](#method-CertificatesV1alpha1Api-read_cluster_trust_bundle)

- [`CertificatesV1alpha1Api$replace_cluster_trust_bundle()`](#method-CertificatesV1alpha1Api-replace_cluster_trust_bundle)

- [`CertificatesV1alpha1Api$patch_cluster_trust_bundle()`](#method-CertificatesV1alpha1Api-patch_cluster_trust_bundle)

- [`CertificatesV1alpha1Api$delete_cluster_trust_bundle()`](#method-CertificatesV1alpha1Api-delete_cluster_trust_bundle)

- [`CertificatesV1alpha1Api$watch_cluster_trust_bundle_list()`](#method-CertificatesV1alpha1Api-watch_cluster_trust_bundle_list)

- [`CertificatesV1alpha1Api$watch_cluster_trust_bundle()`](#method-CertificatesV1alpha1Api-watch_cluster_trust_bundle)

- [`CertificatesV1alpha1Api$clone()`](#method-CertificatesV1alpha1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    CertificatesV1alpha1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getCertificatesV1alpha1APIResources get available
  resources listCertificatesV1alpha1ClusterTrustBundle list or watch
  objects of kind ClusterTrustBundle

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    CertificatesV1alpha1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_cluster_trust_bundle()`

#### Usage

    CertificatesV1alpha1Api$list_cluster_trust_bundle(
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

  = NULL createCertificatesV1alpha1ClusterTrustBundle create a
  ClusterTrustBundle

------------------------------------------------------------------------

### Method `create_cluster_trust_bundle()`

#### Usage

    CertificatesV1alpha1Api$create_cluster_trust_bundle(
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

  = NULL deleteCertificatesV1alpha1CollectionClusterTrustBundle delete
  collection of ClusterTrustBundle

------------------------------------------------------------------------

### Method `delete_collection_cluster_trust_bundle()`

#### Usage

    CertificatesV1alpha1Api$delete_collection_cluster_trust_bundle(
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

  = NULL readCertificatesV1alpha1ClusterTrustBundle read the specified
  ClusterTrustBundle

------------------------------------------------------------------------

### Method `read_cluster_trust_bundle()`

#### Usage

    CertificatesV1alpha1Api$read_cluster_trust_bundle(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCertificatesV1alpha1ClusterTrustBundle replace the
  specified ClusterTrustBundle

------------------------------------------------------------------------

### Method `replace_cluster_trust_bundle()`

#### Usage

    CertificatesV1alpha1Api$replace_cluster_trust_bundle(
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

  = NULL patchCertificatesV1alpha1ClusterTrustBundle partially update
  the specified ClusterTrustBundle

------------------------------------------------------------------------

### Method `patch_cluster_trust_bundle()`

#### Usage

    CertificatesV1alpha1Api$patch_cluster_trust_bundle(
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
  deleteCertificatesV1alpha1ClusterTrustBundle delete a
  ClusterTrustBundle

------------------------------------------------------------------------

### Method `delete_cluster_trust_bundle()`

#### Usage

    CertificatesV1alpha1Api$delete_cluster_trust_bundle(
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

  = NULL watchCertificatesV1alpha1ClusterTrustBundleList watch
  individual changes to a list of ClusterTrustBundle. deprecated: use
  the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_cluster_trust_bundle_list()`

#### Usage

    CertificatesV1alpha1Api$watch_cluster_trust_bundle_list(
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

  = NULL watchCertificatesV1alpha1ClusterTrustBundle watch changes to an
  object of kind ClusterTrustBundle. deprecated: use the 'watch'
  parameter with a list operation instead, filtered to a single item
  with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_cluster_trust_bundle()`

#### Usage

    CertificatesV1alpha1Api$watch_cluster_trust_bundle(
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

    CertificatesV1alpha1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
