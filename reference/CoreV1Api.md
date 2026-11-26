# CoreV1Api

CoreV1Api

CoreV1Api

## Details

Typed Kubernetes API client for the \`CoreV1\` surface. See generated
methods for available operations.

## Public fields

- `api_client`:

  The backing \[ApiClient\].

## Methods

### Public methods

- [`CoreV1Api$new()`](#method-CoreV1Api-new)

- [`CoreV1Api$get_api_resources()`](#method-CoreV1Api-get_api_resources)

- [`CoreV1Api$list_component_status()`](#method-CoreV1Api-list_component_status)

- [`CoreV1Api$read_component_status()`](#method-CoreV1Api-read_component_status)

- [`CoreV1Api$list_config_map_for_all_namespaces()`](#method-CoreV1Api-list_config_map_for_all_namespaces)

- [`CoreV1Api$list_endpoints_for_all_namespaces()`](#method-CoreV1Api-list_endpoints_for_all_namespaces)

- [`CoreV1Api$list_event_for_all_namespaces()`](#method-CoreV1Api-list_event_for_all_namespaces)

- [`CoreV1Api$list_limit_range_for_all_namespaces()`](#method-CoreV1Api-list_limit_range_for_all_namespaces)

- [`CoreV1Api$list_namespace()`](#method-CoreV1Api-list_namespace)

- [`CoreV1Api$create_namespace()`](#method-CoreV1Api-create_namespace)

- [`CoreV1Api$create_namespaced_binding()`](#method-CoreV1Api-create_namespaced_binding)

- [`CoreV1Api$list_namespaced_config_map()`](#method-CoreV1Api-list_namespaced_config_map)

- [`CoreV1Api$create_namespaced_config_map()`](#method-CoreV1Api-create_namespaced_config_map)

- [`CoreV1Api$delete_collection_namespaced_config_map()`](#method-CoreV1Api-delete_collection_namespaced_config_map)

- [`CoreV1Api$read_namespaced_config_map()`](#method-CoreV1Api-read_namespaced_config_map)

- [`CoreV1Api$replace_namespaced_config_map()`](#method-CoreV1Api-replace_namespaced_config_map)

- [`CoreV1Api$patch_namespaced_config_map()`](#method-CoreV1Api-patch_namespaced_config_map)

- [`CoreV1Api$delete_namespaced_config_map()`](#method-CoreV1Api-delete_namespaced_config_map)

- [`CoreV1Api$list_namespaced_endpoints()`](#method-CoreV1Api-list_namespaced_endpoints)

- [`CoreV1Api$create_namespaced_endpoints()`](#method-CoreV1Api-create_namespaced_endpoints)

- [`CoreV1Api$delete_collection_namespaced_endpoints()`](#method-CoreV1Api-delete_collection_namespaced_endpoints)

- [`CoreV1Api$read_namespaced_endpoints()`](#method-CoreV1Api-read_namespaced_endpoints)

- [`CoreV1Api$replace_namespaced_endpoints()`](#method-CoreV1Api-replace_namespaced_endpoints)

- [`CoreV1Api$patch_namespaced_endpoints()`](#method-CoreV1Api-patch_namespaced_endpoints)

- [`CoreV1Api$delete_namespaced_endpoints()`](#method-CoreV1Api-delete_namespaced_endpoints)

- [`CoreV1Api$list_namespaced_event()`](#method-CoreV1Api-list_namespaced_event)

- [`CoreV1Api$create_namespaced_event()`](#method-CoreV1Api-create_namespaced_event)

- [`CoreV1Api$delete_collection_namespaced_event()`](#method-CoreV1Api-delete_collection_namespaced_event)

- [`CoreV1Api$read_namespaced_event()`](#method-CoreV1Api-read_namespaced_event)

- [`CoreV1Api$replace_namespaced_event()`](#method-CoreV1Api-replace_namespaced_event)

- [`CoreV1Api$patch_namespaced_event()`](#method-CoreV1Api-patch_namespaced_event)

- [`CoreV1Api$delete_namespaced_event()`](#method-CoreV1Api-delete_namespaced_event)

- [`CoreV1Api$list_namespaced_limit_range()`](#method-CoreV1Api-list_namespaced_limit_range)

- [`CoreV1Api$create_namespaced_limit_range()`](#method-CoreV1Api-create_namespaced_limit_range)

- [`CoreV1Api$delete_collection_namespaced_limit_range()`](#method-CoreV1Api-delete_collection_namespaced_limit_range)

- [`CoreV1Api$read_namespaced_limit_range()`](#method-CoreV1Api-read_namespaced_limit_range)

- [`CoreV1Api$replace_namespaced_limit_range()`](#method-CoreV1Api-replace_namespaced_limit_range)

- [`CoreV1Api$patch_namespaced_limit_range()`](#method-CoreV1Api-patch_namespaced_limit_range)

- [`CoreV1Api$delete_namespaced_limit_range()`](#method-CoreV1Api-delete_namespaced_limit_range)

- [`CoreV1Api$list_namespaced_persistent_volume_claim()`](#method-CoreV1Api-list_namespaced_persistent_volume_claim)

- [`CoreV1Api$create_namespaced_persistent_volume_claim()`](#method-CoreV1Api-create_namespaced_persistent_volume_claim)

- [`CoreV1Api$delete_collection_namespaced_persistent_volume_claim()`](#method-CoreV1Api-delete_collection_namespaced_persistent_volume_claim)

- [`CoreV1Api$read_namespaced_persistent_volume_claim()`](#method-CoreV1Api-read_namespaced_persistent_volume_claim)

- [`CoreV1Api$replace_namespaced_persistent_volume_claim()`](#method-CoreV1Api-replace_namespaced_persistent_volume_claim)

- [`CoreV1Api$patch_namespaced_persistent_volume_claim()`](#method-CoreV1Api-patch_namespaced_persistent_volume_claim)

- [`CoreV1Api$delete_namespaced_persistent_volume_claim()`](#method-CoreV1Api-delete_namespaced_persistent_volume_claim)

- [`CoreV1Api$read_namespaced_persistent_volume_claim_status()`](#method-CoreV1Api-read_namespaced_persistent_volume_claim_status)

- [`CoreV1Api$replace_namespaced_persistent_volume_claim_status()`](#method-CoreV1Api-replace_namespaced_persistent_volume_claim_status)

- [`CoreV1Api$patch_namespaced_persistent_volume_claim_status()`](#method-CoreV1Api-patch_namespaced_persistent_volume_claim_status)

- [`CoreV1Api$list_namespaced_pod()`](#method-CoreV1Api-list_namespaced_pod)

- [`CoreV1Api$create_namespaced_pod()`](#method-CoreV1Api-create_namespaced_pod)

- [`CoreV1Api$delete_collection_namespaced_pod()`](#method-CoreV1Api-delete_collection_namespaced_pod)

- [`CoreV1Api$read_namespaced_pod()`](#method-CoreV1Api-read_namespaced_pod)

- [`CoreV1Api$replace_namespaced_pod()`](#method-CoreV1Api-replace_namespaced_pod)

- [`CoreV1Api$patch_namespaced_pod()`](#method-CoreV1Api-patch_namespaced_pod)

- [`CoreV1Api$delete_namespaced_pod()`](#method-CoreV1Api-delete_namespaced_pod)

- [`CoreV1Api$connect_get_namespaced_pod_attach()`](#method-CoreV1Api-connect_get_namespaced_pod_attach)

- [`CoreV1Api$connect_post_namespaced_pod_attach()`](#method-CoreV1Api-connect_post_namespaced_pod_attach)

- [`CoreV1Api$create_namespaced_pod_binding()`](#method-CoreV1Api-create_namespaced_pod_binding)

- [`CoreV1Api$read_namespaced_pod_ephemeralcontainers()`](#method-CoreV1Api-read_namespaced_pod_ephemeralcontainers)

- [`CoreV1Api$replace_namespaced_pod_ephemeralcontainers()`](#method-CoreV1Api-replace_namespaced_pod_ephemeralcontainers)

- [`CoreV1Api$patch_namespaced_pod_ephemeralcontainers()`](#method-CoreV1Api-patch_namespaced_pod_ephemeralcontainers)

- [`CoreV1Api$create_namespaced_pod_eviction()`](#method-CoreV1Api-create_namespaced_pod_eviction)

- [`CoreV1Api$connect_get_namespaced_pod_exec()`](#method-CoreV1Api-connect_get_namespaced_pod_exec)

- [`CoreV1Api$connect_post_namespaced_pod_exec()`](#method-CoreV1Api-connect_post_namespaced_pod_exec)

- [`CoreV1Api$read_namespaced_pod_log()`](#method-CoreV1Api-read_namespaced_pod_log)

- [`CoreV1Api$connect_get_namespaced_pod_portforward()`](#method-CoreV1Api-connect_get_namespaced_pod_portforward)

- [`CoreV1Api$connect_post_namespaced_pod_portforward()`](#method-CoreV1Api-connect_post_namespaced_pod_portforward)

- [`CoreV1Api$connect_get_namespaced_pod_proxy()`](#method-CoreV1Api-connect_get_namespaced_pod_proxy)

- [`CoreV1Api$connect_post_namespaced_pod_proxy()`](#method-CoreV1Api-connect_post_namespaced_pod_proxy)

- [`CoreV1Api$connect_put_namespaced_pod_proxy()`](#method-CoreV1Api-connect_put_namespaced_pod_proxy)

- [`CoreV1Api$connect_patch_namespaced_pod_proxy()`](#method-CoreV1Api-connect_patch_namespaced_pod_proxy)

- [`CoreV1Api$connect_delete_namespaced_pod_proxy()`](#method-CoreV1Api-connect_delete_namespaced_pod_proxy)

- [`CoreV1Api$connect_options_namespaced_pod_proxy()`](#method-CoreV1Api-connect_options_namespaced_pod_proxy)

- [`CoreV1Api$connect_head_namespaced_pod_proxy()`](#method-CoreV1Api-connect_head_namespaced_pod_proxy)

- [`CoreV1Api$connect_get_namespaced_pod_proxy_with_path()`](#method-CoreV1Api-connect_get_namespaced_pod_proxy_with_path)

- [`CoreV1Api$connect_post_namespaced_pod_proxy_with_path()`](#method-CoreV1Api-connect_post_namespaced_pod_proxy_with_path)

- [`CoreV1Api$connect_put_namespaced_pod_proxy_with_path()`](#method-CoreV1Api-connect_put_namespaced_pod_proxy_with_path)

- [`CoreV1Api$connect_patch_namespaced_pod_proxy_with_path()`](#method-CoreV1Api-connect_patch_namespaced_pod_proxy_with_path)

- [`CoreV1Api$connect_delete_namespaced_pod_proxy_with_path()`](#method-CoreV1Api-connect_delete_namespaced_pod_proxy_with_path)

- [`CoreV1Api$connect_options_namespaced_pod_proxy_with_path()`](#method-CoreV1Api-connect_options_namespaced_pod_proxy_with_path)

- [`CoreV1Api$connect_head_namespaced_pod_proxy_with_path()`](#method-CoreV1Api-connect_head_namespaced_pod_proxy_with_path)

- [`CoreV1Api$read_namespaced_pod_status()`](#method-CoreV1Api-read_namespaced_pod_status)

- [`CoreV1Api$replace_namespaced_pod_status()`](#method-CoreV1Api-replace_namespaced_pod_status)

- [`CoreV1Api$patch_namespaced_pod_status()`](#method-CoreV1Api-patch_namespaced_pod_status)

- [`CoreV1Api$list_namespaced_pod_template()`](#method-CoreV1Api-list_namespaced_pod_template)

- [`CoreV1Api$create_namespaced_pod_template()`](#method-CoreV1Api-create_namespaced_pod_template)

- [`CoreV1Api$delete_collection_namespaced_pod_template()`](#method-CoreV1Api-delete_collection_namespaced_pod_template)

- [`CoreV1Api$read_namespaced_pod_template()`](#method-CoreV1Api-read_namespaced_pod_template)

- [`CoreV1Api$replace_namespaced_pod_template()`](#method-CoreV1Api-replace_namespaced_pod_template)

- [`CoreV1Api$patch_namespaced_pod_template()`](#method-CoreV1Api-patch_namespaced_pod_template)

- [`CoreV1Api$delete_namespaced_pod_template()`](#method-CoreV1Api-delete_namespaced_pod_template)

- [`CoreV1Api$list_namespaced_replication_controller()`](#method-CoreV1Api-list_namespaced_replication_controller)

- [`CoreV1Api$create_namespaced_replication_controller()`](#method-CoreV1Api-create_namespaced_replication_controller)

- [`CoreV1Api$delete_collection_namespaced_replication_controller()`](#method-CoreV1Api-delete_collection_namespaced_replication_controller)

- [`CoreV1Api$read_namespaced_replication_controller()`](#method-CoreV1Api-read_namespaced_replication_controller)

- [`CoreV1Api$replace_namespaced_replication_controller()`](#method-CoreV1Api-replace_namespaced_replication_controller)

- [`CoreV1Api$patch_namespaced_replication_controller()`](#method-CoreV1Api-patch_namespaced_replication_controller)

- [`CoreV1Api$delete_namespaced_replication_controller()`](#method-CoreV1Api-delete_namespaced_replication_controller)

- [`CoreV1Api$read_namespaced_replication_controller_scale()`](#method-CoreV1Api-read_namespaced_replication_controller_scale)

- [`CoreV1Api$replace_namespaced_replication_controller_scale()`](#method-CoreV1Api-replace_namespaced_replication_controller_scale)

- [`CoreV1Api$patch_namespaced_replication_controller_scale()`](#method-CoreV1Api-patch_namespaced_replication_controller_scale)

- [`CoreV1Api$read_namespaced_replication_controller_status()`](#method-CoreV1Api-read_namespaced_replication_controller_status)

- [`CoreV1Api$replace_namespaced_replication_controller_status()`](#method-CoreV1Api-replace_namespaced_replication_controller_status)

- [`CoreV1Api$patch_namespaced_replication_controller_status()`](#method-CoreV1Api-patch_namespaced_replication_controller_status)

- [`CoreV1Api$list_namespaced_resource_quota()`](#method-CoreV1Api-list_namespaced_resource_quota)

- [`CoreV1Api$create_namespaced_resource_quota()`](#method-CoreV1Api-create_namespaced_resource_quota)

- [`CoreV1Api$delete_collection_namespaced_resource_quota()`](#method-CoreV1Api-delete_collection_namespaced_resource_quota)

- [`CoreV1Api$read_namespaced_resource_quota()`](#method-CoreV1Api-read_namespaced_resource_quota)

- [`CoreV1Api$replace_namespaced_resource_quota()`](#method-CoreV1Api-replace_namespaced_resource_quota)

- [`CoreV1Api$patch_namespaced_resource_quota()`](#method-CoreV1Api-patch_namespaced_resource_quota)

- [`CoreV1Api$delete_namespaced_resource_quota()`](#method-CoreV1Api-delete_namespaced_resource_quota)

- [`CoreV1Api$read_namespaced_resource_quota_status()`](#method-CoreV1Api-read_namespaced_resource_quota_status)

- [`CoreV1Api$replace_namespaced_resource_quota_status()`](#method-CoreV1Api-replace_namespaced_resource_quota_status)

- [`CoreV1Api$patch_namespaced_resource_quota_status()`](#method-CoreV1Api-patch_namespaced_resource_quota_status)

- [`CoreV1Api$list_namespaced_secret()`](#method-CoreV1Api-list_namespaced_secret)

- [`CoreV1Api$create_namespaced_secret()`](#method-CoreV1Api-create_namespaced_secret)

- [`CoreV1Api$delete_collection_namespaced_secret()`](#method-CoreV1Api-delete_collection_namespaced_secret)

- [`CoreV1Api$read_namespaced_secret()`](#method-CoreV1Api-read_namespaced_secret)

- [`CoreV1Api$replace_namespaced_secret()`](#method-CoreV1Api-replace_namespaced_secret)

- [`CoreV1Api$patch_namespaced_secret()`](#method-CoreV1Api-patch_namespaced_secret)

- [`CoreV1Api$delete_namespaced_secret()`](#method-CoreV1Api-delete_namespaced_secret)

- [`CoreV1Api$list_namespaced_service_account()`](#method-CoreV1Api-list_namespaced_service_account)

- [`CoreV1Api$create_namespaced_service_account()`](#method-CoreV1Api-create_namespaced_service_account)

- [`CoreV1Api$delete_collection_namespaced_service_account()`](#method-CoreV1Api-delete_collection_namespaced_service_account)

- [`CoreV1Api$read_namespaced_service_account()`](#method-CoreV1Api-read_namespaced_service_account)

- [`CoreV1Api$replace_namespaced_service_account()`](#method-CoreV1Api-replace_namespaced_service_account)

- [`CoreV1Api$patch_namespaced_service_account()`](#method-CoreV1Api-patch_namespaced_service_account)

- [`CoreV1Api$delete_namespaced_service_account()`](#method-CoreV1Api-delete_namespaced_service_account)

- [`CoreV1Api$create_namespaced_service_account_token()`](#method-CoreV1Api-create_namespaced_service_account_token)

- [`CoreV1Api$list_namespaced_service()`](#method-CoreV1Api-list_namespaced_service)

- [`CoreV1Api$create_namespaced_service()`](#method-CoreV1Api-create_namespaced_service)

- [`CoreV1Api$delete_collection_namespaced_service()`](#method-CoreV1Api-delete_collection_namespaced_service)

- [`CoreV1Api$read_namespaced_service()`](#method-CoreV1Api-read_namespaced_service)

- [`CoreV1Api$replace_namespaced_service()`](#method-CoreV1Api-replace_namespaced_service)

- [`CoreV1Api$patch_namespaced_service()`](#method-CoreV1Api-patch_namespaced_service)

- [`CoreV1Api$delete_namespaced_service()`](#method-CoreV1Api-delete_namespaced_service)

- [`CoreV1Api$connect_get_namespaced_service_proxy()`](#method-CoreV1Api-connect_get_namespaced_service_proxy)

- [`CoreV1Api$connect_post_namespaced_service_proxy()`](#method-CoreV1Api-connect_post_namespaced_service_proxy)

- [`CoreV1Api$connect_put_namespaced_service_proxy()`](#method-CoreV1Api-connect_put_namespaced_service_proxy)

- [`CoreV1Api$connect_patch_namespaced_service_proxy()`](#method-CoreV1Api-connect_patch_namespaced_service_proxy)

- [`CoreV1Api$connect_delete_namespaced_service_proxy()`](#method-CoreV1Api-connect_delete_namespaced_service_proxy)

- [`CoreV1Api$connect_options_namespaced_service_proxy()`](#method-CoreV1Api-connect_options_namespaced_service_proxy)

- [`CoreV1Api$connect_head_namespaced_service_proxy()`](#method-CoreV1Api-connect_head_namespaced_service_proxy)

- [`CoreV1Api$connect_get_namespaced_service_proxy_with_path()`](#method-CoreV1Api-connect_get_namespaced_service_proxy_with_path)

- [`CoreV1Api$connect_post_namespaced_service_proxy_with_path()`](#method-CoreV1Api-connect_post_namespaced_service_proxy_with_path)

- [`CoreV1Api$connect_put_namespaced_service_proxy_with_path()`](#method-CoreV1Api-connect_put_namespaced_service_proxy_with_path)

- [`CoreV1Api$connect_patch_namespaced_service_proxy_with_path()`](#method-CoreV1Api-connect_patch_namespaced_service_proxy_with_path)

- [`CoreV1Api$connect_delete_namespaced_service_proxy_with_path()`](#method-CoreV1Api-connect_delete_namespaced_service_proxy_with_path)

- [`CoreV1Api$connect_options_namespaced_service_proxy_with_path()`](#method-CoreV1Api-connect_options_namespaced_service_proxy_with_path)

- [`CoreV1Api$connect_head_namespaced_service_proxy_with_path()`](#method-CoreV1Api-connect_head_namespaced_service_proxy_with_path)

- [`CoreV1Api$read_namespaced_service_status()`](#method-CoreV1Api-read_namespaced_service_status)

- [`CoreV1Api$replace_namespaced_service_status()`](#method-CoreV1Api-replace_namespaced_service_status)

- [`CoreV1Api$patch_namespaced_service_status()`](#method-CoreV1Api-patch_namespaced_service_status)

- [`CoreV1Api$read_namespace()`](#method-CoreV1Api-read_namespace)

- [`CoreV1Api$replace_namespace()`](#method-CoreV1Api-replace_namespace)

- [`CoreV1Api$patch_namespace()`](#method-CoreV1Api-patch_namespace)

- [`CoreV1Api$delete_namespace()`](#method-CoreV1Api-delete_namespace)

- [`CoreV1Api$replace_namespace_finalize()`](#method-CoreV1Api-replace_namespace_finalize)

- [`CoreV1Api$read_namespace_status()`](#method-CoreV1Api-read_namespace_status)

- [`CoreV1Api$replace_namespace_status()`](#method-CoreV1Api-replace_namespace_status)

- [`CoreV1Api$patch_namespace_status()`](#method-CoreV1Api-patch_namespace_status)

- [`CoreV1Api$list_node()`](#method-CoreV1Api-list_node)

- [`CoreV1Api$create_node()`](#method-CoreV1Api-create_node)

- [`CoreV1Api$delete_collection_node()`](#method-CoreV1Api-delete_collection_node)

- [`CoreV1Api$read_node()`](#method-CoreV1Api-read_node)

- [`CoreV1Api$replace_node()`](#method-CoreV1Api-replace_node)

- [`CoreV1Api$patch_node()`](#method-CoreV1Api-patch_node)

- [`CoreV1Api$delete_node()`](#method-CoreV1Api-delete_node)

- [`CoreV1Api$connect_get_node_proxy()`](#method-CoreV1Api-connect_get_node_proxy)

- [`CoreV1Api$connect_post_node_proxy()`](#method-CoreV1Api-connect_post_node_proxy)

- [`CoreV1Api$connect_put_node_proxy()`](#method-CoreV1Api-connect_put_node_proxy)

- [`CoreV1Api$connect_patch_node_proxy()`](#method-CoreV1Api-connect_patch_node_proxy)

- [`CoreV1Api$connect_delete_node_proxy()`](#method-CoreV1Api-connect_delete_node_proxy)

- [`CoreV1Api$connect_options_node_proxy()`](#method-CoreV1Api-connect_options_node_proxy)

- [`CoreV1Api$connect_head_node_proxy()`](#method-CoreV1Api-connect_head_node_proxy)

- [`CoreV1Api$connect_get_node_proxy_with_path()`](#method-CoreV1Api-connect_get_node_proxy_with_path)

- [`CoreV1Api$connect_post_node_proxy_with_path()`](#method-CoreV1Api-connect_post_node_proxy_with_path)

- [`CoreV1Api$connect_put_node_proxy_with_path()`](#method-CoreV1Api-connect_put_node_proxy_with_path)

- [`CoreV1Api$connect_patch_node_proxy_with_path()`](#method-CoreV1Api-connect_patch_node_proxy_with_path)

- [`CoreV1Api$connect_delete_node_proxy_with_path()`](#method-CoreV1Api-connect_delete_node_proxy_with_path)

- [`CoreV1Api$connect_options_node_proxy_with_path()`](#method-CoreV1Api-connect_options_node_proxy_with_path)

- [`CoreV1Api$connect_head_node_proxy_with_path()`](#method-CoreV1Api-connect_head_node_proxy_with_path)

- [`CoreV1Api$read_node_status()`](#method-CoreV1Api-read_node_status)

- [`CoreV1Api$replace_node_status()`](#method-CoreV1Api-replace_node_status)

- [`CoreV1Api$patch_node_status()`](#method-CoreV1Api-patch_node_status)

- [`CoreV1Api$list_persistent_volume_claim_for_all_namespaces()`](#method-CoreV1Api-list_persistent_volume_claim_for_all_namespaces)

- [`CoreV1Api$list_persistent_volume()`](#method-CoreV1Api-list_persistent_volume)

- [`CoreV1Api$create_persistent_volume()`](#method-CoreV1Api-create_persistent_volume)

- [`CoreV1Api$delete_collection_persistent_volume()`](#method-CoreV1Api-delete_collection_persistent_volume)

- [`CoreV1Api$read_persistent_volume()`](#method-CoreV1Api-read_persistent_volume)

- [`CoreV1Api$replace_persistent_volume()`](#method-CoreV1Api-replace_persistent_volume)

- [`CoreV1Api$patch_persistent_volume()`](#method-CoreV1Api-patch_persistent_volume)

- [`CoreV1Api$delete_persistent_volume()`](#method-CoreV1Api-delete_persistent_volume)

- [`CoreV1Api$read_persistent_volume_status()`](#method-CoreV1Api-read_persistent_volume_status)

- [`CoreV1Api$replace_persistent_volume_status()`](#method-CoreV1Api-replace_persistent_volume_status)

- [`CoreV1Api$patch_persistent_volume_status()`](#method-CoreV1Api-patch_persistent_volume_status)

- [`CoreV1Api$list_pod_for_all_namespaces()`](#method-CoreV1Api-list_pod_for_all_namespaces)

- [`CoreV1Api$list_pod_template_for_all_namespaces()`](#method-CoreV1Api-list_pod_template_for_all_namespaces)

- [`CoreV1Api$list_replication_controller_for_all_namespaces()`](#method-CoreV1Api-list_replication_controller_for_all_namespaces)

- [`CoreV1Api$list_resource_quota_for_all_namespaces()`](#method-CoreV1Api-list_resource_quota_for_all_namespaces)

- [`CoreV1Api$list_secret_for_all_namespaces()`](#method-CoreV1Api-list_secret_for_all_namespaces)

- [`CoreV1Api$list_service_account_for_all_namespaces()`](#method-CoreV1Api-list_service_account_for_all_namespaces)

- [`CoreV1Api$list_service_for_all_namespaces()`](#method-CoreV1Api-list_service_for_all_namespaces)

- [`CoreV1Api$watch_config_map_list_for_all_namespaces()`](#method-CoreV1Api-watch_config_map_list_for_all_namespaces)

- [`CoreV1Api$watch_endpoints_list_for_all_namespaces()`](#method-CoreV1Api-watch_endpoints_list_for_all_namespaces)

- [`CoreV1Api$watch_event_list_for_all_namespaces()`](#method-CoreV1Api-watch_event_list_for_all_namespaces)

- [`CoreV1Api$watch_limit_range_list_for_all_namespaces()`](#method-CoreV1Api-watch_limit_range_list_for_all_namespaces)

- [`CoreV1Api$watch_namespace_list()`](#method-CoreV1Api-watch_namespace_list)

- [`CoreV1Api$watch_namespaced_config_map_list()`](#method-CoreV1Api-watch_namespaced_config_map_list)

- [`CoreV1Api$watch_namespaced_config_map()`](#method-CoreV1Api-watch_namespaced_config_map)

- [`CoreV1Api$watch_namespaced_endpoints_list()`](#method-CoreV1Api-watch_namespaced_endpoints_list)

- [`CoreV1Api$watch_namespaced_endpoints()`](#method-CoreV1Api-watch_namespaced_endpoints)

- [`CoreV1Api$watch_namespaced_event_list()`](#method-CoreV1Api-watch_namespaced_event_list)

- [`CoreV1Api$watch_namespaced_event()`](#method-CoreV1Api-watch_namespaced_event)

- [`CoreV1Api$watch_namespaced_limit_range_list()`](#method-CoreV1Api-watch_namespaced_limit_range_list)

- [`CoreV1Api$watch_namespaced_limit_range()`](#method-CoreV1Api-watch_namespaced_limit_range)

- [`CoreV1Api$watch_namespaced_persistent_volume_claim_list()`](#method-CoreV1Api-watch_namespaced_persistent_volume_claim_list)

- [`CoreV1Api$watch_namespaced_persistent_volume_claim()`](#method-CoreV1Api-watch_namespaced_persistent_volume_claim)

- [`CoreV1Api$watch_namespaced_pod_list()`](#method-CoreV1Api-watch_namespaced_pod_list)

- [`CoreV1Api$watch_namespaced_pod()`](#method-CoreV1Api-watch_namespaced_pod)

- [`CoreV1Api$watch_namespaced_pod_template_list()`](#method-CoreV1Api-watch_namespaced_pod_template_list)

- [`CoreV1Api$watch_namespaced_pod_template()`](#method-CoreV1Api-watch_namespaced_pod_template)

- [`CoreV1Api$watch_namespaced_replication_controller_list()`](#method-CoreV1Api-watch_namespaced_replication_controller_list)

- [`CoreV1Api$watch_namespaced_replication_controller()`](#method-CoreV1Api-watch_namespaced_replication_controller)

- [`CoreV1Api$watch_namespaced_resource_quota_list()`](#method-CoreV1Api-watch_namespaced_resource_quota_list)

- [`CoreV1Api$watch_namespaced_resource_quota()`](#method-CoreV1Api-watch_namespaced_resource_quota)

- [`CoreV1Api$watch_namespaced_secret_list()`](#method-CoreV1Api-watch_namespaced_secret_list)

- [`CoreV1Api$watch_namespaced_secret()`](#method-CoreV1Api-watch_namespaced_secret)

- [`CoreV1Api$watch_namespaced_service_account_list()`](#method-CoreV1Api-watch_namespaced_service_account_list)

- [`CoreV1Api$watch_namespaced_service_account()`](#method-CoreV1Api-watch_namespaced_service_account)

- [`CoreV1Api$watch_namespaced_service_list()`](#method-CoreV1Api-watch_namespaced_service_list)

- [`CoreV1Api$watch_namespaced_service()`](#method-CoreV1Api-watch_namespaced_service)

- [`CoreV1Api$watch_namespace()`](#method-CoreV1Api-watch_namespace)

- [`CoreV1Api$watch_node_list()`](#method-CoreV1Api-watch_node_list)

- [`CoreV1Api$watch_node()`](#method-CoreV1Api-watch_node)

- [`CoreV1Api$watch_persistent_volume_claim_list_for_all_namespaces()`](#method-CoreV1Api-watch_persistent_volume_claim_list_for_all_namespaces)

- [`CoreV1Api$watch_persistent_volume_list()`](#method-CoreV1Api-watch_persistent_volume_list)

- [`CoreV1Api$watch_persistent_volume()`](#method-CoreV1Api-watch_persistent_volume)

- [`CoreV1Api$watch_pod_list_for_all_namespaces()`](#method-CoreV1Api-watch_pod_list_for_all_namespaces)

- [`CoreV1Api$watch_pod_template_list_for_all_namespaces()`](#method-CoreV1Api-watch_pod_template_list_for_all_namespaces)

- [`CoreV1Api$watch_replication_controller_list_for_all_namespaces()`](#method-CoreV1Api-watch_replication_controller_list_for_all_namespaces)

- [`CoreV1Api$watch_resource_quota_list_for_all_namespaces()`](#method-CoreV1Api-watch_resource_quota_list_for_all_namespaces)

- [`CoreV1Api$watch_secret_list_for_all_namespaces()`](#method-CoreV1Api-watch_secret_list_for_all_namespaces)

- [`CoreV1Api$watch_service_account_list_for_all_namespaces()`](#method-CoreV1Api-watch_service_account_list_for_all_namespaces)

- [`CoreV1Api$watch_service_list_for_all_namespaces()`](#method-CoreV1Api-watch_service_list_for_all_namespaces)

- [`CoreV1Api$clone()`](#method-CoreV1Api-clone)

------------------------------------------------------------------------

### Method `new()`

#### Usage

    CoreV1Api$new(api_client = ApiClient$new())

#### Arguments

- `api_client`:

  An \[ApiClient\]. getCoreV1APIResources get available resources
  listCoreV1ComponentStatus list objects of kind ComponentStatus

------------------------------------------------------------------------

### Method `get_api_resources()`

#### Usage

    CoreV1Api$get_api_resources()

------------------------------------------------------------------------

### Method `list_component_status()`

#### Usage

    CoreV1Api$list_component_status(
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

  = NULL readCoreV1ComponentStatus read the specified ComponentStatus

------------------------------------------------------------------------

### Method `read_component_status()`

#### Usage

    CoreV1Api$read_component_status(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL listCoreV1ConfigMapForAllNamespaces list or watch objects of
  kind ConfigMap

------------------------------------------------------------------------

### Method `list_config_map_for_all_namespaces()`

#### Usage

    CoreV1Api$list_config_map_for_all_namespaces(
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

  = NULL listCoreV1EndpointsForAllNamespaces list or watch objects of
  kind Endpoints

------------------------------------------------------------------------

### Method `list_endpoints_for_all_namespaces()`

#### Usage

    CoreV1Api$list_endpoints_for_all_namespaces(
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

  = NULL listCoreV1EventForAllNamespaces list or watch objects of kind
  Event

------------------------------------------------------------------------

### Method `list_event_for_all_namespaces()`

#### Usage

    CoreV1Api$list_event_for_all_namespaces(
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

  = NULL listCoreV1LimitRangeForAllNamespaces list or watch objects of
  kind LimitRange

------------------------------------------------------------------------

### Method `list_limit_range_for_all_namespaces()`

#### Usage

    CoreV1Api$list_limit_range_for_all_namespaces(
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

  = NULL listCoreV1Namespace list or watch objects of kind Namespace

------------------------------------------------------------------------

### Method `list_namespace()`

#### Usage

    CoreV1Api$list_namespace(
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

  = NULL createCoreV1Namespace create a Namespace

------------------------------------------------------------------------

### Method `create_namespace()`

#### Usage

    CoreV1Api$create_namespace(
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

  = NULL createCoreV1NamespacedBinding create a Binding

------------------------------------------------------------------------

### Method `create_namespaced_binding()`

#### Usage

    CoreV1Api$create_namespaced_binding(
      namespace,
      body,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL,
      pretty = NULL
    )

#### Arguments

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL

- `pretty`:

  = NULL listCoreV1NamespacedConfigMap list or watch objects of kind
  ConfigMap

------------------------------------------------------------------------

### Method `list_namespaced_config_map()`

#### Usage

    CoreV1Api$list_namespaced_config_map(
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

  = NULL createCoreV1NamespacedConfigMap create a ConfigMap

------------------------------------------------------------------------

### Method `create_namespaced_config_map()`

#### Usage

    CoreV1Api$create_namespaced_config_map(
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

  = NULL deleteCoreV1CollectionNamespacedConfigMap delete collection of
  ConfigMap

------------------------------------------------------------------------

### Method `delete_collection_namespaced_config_map()`

#### Usage

    CoreV1Api$delete_collection_namespaced_config_map(
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

  = NULL readCoreV1NamespacedConfigMap read the specified ConfigMap

------------------------------------------------------------------------

### Method `read_namespaced_config_map()`

#### Usage

    CoreV1Api$read_namespaced_config_map(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedConfigMap replace the specified
  ConfigMap

------------------------------------------------------------------------

### Method `replace_namespaced_config_map()`

#### Usage

    CoreV1Api$replace_namespaced_config_map(
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

  = NULL patchCoreV1NamespacedConfigMap partially update the specified
  ConfigMap

------------------------------------------------------------------------

### Method `patch_namespaced_config_map()`

#### Usage

    CoreV1Api$patch_namespaced_config_map(
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

  = "application/json-patch+json" deleteCoreV1NamespacedConfigMap delete
  a ConfigMap

------------------------------------------------------------------------

### Method `delete_namespaced_config_map()`

#### Usage

    CoreV1Api$delete_namespaced_config_map(
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

  = NULL listCoreV1NamespacedEndpoints list or watch objects of kind
  Endpoints

------------------------------------------------------------------------

### Method `list_namespaced_endpoints()`

#### Usage

    CoreV1Api$list_namespaced_endpoints(
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

  = NULL createCoreV1NamespacedEndpoints create Endpoints

------------------------------------------------------------------------

### Method `create_namespaced_endpoints()`

#### Usage

    CoreV1Api$create_namespaced_endpoints(
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

  = NULL deleteCoreV1CollectionNamespacedEndpoints delete collection of
  Endpoints

------------------------------------------------------------------------

### Method `delete_collection_namespaced_endpoints()`

#### Usage

    CoreV1Api$delete_collection_namespaced_endpoints(
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

  = NULL readCoreV1NamespacedEndpoints read the specified Endpoints

------------------------------------------------------------------------

### Method `read_namespaced_endpoints()`

#### Usage

    CoreV1Api$read_namespaced_endpoints(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedEndpoints replace the specified
  Endpoints

------------------------------------------------------------------------

### Method `replace_namespaced_endpoints()`

#### Usage

    CoreV1Api$replace_namespaced_endpoints(
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

  = NULL patchCoreV1NamespacedEndpoints partially update the specified
  Endpoints

------------------------------------------------------------------------

### Method `patch_namespaced_endpoints()`

#### Usage

    CoreV1Api$patch_namespaced_endpoints(
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

  = "application/json-patch+json" deleteCoreV1NamespacedEndpoints delete
  Endpoints

------------------------------------------------------------------------

### Method `delete_namespaced_endpoints()`

#### Usage

    CoreV1Api$delete_namespaced_endpoints(
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

  = NULL listCoreV1NamespacedEvent list or watch objects of kind Event

------------------------------------------------------------------------

### Method `list_namespaced_event()`

#### Usage

    CoreV1Api$list_namespaced_event(
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

  = NULL createCoreV1NamespacedEvent create an Event

------------------------------------------------------------------------

### Method `create_namespaced_event()`

#### Usage

    CoreV1Api$create_namespaced_event(
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

  = NULL deleteCoreV1CollectionNamespacedEvent delete collection of
  Event

------------------------------------------------------------------------

### Method `delete_collection_namespaced_event()`

#### Usage

    CoreV1Api$delete_collection_namespaced_event(
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

  = NULL readCoreV1NamespacedEvent read the specified Event

------------------------------------------------------------------------

### Method `read_namespaced_event()`

#### Usage

    CoreV1Api$read_namespaced_event(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedEvent replace the specified Event

------------------------------------------------------------------------

### Method `replace_namespaced_event()`

#### Usage

    CoreV1Api$replace_namespaced_event(
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

  = NULL patchCoreV1NamespacedEvent partially update the specified Event

------------------------------------------------------------------------

### Method `patch_namespaced_event()`

#### Usage

    CoreV1Api$patch_namespaced_event(
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

  = "application/json-patch+json" deleteCoreV1NamespacedEvent delete an
  Event

------------------------------------------------------------------------

### Method `delete_namespaced_event()`

#### Usage

    CoreV1Api$delete_namespaced_event(
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

  = NULL listCoreV1NamespacedLimitRange list or watch objects of kind
  LimitRange

------------------------------------------------------------------------

### Method `list_namespaced_limit_range()`

#### Usage

    CoreV1Api$list_namespaced_limit_range(
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

  = NULL createCoreV1NamespacedLimitRange create a LimitRange

------------------------------------------------------------------------

### Method `create_namespaced_limit_range()`

#### Usage

    CoreV1Api$create_namespaced_limit_range(
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

  = NULL deleteCoreV1CollectionNamespacedLimitRange delete collection of
  LimitRange

------------------------------------------------------------------------

### Method `delete_collection_namespaced_limit_range()`

#### Usage

    CoreV1Api$delete_collection_namespaced_limit_range(
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

  = NULL readCoreV1NamespacedLimitRange read the specified LimitRange

------------------------------------------------------------------------

### Method `read_namespaced_limit_range()`

#### Usage

    CoreV1Api$read_namespaced_limit_range(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedLimitRange replace the specified
  LimitRange

------------------------------------------------------------------------

### Method `replace_namespaced_limit_range()`

#### Usage

    CoreV1Api$replace_namespaced_limit_range(
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

  = NULL patchCoreV1NamespacedLimitRange partially update the specified
  LimitRange

------------------------------------------------------------------------

### Method `patch_namespaced_limit_range()`

#### Usage

    CoreV1Api$patch_namespaced_limit_range(
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

  = "application/json-patch+json" deleteCoreV1NamespacedLimitRange
  delete a LimitRange

------------------------------------------------------------------------

### Method `delete_namespaced_limit_range()`

#### Usage

    CoreV1Api$delete_namespaced_limit_range(
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

  = NULL listCoreV1NamespacedPersistentVolumeClaim list or watch objects
  of kind PersistentVolumeClaim

------------------------------------------------------------------------

### Method `list_namespaced_persistent_volume_claim()`

#### Usage

    CoreV1Api$list_namespaced_persistent_volume_claim(
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

  = NULL createCoreV1NamespacedPersistentVolumeClaim create a
  PersistentVolumeClaim

------------------------------------------------------------------------

### Method `create_namespaced_persistent_volume_claim()`

#### Usage

    CoreV1Api$create_namespaced_persistent_volume_claim(
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

  = NULL deleteCoreV1CollectionNamespacedPersistentVolumeClaim delete
  collection of PersistentVolumeClaim

------------------------------------------------------------------------

### Method `delete_collection_namespaced_persistent_volume_claim()`

#### Usage

    CoreV1Api$delete_collection_namespaced_persistent_volume_claim(
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

  = NULL readCoreV1NamespacedPersistentVolumeClaim read the specified
  PersistentVolumeClaim

------------------------------------------------------------------------

### Method `read_namespaced_persistent_volume_claim()`

#### Usage

    CoreV1Api$read_namespaced_persistent_volume_claim(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedPersistentVolumeClaim replace the
  specified PersistentVolumeClaim

------------------------------------------------------------------------

### Method `replace_namespaced_persistent_volume_claim()`

#### Usage

    CoreV1Api$replace_namespaced_persistent_volume_claim(
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

  = NULL patchCoreV1NamespacedPersistentVolumeClaim partially update the
  specified PersistentVolumeClaim

------------------------------------------------------------------------

### Method `patch_namespaced_persistent_volume_claim()`

#### Usage

    CoreV1Api$patch_namespaced_persistent_volume_claim(
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
  deleteCoreV1NamespacedPersistentVolumeClaim delete a
  PersistentVolumeClaim

------------------------------------------------------------------------

### Method `delete_namespaced_persistent_volume_claim()`

#### Usage

    CoreV1Api$delete_namespaced_persistent_volume_claim(
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

  = NULL readCoreV1NamespacedPersistentVolumeClaimStatus read status of
  the specified PersistentVolumeClaim

------------------------------------------------------------------------

### Method `read_namespaced_persistent_volume_claim_status()`

#### Usage

    CoreV1Api$read_namespaced_persistent_volume_claim_status(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedPersistentVolumeClaimStatus replace
  status of the specified PersistentVolumeClaim

------------------------------------------------------------------------

### Method `replace_namespaced_persistent_volume_claim_status()`

#### Usage

    CoreV1Api$replace_namespaced_persistent_volume_claim_status(
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

  = NULL patchCoreV1NamespacedPersistentVolumeClaimStatus partially
  update status of the specified PersistentVolumeClaim

------------------------------------------------------------------------

### Method `patch_namespaced_persistent_volume_claim_status()`

#### Usage

    CoreV1Api$patch_namespaced_persistent_volume_claim_status(
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

  = "application/json-patch+json" listCoreV1NamespacedPod list or watch
  objects of kind Pod

------------------------------------------------------------------------

### Method `list_namespaced_pod()`

#### Usage

    CoreV1Api$list_namespaced_pod(
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

  = NULL createCoreV1NamespacedPod create a Pod

------------------------------------------------------------------------

### Method `create_namespaced_pod()`

#### Usage

    CoreV1Api$create_namespaced_pod(
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

  = NULL deleteCoreV1CollectionNamespacedPod delete collection of Pod

------------------------------------------------------------------------

### Method `delete_collection_namespaced_pod()`

#### Usage

    CoreV1Api$delete_collection_namespaced_pod(
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

  = NULL readCoreV1NamespacedPod read the specified Pod

------------------------------------------------------------------------

### Method `read_namespaced_pod()`

#### Usage

    CoreV1Api$read_namespaced_pod(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedPod replace the specified Pod

------------------------------------------------------------------------

### Method `replace_namespaced_pod()`

#### Usage

    CoreV1Api$replace_namespaced_pod(
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

  = NULL patchCoreV1NamespacedPod partially update the specified Pod

------------------------------------------------------------------------

### Method `patch_namespaced_pod()`

#### Usage

    CoreV1Api$patch_namespaced_pod(
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

  = "application/json-patch+json" deleteCoreV1NamespacedPod delete a Pod

------------------------------------------------------------------------

### Method `delete_namespaced_pod()`

#### Usage

    CoreV1Api$delete_namespaced_pod(
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

  = NULL connectCoreV1GetNamespacedPodAttach connect GET requests to
  attach of Pod

------------------------------------------------------------------------

### Method `connect_get_namespaced_pod_attach()`

#### Usage

    CoreV1Api$connect_get_namespaced_pod_attach(
      name,
      namespace,
      container = NULL,
      stderr = NULL,
      stdin = NULL,
      stdout = NULL,
      tty = NULL
    )

#### Arguments

- `container`:

  = NULL

- `stderr`:

  = NULL

- `stdin`:

  = NULL

- `stdout`:

  = NULL

- `tty`:

  = NULL connectCoreV1PostNamespacedPodAttach connect POST requests to
  attach of Pod

------------------------------------------------------------------------

### Method `connect_post_namespaced_pod_attach()`

#### Usage

    CoreV1Api$connect_post_namespaced_pod_attach(
      name,
      namespace,
      container = NULL,
      stderr = NULL,
      stdin = NULL,
      stdout = NULL,
      tty = NULL
    )

#### Arguments

- `container`:

  = NULL

- `stderr`:

  = NULL

- `stdin`:

  = NULL

- `stdout`:

  = NULL

- `tty`:

  = NULL createCoreV1NamespacedPodBinding create binding of a Pod

------------------------------------------------------------------------

### Method `create_namespaced_pod_binding()`

#### Usage

    CoreV1Api$create_namespaced_pod_binding(
      name,
      namespace,
      body,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL,
      pretty = NULL
    )

#### Arguments

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL

- `pretty`:

  = NULL readCoreV1NamespacedPodEphemeralcontainers read
  ephemeralcontainers of the specified Pod

------------------------------------------------------------------------

### Method `read_namespaced_pod_ephemeralcontainers()`

#### Usage

    CoreV1Api$read_namespaced_pod_ephemeralcontainers(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedPodEphemeralcontainers replace
  ephemeralcontainers of the specified Pod

------------------------------------------------------------------------

### Method `replace_namespaced_pod_ephemeralcontainers()`

#### Usage

    CoreV1Api$replace_namespaced_pod_ephemeralcontainers(
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

  = NULL patchCoreV1NamespacedPodEphemeralcontainers partially update
  ephemeralcontainers of the specified Pod

------------------------------------------------------------------------

### Method `patch_namespaced_pod_ephemeralcontainers()`

#### Usage

    CoreV1Api$patch_namespaced_pod_ephemeralcontainers(
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

  = "application/json-patch+json" createCoreV1NamespacedPodEviction
  create eviction of a Pod

------------------------------------------------------------------------

### Method `create_namespaced_pod_eviction()`

#### Usage

    CoreV1Api$create_namespaced_pod_eviction(
      name,
      namespace,
      body,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL,
      pretty = NULL
    )

#### Arguments

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL

- `pretty`:

  = NULL connectCoreV1GetNamespacedPodExec connect GET requests to exec
  of Pod

------------------------------------------------------------------------

### Method `connect_get_namespaced_pod_exec()`

#### Usage

    CoreV1Api$connect_get_namespaced_pod_exec(
      name,
      namespace,
      command = NULL,
      container = NULL,
      stderr = NULL,
      stdin = NULL,
      stdout = NULL,
      tty = NULL
    )

#### Arguments

- `command`:

  = NULL

- `container`:

  = NULL

- `stderr`:

  = NULL

- `stdin`:

  = NULL

- `stdout`:

  = NULL

- `tty`:

  = NULL connectCoreV1PostNamespacedPodExec connect POST requests to
  exec of Pod

------------------------------------------------------------------------

### Method `connect_post_namespaced_pod_exec()`

#### Usage

    CoreV1Api$connect_post_namespaced_pod_exec(
      name,
      namespace,
      command = NULL,
      container = NULL,
      stderr = NULL,
      stdin = NULL,
      stdout = NULL,
      tty = NULL
    )

#### Arguments

- `command`:

  = NULL

- `container`:

  = NULL

- `stderr`:

  = NULL

- `stdin`:

  = NULL

- `stdout`:

  = NULL

- `tty`:

  = NULL readCoreV1NamespacedPodLog read log of the specified Pod

------------------------------------------------------------------------

### Method `read_namespaced_pod_log()`

#### Usage

    CoreV1Api$read_namespaced_pod_log(
      name,
      namespace,
      container = NULL,
      follow = NULL,
      insecure_skip_tls_verify_backend = NULL,
      limit_bytes = NULL,
      pretty = NULL,
      previous = NULL,
      since_seconds = NULL,
      tail_lines = NULL,
      timestamps = NULL
    )

#### Arguments

- `container`:

  = NULL

- `follow`:

  = NULL

- `insecure_skip_tls_verify_backend`:

  = NULL

- `limit_bytes`:

  = NULL

- `pretty`:

  = NULL

- `previous`:

  = NULL

- `since_seconds`:

  = NULL

- `tail_lines`:

  = NULL

- `timestamps`:

  = NULL connectCoreV1GetNamespacedPodPortforward connect GET requests
  to portforward of Pod

------------------------------------------------------------------------

### Method `connect_get_namespaced_pod_portforward()`

#### Usage

    CoreV1Api$connect_get_namespaced_pod_portforward(name, namespace, ports = NULL)

#### Arguments

- `ports`:

  = NULL connectCoreV1PostNamespacedPodPortforward connect POST requests
  to portforward of Pod

------------------------------------------------------------------------

### Method `connect_post_namespaced_pod_portforward()`

#### Usage

    CoreV1Api$connect_post_namespaced_pod_portforward(
      name,
      namespace,
      ports = NULL
    )

#### Arguments

- `ports`:

  = NULL connectCoreV1GetNamespacedPodProxy connect GET requests to
  proxy of Pod

------------------------------------------------------------------------

### Method `connect_get_namespaced_pod_proxy()`

#### Usage

    CoreV1Api$connect_get_namespaced_pod_proxy(name, namespace, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1PostNamespacedPodProxy connect POST requests to
  proxy of Pod

------------------------------------------------------------------------

### Method `connect_post_namespaced_pod_proxy()`

#### Usage

    CoreV1Api$connect_post_namespaced_pod_proxy(name, namespace, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1PutNamespacedPodProxy connect PUT requests to
  proxy of Pod

------------------------------------------------------------------------

### Method `connect_put_namespaced_pod_proxy()`

#### Usage

    CoreV1Api$connect_put_namespaced_pod_proxy(name, namespace, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1PatchNamespacedPodProxy connect PATCH requests to
  proxy of Pod

------------------------------------------------------------------------

### Method `connect_patch_namespaced_pod_proxy()`

#### Usage

    CoreV1Api$connect_patch_namespaced_pod_proxy(
      name,
      namespace,
      path = NULL,
      content_type = "*/*"
    )

#### Arguments

- `path`:

  = NULL

- `content_type`:

  = "\*/\*" connectCoreV1DeleteNamespacedPodProxy connect DELETE
  requests to proxy of Pod

------------------------------------------------------------------------

### Method `connect_delete_namespaced_pod_proxy()`

#### Usage

    CoreV1Api$connect_delete_namespaced_pod_proxy(name, namespace, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1OptionsNamespacedPodProxy connect OPTIONS requests
  to proxy of Pod

------------------------------------------------------------------------

### Method `connect_options_namespaced_pod_proxy()`

#### Usage

    CoreV1Api$connect_options_namespaced_pod_proxy(name, namespace, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1HeadNamespacedPodProxy connect HEAD requests to
  proxy of Pod

------------------------------------------------------------------------

### Method `connect_head_namespaced_pod_proxy()`

#### Usage

    CoreV1Api$connect_head_namespaced_pod_proxy(name, namespace, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1GetNamespacedPodProxyWithPath connect GET requests
  to proxy of Pod

------------------------------------------------------------------------

### Method `connect_get_namespaced_pod_proxy_with_path()`

#### Usage

    CoreV1Api$connect_get_namespaced_pod_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL
    )

#### Arguments

- `path_query`:

  = NULL connectCoreV1PostNamespacedPodProxyWithPath connect POST
  requests to proxy of Pod

------------------------------------------------------------------------

### Method `connect_post_namespaced_pod_proxy_with_path()`

#### Usage

    CoreV1Api$connect_post_namespaced_pod_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL
    )

#### Arguments

- `path_query`:

  = NULL connectCoreV1PutNamespacedPodProxyWithPath connect PUT requests
  to proxy of Pod

------------------------------------------------------------------------

### Method `connect_put_namespaced_pod_proxy_with_path()`

#### Usage

    CoreV1Api$connect_put_namespaced_pod_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL
    )

#### Arguments

- `path_query`:

  = NULL connectCoreV1PatchNamespacedPodProxyWithPath connect PATCH
  requests to proxy of Pod

------------------------------------------------------------------------

### Method `connect_patch_namespaced_pod_proxy_with_path()`

#### Usage

    CoreV1Api$connect_patch_namespaced_pod_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL,
      content_type = "*/*"
    )

#### Arguments

- `path_query`:

  = NULL

- `content_type`:

  = "\*/\*" connectCoreV1DeleteNamespacedPodProxyWithPath connect DELETE
  requests to proxy of Pod

------------------------------------------------------------------------

### Method `connect_delete_namespaced_pod_proxy_with_path()`

#### Usage

    CoreV1Api$connect_delete_namespaced_pod_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL
    )

#### Arguments

- `path_query`:

  = NULL connectCoreV1OptionsNamespacedPodProxyWithPath connect OPTIONS
  requests to proxy of Pod

------------------------------------------------------------------------

### Method `connect_options_namespaced_pod_proxy_with_path()`

#### Usage

    CoreV1Api$connect_options_namespaced_pod_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL
    )

#### Arguments

- `path_query`:

  = NULL connectCoreV1HeadNamespacedPodProxyWithPath connect HEAD
  requests to proxy of Pod

------------------------------------------------------------------------

### Method `connect_head_namespaced_pod_proxy_with_path()`

#### Usage

    CoreV1Api$connect_head_namespaced_pod_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL
    )

#### Arguments

- `path_query`:

  = NULL readCoreV1NamespacedPodStatus read status of the specified Pod

------------------------------------------------------------------------

### Method `read_namespaced_pod_status()`

#### Usage

    CoreV1Api$read_namespaced_pod_status(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedPodStatus replace status of the
  specified Pod

------------------------------------------------------------------------

### Method `replace_namespaced_pod_status()`

#### Usage

    CoreV1Api$replace_namespaced_pod_status(
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

  = NULL patchCoreV1NamespacedPodStatus partially update status of the
  specified Pod

------------------------------------------------------------------------

### Method `patch_namespaced_pod_status()`

#### Usage

    CoreV1Api$patch_namespaced_pod_status(
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

  = "application/json-patch+json" listCoreV1NamespacedPodTemplate list
  or watch objects of kind PodTemplate

------------------------------------------------------------------------

### Method `list_namespaced_pod_template()`

#### Usage

    CoreV1Api$list_namespaced_pod_template(
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

  = NULL createCoreV1NamespacedPodTemplate create a PodTemplate

------------------------------------------------------------------------

### Method `create_namespaced_pod_template()`

#### Usage

    CoreV1Api$create_namespaced_pod_template(
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

  = NULL deleteCoreV1CollectionNamespacedPodTemplate delete collection
  of PodTemplate

------------------------------------------------------------------------

### Method `delete_collection_namespaced_pod_template()`

#### Usage

    CoreV1Api$delete_collection_namespaced_pod_template(
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

  = NULL readCoreV1NamespacedPodTemplate read the specified PodTemplate

------------------------------------------------------------------------

### Method `read_namespaced_pod_template()`

#### Usage

    CoreV1Api$read_namespaced_pod_template(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedPodTemplate replace the specified
  PodTemplate

------------------------------------------------------------------------

### Method `replace_namespaced_pod_template()`

#### Usage

    CoreV1Api$replace_namespaced_pod_template(
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

  = NULL patchCoreV1NamespacedPodTemplate partially update the specified
  PodTemplate

------------------------------------------------------------------------

### Method `patch_namespaced_pod_template()`

#### Usage

    CoreV1Api$patch_namespaced_pod_template(
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

  = "application/json-patch+json" deleteCoreV1NamespacedPodTemplate
  delete a PodTemplate

------------------------------------------------------------------------

### Method `delete_namespaced_pod_template()`

#### Usage

    CoreV1Api$delete_namespaced_pod_template(
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

  = NULL listCoreV1NamespacedReplicationController list or watch objects
  of kind ReplicationController

------------------------------------------------------------------------

### Method `list_namespaced_replication_controller()`

#### Usage

    CoreV1Api$list_namespaced_replication_controller(
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

  = NULL createCoreV1NamespacedReplicationController create a
  ReplicationController

------------------------------------------------------------------------

### Method `create_namespaced_replication_controller()`

#### Usage

    CoreV1Api$create_namespaced_replication_controller(
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

  = NULL deleteCoreV1CollectionNamespacedReplicationController delete
  collection of ReplicationController

------------------------------------------------------------------------

### Method `delete_collection_namespaced_replication_controller()`

#### Usage

    CoreV1Api$delete_collection_namespaced_replication_controller(
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

  = NULL readCoreV1NamespacedReplicationController read the specified
  ReplicationController

------------------------------------------------------------------------

### Method `read_namespaced_replication_controller()`

#### Usage

    CoreV1Api$read_namespaced_replication_controller(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedReplicationController replace the
  specified ReplicationController

------------------------------------------------------------------------

### Method `replace_namespaced_replication_controller()`

#### Usage

    CoreV1Api$replace_namespaced_replication_controller(
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

  = NULL patchCoreV1NamespacedReplicationController partially update the
  specified ReplicationController

------------------------------------------------------------------------

### Method `patch_namespaced_replication_controller()`

#### Usage

    CoreV1Api$patch_namespaced_replication_controller(
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
  deleteCoreV1NamespacedReplicationController delete a
  ReplicationController

------------------------------------------------------------------------

### Method `delete_namespaced_replication_controller()`

#### Usage

    CoreV1Api$delete_namespaced_replication_controller(
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

  = NULL readCoreV1NamespacedReplicationControllerScale read scale of
  the specified ReplicationController

------------------------------------------------------------------------

### Method `read_namespaced_replication_controller_scale()`

#### Usage

    CoreV1Api$read_namespaced_replication_controller_scale(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedReplicationControllerScale replace scale
  of the specified ReplicationController

------------------------------------------------------------------------

### Method `replace_namespaced_replication_controller_scale()`

#### Usage

    CoreV1Api$replace_namespaced_replication_controller_scale(
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

  = NULL patchCoreV1NamespacedReplicationControllerScale partially
  update scale of the specified ReplicationController

------------------------------------------------------------------------

### Method `patch_namespaced_replication_controller_scale()`

#### Usage

    CoreV1Api$patch_namespaced_replication_controller_scale(
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
  readCoreV1NamespacedReplicationControllerStatus read status of the
  specified ReplicationController

------------------------------------------------------------------------

### Method `read_namespaced_replication_controller_status()`

#### Usage

    CoreV1Api$read_namespaced_replication_controller_status(
      name,
      namespace,
      pretty = NULL
    )

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedReplicationControllerStatus replace
  status of the specified ReplicationController

------------------------------------------------------------------------

### Method `replace_namespaced_replication_controller_status()`

#### Usage

    CoreV1Api$replace_namespaced_replication_controller_status(
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

  = NULL patchCoreV1NamespacedReplicationControllerStatus partially
  update status of the specified ReplicationController

------------------------------------------------------------------------

### Method `patch_namespaced_replication_controller_status()`

#### Usage

    CoreV1Api$patch_namespaced_replication_controller_status(
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

  = "application/json-patch+json" listCoreV1NamespacedResourceQuota list
  or watch objects of kind ResourceQuota

------------------------------------------------------------------------

### Method `list_namespaced_resource_quota()`

#### Usage

    CoreV1Api$list_namespaced_resource_quota(
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

  = NULL createCoreV1NamespacedResourceQuota create a ResourceQuota

------------------------------------------------------------------------

### Method `create_namespaced_resource_quota()`

#### Usage

    CoreV1Api$create_namespaced_resource_quota(
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

  = NULL deleteCoreV1CollectionNamespacedResourceQuota delete collection
  of ResourceQuota

------------------------------------------------------------------------

### Method `delete_collection_namespaced_resource_quota()`

#### Usage

    CoreV1Api$delete_collection_namespaced_resource_quota(
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

  = NULL readCoreV1NamespacedResourceQuota read the specified
  ResourceQuota

------------------------------------------------------------------------

### Method `read_namespaced_resource_quota()`

#### Usage

    CoreV1Api$read_namespaced_resource_quota(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedResourceQuota replace the specified
  ResourceQuota

------------------------------------------------------------------------

### Method `replace_namespaced_resource_quota()`

#### Usage

    CoreV1Api$replace_namespaced_resource_quota(
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

  = NULL patchCoreV1NamespacedResourceQuota partially update the
  specified ResourceQuota

------------------------------------------------------------------------

### Method `patch_namespaced_resource_quota()`

#### Usage

    CoreV1Api$patch_namespaced_resource_quota(
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

  = "application/json-patch+json" deleteCoreV1NamespacedResourceQuota
  delete a ResourceQuota

------------------------------------------------------------------------

### Method `delete_namespaced_resource_quota()`

#### Usage

    CoreV1Api$delete_namespaced_resource_quota(
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

  = NULL readCoreV1NamespacedResourceQuotaStatus read status of the
  specified ResourceQuota

------------------------------------------------------------------------

### Method `read_namespaced_resource_quota_status()`

#### Usage

    CoreV1Api$read_namespaced_resource_quota_status(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedResourceQuotaStatus replace status of
  the specified ResourceQuota

------------------------------------------------------------------------

### Method `replace_namespaced_resource_quota_status()`

#### Usage

    CoreV1Api$replace_namespaced_resource_quota_status(
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

  = NULL patchCoreV1NamespacedResourceQuotaStatus partially update
  status of the specified ResourceQuota

------------------------------------------------------------------------

### Method `patch_namespaced_resource_quota_status()`

#### Usage

    CoreV1Api$patch_namespaced_resource_quota_status(
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

  = "application/json-patch+json" listCoreV1NamespacedSecret list or
  watch objects of kind Secret

------------------------------------------------------------------------

### Method `list_namespaced_secret()`

#### Usage

    CoreV1Api$list_namespaced_secret(
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

  = NULL createCoreV1NamespacedSecret create a Secret

------------------------------------------------------------------------

### Method `create_namespaced_secret()`

#### Usage

    CoreV1Api$create_namespaced_secret(
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

  = NULL deleteCoreV1CollectionNamespacedSecret delete collection of
  Secret

------------------------------------------------------------------------

### Method `delete_collection_namespaced_secret()`

#### Usage

    CoreV1Api$delete_collection_namespaced_secret(
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

  = NULL readCoreV1NamespacedSecret read the specified Secret

------------------------------------------------------------------------

### Method `read_namespaced_secret()`

#### Usage

    CoreV1Api$read_namespaced_secret(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedSecret replace the specified Secret

------------------------------------------------------------------------

### Method `replace_namespaced_secret()`

#### Usage

    CoreV1Api$replace_namespaced_secret(
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

  = NULL patchCoreV1NamespacedSecret partially update the specified
  Secret

------------------------------------------------------------------------

### Method `patch_namespaced_secret()`

#### Usage

    CoreV1Api$patch_namespaced_secret(
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

  = "application/json-patch+json" deleteCoreV1NamespacedSecret delete a
  Secret

------------------------------------------------------------------------

### Method `delete_namespaced_secret()`

#### Usage

    CoreV1Api$delete_namespaced_secret(
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

  = NULL listCoreV1NamespacedServiceAccount list or watch objects of
  kind ServiceAccount

------------------------------------------------------------------------

### Method `list_namespaced_service_account()`

#### Usage

    CoreV1Api$list_namespaced_service_account(
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

  = NULL createCoreV1NamespacedServiceAccount create a ServiceAccount

------------------------------------------------------------------------

### Method `create_namespaced_service_account()`

#### Usage

    CoreV1Api$create_namespaced_service_account(
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

  = NULL deleteCoreV1CollectionNamespacedServiceAccount delete
  collection of ServiceAccount

------------------------------------------------------------------------

### Method `delete_collection_namespaced_service_account()`

#### Usage

    CoreV1Api$delete_collection_namespaced_service_account(
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

  = NULL readCoreV1NamespacedServiceAccount read the specified
  ServiceAccount

------------------------------------------------------------------------

### Method `read_namespaced_service_account()`

#### Usage

    CoreV1Api$read_namespaced_service_account(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedServiceAccount replace the specified
  ServiceAccount

------------------------------------------------------------------------

### Method `replace_namespaced_service_account()`

#### Usage

    CoreV1Api$replace_namespaced_service_account(
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

  = NULL patchCoreV1NamespacedServiceAccount partially update the
  specified ServiceAccount

------------------------------------------------------------------------

### Method `patch_namespaced_service_account()`

#### Usage

    CoreV1Api$patch_namespaced_service_account(
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

  = "application/json-patch+json" deleteCoreV1NamespacedServiceAccount
  delete a ServiceAccount

------------------------------------------------------------------------

### Method `delete_namespaced_service_account()`

#### Usage

    CoreV1Api$delete_namespaced_service_account(
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

  = NULL createCoreV1NamespacedServiceAccountToken create token of a
  ServiceAccount

------------------------------------------------------------------------

### Method `create_namespaced_service_account_token()`

#### Usage

    CoreV1Api$create_namespaced_service_account_token(
      name,
      namespace,
      body,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL,
      pretty = NULL
    )

#### Arguments

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL

- `pretty`:

  = NULL listCoreV1NamespacedService list or watch objects of kind
  Service

------------------------------------------------------------------------

### Method `list_namespaced_service()`

#### Usage

    CoreV1Api$list_namespaced_service(
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

  = NULL createCoreV1NamespacedService create a Service

------------------------------------------------------------------------

### Method `create_namespaced_service()`

#### Usage

    CoreV1Api$create_namespaced_service(
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

  = NULL deleteCoreV1CollectionNamespacedService delete collection of
  Service

------------------------------------------------------------------------

### Method `delete_collection_namespaced_service()`

#### Usage

    CoreV1Api$delete_collection_namespaced_service(
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

  = NULL readCoreV1NamespacedService read the specified Service

------------------------------------------------------------------------

### Method `read_namespaced_service()`

#### Usage

    CoreV1Api$read_namespaced_service(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedService replace the specified Service

------------------------------------------------------------------------

### Method `replace_namespaced_service()`

#### Usage

    CoreV1Api$replace_namespaced_service(
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

  = NULL patchCoreV1NamespacedService partially update the specified
  Service

------------------------------------------------------------------------

### Method `patch_namespaced_service()`

#### Usage

    CoreV1Api$patch_namespaced_service(
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

  = "application/json-patch+json" deleteCoreV1NamespacedService delete a
  Service

------------------------------------------------------------------------

### Method `delete_namespaced_service()`

#### Usage

    CoreV1Api$delete_namespaced_service(
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

  = NULL connectCoreV1GetNamespacedServiceProxy connect GET requests to
  proxy of Service

------------------------------------------------------------------------

### Method `connect_get_namespaced_service_proxy()`

#### Usage

    CoreV1Api$connect_get_namespaced_service_proxy(name, namespace, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1PostNamespacedServiceProxy connect POST requests
  to proxy of Service

------------------------------------------------------------------------

### Method `connect_post_namespaced_service_proxy()`

#### Usage

    CoreV1Api$connect_post_namespaced_service_proxy(name, namespace, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1PutNamespacedServiceProxy connect PUT requests to
  proxy of Service

------------------------------------------------------------------------

### Method `connect_put_namespaced_service_proxy()`

#### Usage

    CoreV1Api$connect_put_namespaced_service_proxy(name, namespace, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1PatchNamespacedServiceProxy connect PATCH requests
  to proxy of Service

------------------------------------------------------------------------

### Method `connect_patch_namespaced_service_proxy()`

#### Usage

    CoreV1Api$connect_patch_namespaced_service_proxy(
      name,
      namespace,
      path = NULL,
      content_type = "*/*"
    )

#### Arguments

- `path`:

  = NULL

- `content_type`:

  = "\*/\*" connectCoreV1DeleteNamespacedServiceProxy connect DELETE
  requests to proxy of Service

------------------------------------------------------------------------

### Method `connect_delete_namespaced_service_proxy()`

#### Usage

    CoreV1Api$connect_delete_namespaced_service_proxy(name, namespace, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1OptionsNamespacedServiceProxy connect OPTIONS
  requests to proxy of Service

------------------------------------------------------------------------

### Method `connect_options_namespaced_service_proxy()`

#### Usage

    CoreV1Api$connect_options_namespaced_service_proxy(
      name,
      namespace,
      path = NULL
    )

#### Arguments

- `path`:

  = NULL connectCoreV1HeadNamespacedServiceProxy connect HEAD requests
  to proxy of Service

------------------------------------------------------------------------

### Method `connect_head_namespaced_service_proxy()`

#### Usage

    CoreV1Api$connect_head_namespaced_service_proxy(name, namespace, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1GetNamespacedServiceProxyWithPath connect GET
  requests to proxy of Service

------------------------------------------------------------------------

### Method `connect_get_namespaced_service_proxy_with_path()`

#### Usage

    CoreV1Api$connect_get_namespaced_service_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL
    )

#### Arguments

- `path_query`:

  = NULL connectCoreV1PostNamespacedServiceProxyWithPath connect POST
  requests to proxy of Service

------------------------------------------------------------------------

### Method `connect_post_namespaced_service_proxy_with_path()`

#### Usage

    CoreV1Api$connect_post_namespaced_service_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL
    )

#### Arguments

- `path_query`:

  = NULL connectCoreV1PutNamespacedServiceProxyWithPath connect PUT
  requests to proxy of Service

------------------------------------------------------------------------

### Method `connect_put_namespaced_service_proxy_with_path()`

#### Usage

    CoreV1Api$connect_put_namespaced_service_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL
    )

#### Arguments

- `path_query`:

  = NULL connectCoreV1PatchNamespacedServiceProxyWithPath connect PATCH
  requests to proxy of Service

------------------------------------------------------------------------

### Method `connect_patch_namespaced_service_proxy_with_path()`

#### Usage

    CoreV1Api$connect_patch_namespaced_service_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL,
      content_type = "*/*"
    )

#### Arguments

- `path_query`:

  = NULL

- `content_type`:

  = "\*/\*" connectCoreV1DeleteNamespacedServiceProxyWithPath connect
  DELETE requests to proxy of Service

------------------------------------------------------------------------

### Method `connect_delete_namespaced_service_proxy_with_path()`

#### Usage

    CoreV1Api$connect_delete_namespaced_service_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL
    )

#### Arguments

- `path_query`:

  = NULL connectCoreV1OptionsNamespacedServiceProxyWithPath connect
  OPTIONS requests to proxy of Service

------------------------------------------------------------------------

### Method `connect_options_namespaced_service_proxy_with_path()`

#### Usage

    CoreV1Api$connect_options_namespaced_service_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL
    )

#### Arguments

- `path_query`:

  = NULL connectCoreV1HeadNamespacedServiceProxyWithPath connect HEAD
  requests to proxy of Service

------------------------------------------------------------------------

### Method `connect_head_namespaced_service_proxy_with_path()`

#### Usage

    CoreV1Api$connect_head_namespaced_service_proxy_with_path(
      name,
      namespace,
      path,
      path_query = NULL
    )

#### Arguments

- `path_query`:

  = NULL readCoreV1NamespacedServiceStatus read status of the specified
  Service

------------------------------------------------------------------------

### Method `read_namespaced_service_status()`

#### Usage

    CoreV1Api$read_namespaced_service_status(name, namespace, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespacedServiceStatus replace status of the
  specified Service

------------------------------------------------------------------------

### Method `replace_namespaced_service_status()`

#### Usage

    CoreV1Api$replace_namespaced_service_status(
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

  = NULL patchCoreV1NamespacedServiceStatus partially update status of
  the specified Service

------------------------------------------------------------------------

### Method `patch_namespaced_service_status()`

#### Usage

    CoreV1Api$patch_namespaced_service_status(
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

  = "application/json-patch+json" readCoreV1Namespace read the specified
  Namespace

------------------------------------------------------------------------

### Method `read_namespace()`

#### Usage

    CoreV1Api$read_namespace(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1Namespace replace the specified Namespace

------------------------------------------------------------------------

### Method `replace_namespace()`

#### Usage

    CoreV1Api$replace_namespace(
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

  = NULL patchCoreV1Namespace partially update the specified Namespace

------------------------------------------------------------------------

### Method `patch_namespace()`

#### Usage

    CoreV1Api$patch_namespace(
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

  = "application/json-patch+json" deleteCoreV1Namespace delete a
  Namespace

------------------------------------------------------------------------

### Method `delete_namespace()`

#### Usage

    CoreV1Api$delete_namespace(
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

  = NULL replaceCoreV1NamespaceFinalize replace finalize of the
  specified Namespace

------------------------------------------------------------------------

### Method `replace_namespace_finalize()`

#### Usage

    CoreV1Api$replace_namespace_finalize(
      name,
      body,
      dry_run = NULL,
      field_manager = NULL,
      field_validation = NULL,
      pretty = NULL
    )

#### Arguments

- `dry_run`:

  = NULL

- `field_manager`:

  = NULL

- `field_validation`:

  = NULL

- `pretty`:

  = NULL readCoreV1NamespaceStatus read status of the specified
  Namespace

------------------------------------------------------------------------

### Method `read_namespace_status()`

#### Usage

    CoreV1Api$read_namespace_status(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NamespaceStatus replace status of the specified
  Namespace

------------------------------------------------------------------------

### Method `replace_namespace_status()`

#### Usage

    CoreV1Api$replace_namespace_status(
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

  = NULL patchCoreV1NamespaceStatus partially update status of the
  specified Namespace

------------------------------------------------------------------------

### Method `patch_namespace_status()`

#### Usage

    CoreV1Api$patch_namespace_status(
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

  = "application/json-patch+json" listCoreV1Node list or watch objects
  of kind Node

------------------------------------------------------------------------

### Method `list_node()`

#### Usage

    CoreV1Api$list_node(
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

  = NULL createCoreV1Node create a Node

------------------------------------------------------------------------

### Method `create_node()`

#### Usage

    CoreV1Api$create_node(
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

  = NULL deleteCoreV1CollectionNode delete collection of Node

------------------------------------------------------------------------

### Method `delete_collection_node()`

#### Usage

    CoreV1Api$delete_collection_node(
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

  = NULL readCoreV1Node read the specified Node

------------------------------------------------------------------------

### Method `read_node()`

#### Usage

    CoreV1Api$read_node(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1Node replace the specified Node

------------------------------------------------------------------------

### Method `replace_node()`

#### Usage

    CoreV1Api$replace_node(
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

  = NULL patchCoreV1Node partially update the specified Node

------------------------------------------------------------------------

### Method `patch_node()`

#### Usage

    CoreV1Api$patch_node(
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

  = "application/json-patch+json" deleteCoreV1Node delete a Node

------------------------------------------------------------------------

### Method `delete_node()`

#### Usage

    CoreV1Api$delete_node(
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

  = NULL connectCoreV1GetNodeProxy connect GET requests to proxy of Node

------------------------------------------------------------------------

### Method `connect_get_node_proxy()`

#### Usage

    CoreV1Api$connect_get_node_proxy(name, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1PostNodeProxy connect POST requests to proxy of
  Node

------------------------------------------------------------------------

### Method `connect_post_node_proxy()`

#### Usage

    CoreV1Api$connect_post_node_proxy(name, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1PutNodeProxy connect PUT requests to proxy of Node

------------------------------------------------------------------------

### Method `connect_put_node_proxy()`

#### Usage

    CoreV1Api$connect_put_node_proxy(name, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1PatchNodeProxy connect PATCH requests to proxy of
  Node

------------------------------------------------------------------------

### Method `connect_patch_node_proxy()`

#### Usage

    CoreV1Api$connect_patch_node_proxy(name, path = NULL, content_type = "*/*")

#### Arguments

- `path`:

  = NULL

- `content_type`:

  = "\*/\*" connectCoreV1DeleteNodeProxy connect DELETE requests to
  proxy of Node

------------------------------------------------------------------------

### Method `connect_delete_node_proxy()`

#### Usage

    CoreV1Api$connect_delete_node_proxy(name, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1OptionsNodeProxy connect OPTIONS requests to proxy
  of Node

------------------------------------------------------------------------

### Method `connect_options_node_proxy()`

#### Usage

    CoreV1Api$connect_options_node_proxy(name, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1HeadNodeProxy connect HEAD requests to proxy of
  Node

------------------------------------------------------------------------

### Method `connect_head_node_proxy()`

#### Usage

    CoreV1Api$connect_head_node_proxy(name, path = NULL)

#### Arguments

- `path`:

  = NULL connectCoreV1GetNodeProxyWithPath connect GET requests to proxy
  of Node

------------------------------------------------------------------------

### Method `connect_get_node_proxy_with_path()`

#### Usage

    CoreV1Api$connect_get_node_proxy_with_path(name, path, path_query = NULL)

#### Arguments

- `path_query`:

  = NULL connectCoreV1PostNodeProxyWithPath connect POST requests to
  proxy of Node

------------------------------------------------------------------------

### Method `connect_post_node_proxy_with_path()`

#### Usage

    CoreV1Api$connect_post_node_proxy_with_path(name, path, path_query = NULL)

#### Arguments

- `path_query`:

  = NULL connectCoreV1PutNodeProxyWithPath connect PUT requests to proxy
  of Node

------------------------------------------------------------------------

### Method `connect_put_node_proxy_with_path()`

#### Usage

    CoreV1Api$connect_put_node_proxy_with_path(name, path, path_query = NULL)

#### Arguments

- `path_query`:

  = NULL connectCoreV1PatchNodeProxyWithPath connect PATCH requests to
  proxy of Node

------------------------------------------------------------------------

### Method `connect_patch_node_proxy_with_path()`

#### Usage

    CoreV1Api$connect_patch_node_proxy_with_path(
      name,
      path,
      path_query = NULL,
      content_type = "*/*"
    )

#### Arguments

- `path_query`:

  = NULL

- `content_type`:

  = "\*/\*" connectCoreV1DeleteNodeProxyWithPath connect DELETE requests
  to proxy of Node

------------------------------------------------------------------------

### Method `connect_delete_node_proxy_with_path()`

#### Usage

    CoreV1Api$connect_delete_node_proxy_with_path(name, path, path_query = NULL)

#### Arguments

- `path_query`:

  = NULL connectCoreV1OptionsNodeProxyWithPath connect OPTIONS requests
  to proxy of Node

------------------------------------------------------------------------

### Method `connect_options_node_proxy_with_path()`

#### Usage

    CoreV1Api$connect_options_node_proxy_with_path(name, path, path_query = NULL)

#### Arguments

- `path_query`:

  = NULL connectCoreV1HeadNodeProxyWithPath connect HEAD requests to
  proxy of Node

------------------------------------------------------------------------

### Method `connect_head_node_proxy_with_path()`

#### Usage

    CoreV1Api$connect_head_node_proxy_with_path(name, path, path_query = NULL)

#### Arguments

- `path_query`:

  = NULL readCoreV1NodeStatus read status of the specified Node

------------------------------------------------------------------------

### Method `read_node_status()`

#### Usage

    CoreV1Api$read_node_status(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1NodeStatus replace status of the specified Node

------------------------------------------------------------------------

### Method `replace_node_status()`

#### Usage

    CoreV1Api$replace_node_status(
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

  = NULL patchCoreV1NodeStatus partially update status of the specified
  Node

------------------------------------------------------------------------

### Method `patch_node_status()`

#### Usage

    CoreV1Api$patch_node_status(
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
  listCoreV1PersistentVolumeClaimForAllNamespaces list or watch objects
  of kind PersistentVolumeClaim

------------------------------------------------------------------------

### Method `list_persistent_volume_claim_for_all_namespaces()`

#### Usage

    CoreV1Api$list_persistent_volume_claim_for_all_namespaces(
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

  = NULL listCoreV1PersistentVolume list or watch objects of kind
  PersistentVolume

------------------------------------------------------------------------

### Method `list_persistent_volume()`

#### Usage

    CoreV1Api$list_persistent_volume(
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

  = NULL createCoreV1PersistentVolume create a PersistentVolume

------------------------------------------------------------------------

### Method `create_persistent_volume()`

#### Usage

    CoreV1Api$create_persistent_volume(
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

  = NULL deleteCoreV1CollectionPersistentVolume delete collection of
  PersistentVolume

------------------------------------------------------------------------

### Method `delete_collection_persistent_volume()`

#### Usage

    CoreV1Api$delete_collection_persistent_volume(
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

  = NULL readCoreV1PersistentVolume read the specified PersistentVolume

------------------------------------------------------------------------

### Method `read_persistent_volume()`

#### Usage

    CoreV1Api$read_persistent_volume(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1PersistentVolume replace the specified
  PersistentVolume

------------------------------------------------------------------------

### Method `replace_persistent_volume()`

#### Usage

    CoreV1Api$replace_persistent_volume(
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

  = NULL patchCoreV1PersistentVolume partially update the specified
  PersistentVolume

------------------------------------------------------------------------

### Method `patch_persistent_volume()`

#### Usage

    CoreV1Api$patch_persistent_volume(
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

  = "application/json-patch+json" deleteCoreV1PersistentVolume delete a
  PersistentVolume

------------------------------------------------------------------------

### Method `delete_persistent_volume()`

#### Usage

    CoreV1Api$delete_persistent_volume(
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

  = NULL readCoreV1PersistentVolumeStatus read status of the specified
  PersistentVolume

------------------------------------------------------------------------

### Method `read_persistent_volume_status()`

#### Usage

    CoreV1Api$read_persistent_volume_status(name, pretty = NULL)

#### Arguments

- `pretty`:

  = NULL replaceCoreV1PersistentVolumeStatus replace status of the
  specified PersistentVolume

------------------------------------------------------------------------

### Method `replace_persistent_volume_status()`

#### Usage

    CoreV1Api$replace_persistent_volume_status(
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

  = NULL patchCoreV1PersistentVolumeStatus partially update status of
  the specified PersistentVolume

------------------------------------------------------------------------

### Method `patch_persistent_volume_status()`

#### Usage

    CoreV1Api$patch_persistent_volume_status(
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

  = "application/json-patch+json" listCoreV1PodForAllNamespaces list or
  watch objects of kind Pod

------------------------------------------------------------------------

### Method `list_pod_for_all_namespaces()`

#### Usage

    CoreV1Api$list_pod_for_all_namespaces(
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

  = NULL listCoreV1PodTemplateForAllNamespaces list or watch objects of
  kind PodTemplate

------------------------------------------------------------------------

### Method `list_pod_template_for_all_namespaces()`

#### Usage

    CoreV1Api$list_pod_template_for_all_namespaces(
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

  = NULL listCoreV1ReplicationControllerForAllNamespaces list or watch
  objects of kind ReplicationController

------------------------------------------------------------------------

### Method `list_replication_controller_for_all_namespaces()`

#### Usage

    CoreV1Api$list_replication_controller_for_all_namespaces(
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

  = NULL listCoreV1ResourceQuotaForAllNamespaces list or watch objects
  of kind ResourceQuota

------------------------------------------------------------------------

### Method `list_resource_quota_for_all_namespaces()`

#### Usage

    CoreV1Api$list_resource_quota_for_all_namespaces(
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

  = NULL listCoreV1SecretForAllNamespaces list or watch objects of kind
  Secret

------------------------------------------------------------------------

### Method `list_secret_for_all_namespaces()`

#### Usage

    CoreV1Api$list_secret_for_all_namespaces(
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

  = NULL listCoreV1ServiceAccountForAllNamespaces list or watch objects
  of kind ServiceAccount

------------------------------------------------------------------------

### Method `list_service_account_for_all_namespaces()`

#### Usage

    CoreV1Api$list_service_account_for_all_namespaces(
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

  = NULL listCoreV1ServiceForAllNamespaces list or watch objects of kind
  Service

------------------------------------------------------------------------

### Method `list_service_for_all_namespaces()`

#### Usage

    CoreV1Api$list_service_for_all_namespaces(
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

  = NULL watchCoreV1ConfigMapListForAllNamespaces watch individual
  changes to a list of ConfigMap. deprecated: use the 'watch' parameter
  with a list operation instead.

------------------------------------------------------------------------

### Method `watch_config_map_list_for_all_namespaces()`

#### Usage

    CoreV1Api$watch_config_map_list_for_all_namespaces(
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

  = NULL watchCoreV1EndpointsListForAllNamespaces watch individual
  changes to a list of Endpoints. deprecated: use the 'watch' parameter
  with a list operation instead.

------------------------------------------------------------------------

### Method `watch_endpoints_list_for_all_namespaces()`

#### Usage

    CoreV1Api$watch_endpoints_list_for_all_namespaces(
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

  = NULL watchCoreV1EventListForAllNamespaces watch individual changes
  to a list of Event. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_event_list_for_all_namespaces()`

