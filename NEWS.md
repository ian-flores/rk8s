# rk8s 0.2.1 (in development)

* `pod_port_forward()` (local TCP listener) now works against kind/local
  clusters. Three correctness fixes folded together:
  * The bridge child process now references the internal `bridge_one`
    helper as `rk8s:::bridge_one` since callr ships the function body
    into a fresh R process where unexported bindings aren't injected.
  * The accept loop pumps the websocket event loop via `later::run_now`
    while waiting for incoming TCP connections, instead of busy-spinning
    on `blocking=FALSE` accept.
  * Local connections are accepted in non-blocking mode so `readBin`
    returns immediately with whatever the kernel has buffered. With
    `blocking=TRUE` + `socketSelect`, the local round-trip stretched into
    seconds for short HTTP exchanges on macOS.
* `Watch` no longer hangs on chunks containing exactly one
  newline-terminated event. R's `strsplit("a\\n", "\\n")` returns
  `c("a")` (drops the trailing empty piece), which previously made the
  buffer-based parser keep waiting for "more". Now we detect the
  trailing-newline case explicitly. Regression covered by
  `test-watch-buffer.R`.
* New integration tests for exec and port-forward that mint a
  cluster-admin ServiceAccount token via `TokenRequest` so the
  websocket transport (which can't currently use client-cert auth) is
  reachable on cert-only kubeconfigs like kind. Lives in
  `tests/integration/helper.R` as `mint_token_client()`.

# rk8s 0.2.0

## High-level verb API

* New `kube()` session and idiomatic verbs: `kube_get()`, `kube_list()`,
  `kube_apply()`, `kube_delete()`, `kube_scale()`, `kube_logs()`,
  `kube_watch()`. This is the surface most users want — you never have
  to type `V1Deployment$new(...)` to do everyday work.
* Resource refs accept any of: kind alias (`"pod"`, `"po"`, `"pods"`),
  `"kind/name"` (`"deployment/nginx"`), explicit `"apiVersion:Kind"`,
  or `c(apiVersion, Kind)`. Built-in alias table covers the common
  kubectl shortcodes (`po`, `svc`, `deploy`, `sts`, `ds`, `rs`, `cm`,
  `sa`, `pv`, `pvc`, `ing`, `netpol`, `hpa`, `pdb`, `sc`, `crd`, …).
* `as.data.frame()` method for `rk8s_list` returns a tabular view
  (namespace / name / kind / age / status), so `kube_get(k, "pods")`
  is directly viewable.
* `kube_apply()` is server-side apply (`Content-Type:
  application/apply-patch+yaml`) by default, with `force = TRUE`
  conflict resolution and a configurable `field_manager`.

## Pod exec and port-forward (WebSocket)

* New `pod_exec_open()` / `pod_exec()` and `PodExecSession`. Speaks
  `v4.channel.k8s.io` over WebSocket, demuxes stdin/stdout/stderr/error/
  resize channels, surfaces the kubelet's exit code.
* New `pod_port_forward_open()` and `PodPortForwardSession`. Same
  subprotocol; per-port `write()` / `on_data()` API matching the
  Python client's design (no local TCP listener required).
* Both depend on the `websocket` package (Suggests). Bearer-token
  auth only — client-cert auth over WebSocket is not yet supported.

## Generated layer fixes

* **Critical correctness fix**: the generator now resolves
  `$ref` parameters against `spec$parameters` before emitting
  signatures. Prior versions silently dropped `namespace`, `body`,
  `fieldManager`, `force`, and other shared parameters from every
  namespaced operation — making most generated `*_namespaced_*`
  methods unusable. All 944 operations regenerated.
* PATCH methods now accept an optional `content_type` argument,
  defaulting to the spec's first `consumes` entry. Pass
  `application/apply-patch+yaml` for server-side apply, or
  `application/json-patch+json` for RFC 6902 patches.
* Argument-name collisions in mixed-`in` operations (notably
  `connect_*_namespaced_pod_proxy_with_path`, where `path` is both
  a path and a query parameter) are disambiguated with a `_query` /
  `_header` / `_body` suffix while preserving the wire key.

## Other changes

* Windows: relaxed the URL-assertion in `test-client-request.R` to
  decode the query before comparing, fixing a Windows-only failure
  caused by httr2's platform-dependent percent-encoding of `=`.
* Vignette and README rewritten to lead with the verb API; the typed
  layer is documented as a drop-down for advanced cases.
* Integration test suite under `tests/integration/` running against a
  kind cluster, gated on `RK8S_E2E=1`. New
  `.github/workflows/integration.yaml` runs it on push and PR.

# rk8s 0.1.0

Initial release.

## Runtime

* `Configuration` + `ApiClient` — transport, auth (bearer, basic,
  client-cert, token-file, exec plugin), TLS, JSON (de)serialization,
  typed error translation.
* `load_kube_config()`, `load_incluster_config()`,
  `list_kube_config_contexts()`, `new_client_from_config()` — match the
  semantics of `kubernetes.config` in the Python client.
* `Watch` — streaming line-delimited JSON with 410-Gone resume.
* `Informer` + `Lister` — client-go-style shared cache, initial list
  plus watch with per-handler add/update/delete events.
* `DynamicClient` / `DynamicResource` — discovery-backed CRUD for
  CustomResources and any untyped resource.
* `run_as_leader()` — leader election against a
  `coordination.k8s.io/v1` Lease, with optional `callr`-driven
  background renewer.
* `ApiException` + `rk8s_api_error` condition class.
* `create_from_yaml()`, `parse_quantity()`.

## Generated API surface (Kubernetes 1.31 OpenAPI)

* 62 typed API classes (`CoreV1Api`, `AppsV1Api`, `BatchV1Api`,
  `NetworkingV1Api`, `RbacAuthorizationV1Api`, …) covering 944
  operations.
* 635 model classes (`V1Pod`, `V1Deployment`, `V1ConfigMap`, …) with
  `to_list()` / `from_list()` JSON round-tripping.
* Unstructured scalar types (`IntOrString`, `Quantity`, `Time`,
  `MicroTime`, `FieldsV1`, `RawExtension`, `JSON`, `Patch`,
  `JSONSchemaPropsOr*`) emitted as thin value wrappers.
* JSON-schema meta keys (`$ref`, `$schema`) mangled to `_ref`,
  `_schema` on the R side while preserving the literal JSON key on
  the wire.

## Generator

* `tools/gen/generate.R` + `tools/gen/lib.R` — reads a Kubernetes
  OpenAPI v2 swagger.json and writes `R/gen_model_*.R` and
  `R/gen_api_*.R`. Idempotent; NAMESPACE exports are managed between
  sentinel lines.