#### Usage

    CoreV1Api$watch_event_list_for_all_namespaces(
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

  = NULL watchCoreV1LimitRangeListForAllNamespaces watch individual
  changes to a list of LimitRange. deprecated: use the 'watch' parameter
  with a list operation instead.

------------------------------------------------------------------------

### Method `watch_limit_range_list_for_all_namespaces()`

#### Usage

    CoreV1Api$watch_limit_range_list_for_all_namespaces(
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

  = NULL watchCoreV1NamespaceList watch individual changes to a list of
  Namespace. deprecated: use the 'watch' parameter with a list operation
  instead.

------------------------------------------------------------------------

### Method `watch_namespace_list()`

#### Usage

    CoreV1Api$watch_namespace_list(
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

  = NULL watchCoreV1NamespacedConfigMapList watch individual changes to
  a list of ConfigMap. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_config_map_list()`

#### Usage

    CoreV1Api$watch_namespaced_config_map_list(
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

  = NULL watchCoreV1NamespacedConfigMap watch changes to an object of
  kind ConfigMap. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_config_map()`

#### Usage

    CoreV1Api$watch_namespaced_config_map(
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

  = NULL watchCoreV1NamespacedEndpointsList watch individual changes to
  a list of Endpoints. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_endpoints_list()`

#### Usage

    CoreV1Api$watch_namespaced_endpoints_list(
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

  = NULL watchCoreV1NamespacedEndpoints watch changes to an object of
  kind Endpoints. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_endpoints()`

#### Usage

    CoreV1Api$watch_namespaced_endpoints(
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

  = NULL watchCoreV1NamespacedEventList watch individual changes to a
  list of Event. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_event_list()`

#### Usage

    CoreV1Api$watch_namespaced_event_list(
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

  = NULL watchCoreV1NamespacedEvent watch changes to an object of kind
  Event. deprecated: use the 'watch' parameter with a list operation
  instead, filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_event()`

#### Usage

    CoreV1Api$watch_namespaced_event(
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

  = NULL watchCoreV1NamespacedLimitRangeList watch individual changes to
  a list of LimitRange. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_limit_range_list()`

#### Usage

    CoreV1Api$watch_namespaced_limit_range_list(
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

  = NULL watchCoreV1NamespacedLimitRange watch changes to an object of
  kind LimitRange. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_limit_range()`

#### Usage

    CoreV1Api$watch_namespaced_limit_range(
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

  = NULL watchCoreV1NamespacedPersistentVolumeClaimList watch individual
  changes to a list of PersistentVolumeClaim. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_persistent_volume_claim_list()`

#### Usage

    CoreV1Api$watch_namespaced_persistent_volume_claim_list(
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

  = NULL watchCoreV1NamespacedPersistentVolumeClaim watch changes to an
  object of kind PersistentVolumeClaim. deprecated: use the 'watch'
  parameter with a list operation instead, filtered to a single item
  with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_persistent_volume_claim()`

#### Usage

    CoreV1Api$watch_namespaced_persistent_volume_claim(
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

  = NULL watchCoreV1NamespacedPodList watch individual changes to a list
  of Pod. deprecated: use the 'watch' parameter with a list operation
  instead.

------------------------------------------------------------------------

### Method `watch_namespaced_pod_list()`

#### Usage

    CoreV1Api$watch_namespaced_pod_list(
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

  = NULL watchCoreV1NamespacedPod watch changes to an object of kind
  Pod. deprecated: use the 'watch' parameter with a list operation
  instead, filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_pod()`

#### Usage

    CoreV1Api$watch_namespaced_pod(
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

  = NULL watchCoreV1NamespacedPodTemplateList watch individual changes
  to a list of PodTemplate. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_pod_template_list()`

#### Usage

    CoreV1Api$watch_namespaced_pod_template_list(
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

  = NULL watchCoreV1NamespacedPodTemplate watch changes to an object of
  kind PodTemplate. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_pod_template()`

#### Usage

    CoreV1Api$watch_namespaced_pod_template(
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

  = NULL watchCoreV1NamespacedReplicationControllerList watch individual
  changes to a list of ReplicationController. deprecated: use the
  'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_replication_controller_list()`

#### Usage

    CoreV1Api$watch_namespaced_replication_controller_list(
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

  = NULL watchCoreV1NamespacedReplicationController watch changes to an
  object of kind ReplicationController. deprecated: use the 'watch'
  parameter with a list operation instead, filtered to a single item
  with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_replication_controller()`

#### Usage

    CoreV1Api$watch_namespaced_replication_controller(
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

  = NULL watchCoreV1NamespacedResourceQuotaList watch individual changes
  to a list of ResourceQuota. deprecated: use the 'watch' parameter with
  a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_resource_quota_list()`

#### Usage

    CoreV1Api$watch_namespaced_resource_quota_list(
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

  = NULL watchCoreV1NamespacedResourceQuota watch changes to an object
  of kind ResourceQuota. deprecated: use the 'watch' parameter with a
  list operation instead, filtered to a single item with the
  'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_resource_quota()`

#### Usage

    CoreV1Api$watch_namespaced_resource_quota(
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

  = NULL watchCoreV1NamespacedSecretList watch individual changes to a
  list of Secret. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_secret_list()`

#### Usage

    CoreV1Api$watch_namespaced_secret_list(
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

  = NULL watchCoreV1NamespacedSecret watch changes to an object of kind
  Secret. deprecated: use the 'watch' parameter with a list operation
  instead, filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_secret()`

#### Usage

    CoreV1Api$watch_namespaced_secret(
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

  = NULL watchCoreV1NamespacedServiceAccountList watch individual
  changes to a list of ServiceAccount. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_service_account_list()`

#### Usage

    CoreV1Api$watch_namespaced_service_account_list(
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

  = NULL watchCoreV1NamespacedServiceAccount watch changes to an object
  of kind ServiceAccount. deprecated: use the 'watch' parameter with a
  list operation instead, filtered to a single item with the
  'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_service_account()`

#### Usage

    CoreV1Api$watch_namespaced_service_account(
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

  = NULL watchCoreV1NamespacedServiceList watch individual changes to a
  list of Service. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_namespaced_service_list()`

#### Usage

    CoreV1Api$watch_namespaced_service_list(
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

  = NULL watchCoreV1NamespacedService watch changes to an object of kind
  Service. deprecated: use the 'watch' parameter with a list operation
  instead, filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespaced_service()`

#### Usage

    CoreV1Api$watch_namespaced_service(
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

  = NULL watchCoreV1Namespace watch changes to an object of kind
  Namespace. deprecated: use the 'watch' parameter with a list operation
  instead, filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_namespace()`

#### Usage

    CoreV1Api$watch_namespace(
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

  = NULL watchCoreV1NodeList watch individual changes to a list of Node.
  deprecated: use the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_node_list()`

#### Usage

    CoreV1Api$watch_node_list(
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

  = NULL watchCoreV1Node watch changes to an object of kind Node.
  deprecated: use the 'watch' parameter with a list operation instead,
  filtered to a single item with the 'fieldSelector' parameter.

------------------------------------------------------------------------

### Method `watch_node()`

#### Usage

    CoreV1Api$watch_node(
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

  = NULL watchCoreV1PersistentVolumeClaimListForAllNamespaces watch
  individual changes to a list of PersistentVolumeClaim. deprecated: use
  the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_persistent_volume_claim_list_for_all_namespaces()`

#### Usage

    CoreV1Api$watch_persistent_volume_claim_list_for_all_namespaces(
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

  = NULL watchCoreV1PersistentVolumeList watch individual changes to a
  list of PersistentVolume. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_persistent_volume_list()`

#### Usage

    CoreV1Api$watch_persistent_volume_list(
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

  = NULL watchCoreV1PersistentVolume watch changes to an object of kind
  PersistentVolume. deprecated: use the 'watch' parameter with a list
  operation instead, filtered to a single item with the 'fieldSelector'
  parameter.

------------------------------------------------------------------------

### Method `watch_persistent_volume()`

#### Usage

    CoreV1Api$watch_persistent_volume(
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

  = NULL watchCoreV1PodListForAllNamespaces watch individual changes to
  a list of Pod. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_pod_list_for_all_namespaces()`

#### Usage

    CoreV1Api$watch_pod_list_for_all_namespaces(
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

  = NULL watchCoreV1PodTemplateListForAllNamespaces watch individual
  changes to a list of PodTemplate. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_pod_template_list_for_all_namespaces()`

#### Usage

    CoreV1Api$watch_pod_template_list_for_all_namespaces(
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

  = NULL watchCoreV1ReplicationControllerListForAllNamespaces watch
  individual changes to a list of ReplicationController. deprecated: use
  the 'watch' parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_replication_controller_list_for_all_namespaces()`

#### Usage

    CoreV1Api$watch_replication_controller_list_for_all_namespaces(
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

  = NULL watchCoreV1ResourceQuotaListForAllNamespaces watch individual
  changes to a list of ResourceQuota. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_resource_quota_list_for_all_namespaces()`

#### Usage

    CoreV1Api$watch_resource_quota_list_for_all_namespaces(
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

  = NULL watchCoreV1SecretListForAllNamespaces watch individual changes
  to a list of Secret. deprecated: use the 'watch' parameter with a list
  operation instead.

------------------------------------------------------------------------

### Method `watch_secret_list_for_all_namespaces()`

#### Usage

    CoreV1Api$watch_secret_list_for_all_namespaces(
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

  = NULL watchCoreV1ServiceAccountListForAllNamespaces watch individual
  changes to a list of ServiceAccount. deprecated: use the 'watch'
  parameter with a list operation instead.

------------------------------------------------------------------------

### Method `watch_service_account_list_for_all_namespaces()`

#### Usage

    CoreV1Api$watch_service_account_list_for_all_namespaces(
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

  = NULL watchCoreV1ServiceListForAllNamespaces watch individual changes
  to a list of Service. deprecated: use the 'watch' parameter with a
  list operation instead.

------------------------------------------------------------------------

### Method `watch_service_list_for_all_namespaces()`

#### Usage

    CoreV1Api$watch_service_list_for_all_namespaces(
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

    CoreV1Api$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.
