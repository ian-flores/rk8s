# Changelog

## rk8s (development version)

### Controller building blocks

- `Watch` gains [`open()`](https://rdrr.io/r/base/connections.html),
  `poll(max_wait)` and
  [`close()`](https://rdrr.io/r/base/connections.html): `poll()` returns
  the events that have arrived without blocking for longer than
  `max_wait`, and reconnects from the last resourceVersion when the
  server ends a connection. `stream()` is now built on them. Events
  record their own resourceVersion, so a watch stopped part-way through
  a batch resumes after the last event delivered.
- `Informer` gains [`start()`](https://rdrr.io/r/stats/start.html),
  `poll(max_wait)` and
  [`close()`](https://rdrr.io/r/base/connections.html), so one R process
  can drive several informers from a single loop. `poll()` relists and
  reconciles after 410 Gone. `run()` is now built on them.
- Watches now run on curl’s multi interface instead of a curl
  connection. Opening a connection waited for the first byte of the
  body, and the API server sends none on a resumed watch until there is
  an event, so an informer on a quiet resource could block for about a
  minute (until the next bookmark) each time its watch reconnected.
- New `WorkQueue`: a queue of object keys with client-go’s semantics.
  Keys are de-duplicated, never handed out twice at once (a key re-added
  while in progress is queued again on `done()`), can be delayed with
  `add_after()`, and retried with per-key exponential backoff via
  `add_rate_limited()` / `forget()`.
- New `Manager` for running controllers in R.
  `mgr$controller(ref, reconcile, owns = ...)` watches a primary
  resource and the resources it creates, queues the key of every changed
  object (owned objects queue their controller owner), and calls
  `reconcile(req, k)` for each key. Reconcile returns `NULL` when done,
  [`requeue()`](https://ian-flores.github.io/rk8s/reference/requeue.md)
  to retry with backoff, or `requeue_after(seconds)`; errors are logged
  and retried. `mgr$run()` drives every controller from one loop,
  optionally under leader election (`leader_election = "<lease>"`), and
  `mgr$step()` runs a single pass.
- `mgr$controller(workers = n)` runs up to `n` reconciles at once in
  background R processes (via `mirai`, in Suggests) while the loop keeps
  handling events; one object is still never reconciled twice at the
  same time, and changes made while it runs trigger one more reconcile.
  Workers get their own session from the manager’s connection settings,
  the packages attached in the manager’s session, and the global helper
  functions and values the reconcile refers to.
  [`start()`](https://rdrr.io/r/stats/start.html) waits (up to a minute)
  for the workers to be ready and reports a failed worker setup as an
  error.
- Helpers for reconcile functions:
  [`kube_patch_status()`](https://ian-flores.github.io/rk8s/reference/kube_patch_status.md)
  (merge patch to the `/status` subresource),
  [`set_owner()`](https://ian-flores.github.io/rk8s/reference/set_owner.md)
  (controller owner reference, so owned objects are garbage-collected
  and reconcile their owner),
  [`add_finalizer()`](https://ian-flores.github.io/rk8s/reference/finalizers.md)
  /
  [`remove_finalizer()`](https://ian-flores.github.io/rk8s/reference/finalizers.md)
  /
  [`has_finalizer()`](https://ian-flores.github.io/rk8s/reference/finalizers.md)
  /
  [`is_deleting()`](https://ian-flores.github.io/rk8s/reference/finalizers.md)
  (patches carry the resourceVersion, so a stale read gets a 409 instead
  of a lost update), and
  [`kube_event()`](https://ian-flores.github.io/rk8s/reference/kube_event.md)
  (events shown by `kubectl describe`).
- `Manager$run(health_port =)` (or `$serve_health(port)`) answers
  Kubernetes probes from the loop: `/healthz` is 200 while the loop
  turns, `/readyz` is 200 once running or standing by for the lease.
  While waiting for the lease, a standby manager keeps answering probes
  and now honours `stop_seconds` and
  [`stop()`](https://rdrr.io/r/base/stop.html).
  [`run_as_leader()`](https://ian-flores.github.io/rk8s/reference/run_as_leader.md)
  gains `on_wait`, called instead of
  [`Sys.sleep()`](https://rdrr.io/r/base/Sys.sleep.html) between
  acquisition attempts.
- New
  [`use_operator()`](https://ian-flores.github.io/rk8s/reference/use_operator.md)
  writes a starting point for an operator in R: an `operator.R` that
  runs a `Manager` (in-cluster or locally), a Dockerfile on
  `rocker/r-ver` with `tini` as PID 1 (so SIGTERM stops R promptly and
  leader failover takes about one lease period instead of waiting out
  the termination grace period), and a CRD, RBAC and Deployment with
  probes. An opt-in integration test builds the scaffolded image, runs
  two replicas in kind, and checks reconciling and failover.

### Security

- [`pod_exec()`](https://ian-flores.github.io/rk8s/reference/pod_exec.md),
  [`pod_exec_open()`](https://ian-flores.github.io/rk8s/reference/pod_exec_open.md),
  [`pod_port_forward()`](https://ian-flores.github.io/rk8s/reference/pod_port_forward.md)
  and
  [`pod_port_forward_open()`](https://ian-flores.github.io/rk8s/reference/pod_port_forward_open.md)
  now verify the API server’s TLS certificate. They previously used the
  `websocket` package, which accepts any certificate for any hostname,
  so the bearer token could be sent to an impersonating server. They now
  use `nanonext` (\>= 1.10.3, in Suggests instead of `websocket` and
  `later`), verify against the kubeconfig CA (or the system CA bundle)
  and check the hostname. `insecure-skip-tls-verify` is still honoured
  when set.
- Limitations of the new transport, each reported with a clear error
  rather than an insecure connection: client-certificate-only users need
  a token for exec / port-forward, and `tls-server-name` is not
  supported for them.
- Sessions gain `pump(timeout)` to dispatch incoming frames without
  blocking for long; `PodPortForwardSession` gains `is_closed()`. Frames
  are dispatched only while `wait()` or `pump()` runs (as before, when
  the `later` event loop had to be run).

### Correctness fixes

- Typed create/replace calls (`AppsV1Api$create_namespaced_deployment()`
  and the other generated write operations) failed with 415 Unsupported
  Media Type: they sent the spec’s `Content-Type: */*` literally.
  Wildcards are now sent as `application/json`.
- [`kube_logs()`](https://ian-flores.github.io/rk8s/reference/kube_logs.md)
  and `CoreV1Api$read_namespaced_pod_log()` failed with 406 Not
  Acceptable (a bare `Accept: text/plain` is refused by the API server);
  `*/*` is now offered as a fallback. Untyped generated operations
  (logs, proxy, …) return text bodies as strings instead of failing to
  parse them as JSON.
- `pod_exec(stdin_data =)` hung until its timeout: the empty stdin frame
  it sent is not an EOF in the `v4.channel.k8s.io` protocol. Exec now
  offers `v5.channel.k8s.io` (Kubernetes 1.29+) and `close_stdin()`
  sends its stream-close message.
- `Watch` now delivers events as they arrive. It previously read the
  stream with a blocking 64 KB
  [`readBin()`](https://rdrr.io/r/base/readBin.html), so small events
  were held until 64 KB accumulated or the server closed the watch.
  Requires httr2 \>= 1.1.0.
- `Watch$stream(timeout_seconds =)`, `kube_watch(timeout_seconds =)` and
  `Informer$run(stop_seconds =)` are now real wall-clock limits.
  Previously the watch reconnected forever after each server timeout, so
  on a quiet resource these calls never returned. `Watch` gains
  `end_reason` (`"stop"`, `"timeout"`, `"gone"`) and `return_on_gone`.
- `Informer` re-lists after 410 Gone and reconciles its cache, firing
  `on_delete` for objects removed while it was disconnected (previously
  they stayed in the cache forever), `on_add` for new ones and
  `on_update` for changed ones. Lists are paged (`page_size`, default
  500).
- [`run_as_leader()`](https://ian-flores.github.io/rk8s/reference/run_as_leader.md)
  can no longer leave two leaders running: `on_started_leading` now
  receives a leader handle and must call `leader$check()` periodically;
  it signals `rk8s_leadership_lost` once the lease is lost or renewals
  stop succeeding, and
  [`run_as_leader()`](https://ian-flores.github.io/rk8s/reference/run_as_leader.md)
  then cleans up and calls `on_stopped_leading()`. Previously nothing
  noticed a lost lease until the callback returned. The background
  renewer now uses the full connection settings (client certificates,
  token files, exec plugins) instead of a bearer token snapshot, which
  failed on cert-only clusters and expired with exec tokens. Lease
  updates no longer round-trip `managedFields`. The lease is released on
  exit (`release_on_exit`), and errors from the callback are re-raised
  after cleanup. Requires `callr`.
- Exec credential plugins (EKS, GKE, AKS/kubelogin, …) work again: every
  call failed in a cache-key helper. They now also receive their input
  in `KUBERNETES_EXEC_INFO` (with `provideClusterInfo` support), keep
  stderr out of the JSON they parse, pass args and env values containing
  spaces or quotes intact, honour client certificate/key credentials,
  include `installHint` and stderr in errors, parse expiry timestamps
  with fractional seconds or offsets, and are re-run once when the API
  server answers 401.
- A kubeconfig user with `tokenFile:` sent the file *path* as its bearer
  token (`$` partial matching read `tokenFile` as `token`).

### New features

- `KUBECONFIG` with several files is merged like kubectl does (first
  definition wins, relative paths resolve per file).
- The context’s `namespace` is read into `Configuration$namespace` and
  used as the default by
  [`kube()`](https://ian-flores.github.io/rk8s/reference/Kube.md) (whose
  `namespace` argument now defaults to `NULL`). In-cluster config reads
  the service account namespace.
- Cluster `proxy-url` and `tls-server-name` are honoured.
- OIDC `auth-provider` users are supported, including id-token refresh;
  `load_kube_config(persist_config = TRUE)` writes refreshed tokens
  back. The removed `gcp`/`azure` auth-providers give an actionable
  error.
- Ordinary requests are retried (`Configuration$max_retries`, default 3)
  on 429 for any method and on 5xx/connection failures for GET/HEAD,
  with jittered backoff and `Retry-After` support. New
  `Configuration$timeout`.
- `DynamicResource$list()` (and so
  [`kube_list()`](https://ian-flores.github.io/rk8s/reference/kube_list.md))
  fetches all pages.

## rk8s 0.2.1

- [`pod_port_forward()`](https://ian-flores.github.io/rk8s/reference/pod_port_forward.md)
  (local TCP listener) now works against kind/local clusters. Three
  correctness fixes folded together:
  - The bridge child process now references the internal `bridge_one`
    helper as `rk8s:::bridge_one` since callr ships the function body
    into a fresh R process where unexported bindings aren’t injected.
  - The accept loop pumps the websocket event loop via `later::run_now`
    while waiting for incoming TCP connections, instead of busy-spinning
    on `blocking=FALSE` accept.
  - Local connections are accepted in non-blocking mode so `readBin`
    returns immediately with whatever the kernel has buffered. With
    `blocking=TRUE` + `socketSelect`, the local round-trip stretched
    into seconds for short HTTP exchanges on macOS.
- `Watch` no longer hangs on chunks containing exactly one
  newline-terminated event. R’s `strsplit("a\\n", "\\n")` returns
  `c("a")` (drops the trailing empty piece), which previously made the
  buffer-based parser keep waiting for “more”. Now we detect the
  trailing-newline case explicitly. Regression covered by
  `test-watch-buffer.R`.
- New integration tests for exec and port-forward that mint a
  cluster-admin ServiceAccount token via `TokenRequest` so the websocket
  transport (which can’t currently use client-cert auth) is reachable on
  cert-only kubeconfigs like kind. Lives in `tests/integration/helper.R`
  as `mint_token_client()`.

## rk8s 0.2.0

### High-level verb API

- New [`kube()`](https://ian-flores.github.io/rk8s/reference/Kube.md)
  session and idiomatic verbs:
  [`kube_get()`](https://ian-flores.github.io/rk8s/reference/kube_get.md),
  [`kube_list()`](https://ian-flores.github.io/rk8s/reference/kube_list.md),
  [`kube_apply()`](https://ian-flores.github.io/rk8s/reference/kube_apply.md),
  [`kube_delete()`](https://ian-flores.github.io/rk8s/reference/kube_delete.md),
  [`kube_scale()`](https://ian-flores.github.io/rk8s/reference/kube_scale.md),
  [`kube_logs()`](https://ian-flores.github.io/rk8s/reference/kube_logs.md),
  [`kube_watch()`](https://ian-flores.github.io/rk8s/reference/kube_watch.md).
  This is the surface most users want — you never have to type
  `V1Deployment$new(...)` to do everyday work.
- Resource refs accept any of: kind alias (`"pod"`, `"po"`, `"pods"`),
  `"kind/name"` (`"deployment/nginx"`), explicit `"apiVersion:Kind"`, or
  `c(apiVersion, Kind)`. Built-in alias table covers the common kubectl
  shortcodes (`po`, `svc`, `deploy`, `sts`, `ds`, `rs`, `cm`, `sa`,
  `pv`, `pvc`, `ing`, `netpol`, `hpa`, `pdb`, `sc`, `crd`, …).
- [`as.data.frame()`](https://rdrr.io/r/base/as.data.frame.html) method
  for `rk8s_list` returns a tabular view (namespace / name / kind / age
  / status), so `kube_get(k, "pods")` is directly viewable.
- [`kube_apply()`](https://ian-flores.github.io/rk8s/reference/kube_apply.md)
  is server-side apply (`Content-Type: application/apply-patch+yaml`) by
  default, with `force = TRUE` conflict resolution and a configurable
  `field_manager`.

### Pod exec and port-forward (WebSocket)

- New
  [`pod_exec_open()`](https://ian-flores.github.io/rk8s/reference/pod_exec_open.md)
  /
  [`pod_exec()`](https://ian-flores.github.io/rk8s/reference/pod_exec.md)
  and `PodExecSession`. Speaks `v4.channel.k8s.io` over WebSocket,
  demuxes stdin/stdout/stderr/error/ resize channels, surfaces the
  kubelet’s exit code.
- New
  [`pod_port_forward_open()`](https://ian-flores.github.io/rk8s/reference/pod_port_forward_open.md)
  and `PodPortForwardSession`. Same subprotocol; per-port
  [`write()`](https://rdrr.io/r/base/write.html) / `on_data()` API
  matching the Python client’s design (no local TCP listener required).
- Both depend on the `websocket` package (Suggests). Bearer-token auth
  only — client-cert auth over WebSocket is not yet supported.

### Generated layer fixes

- **Critical correctness fix**: the generator now resolves `$ref`
  parameters against `spec$parameters` before emitting signatures. Prior
  versions silently dropped `namespace`, `body`, `fieldManager`,
  `force`, and other shared parameters from every namespaced operation —
  making most generated `*_namespaced_*` methods unusable. All 944
  operations regenerated.
- PATCH methods now accept an optional `content_type` argument,
  defaulting to the spec’s first `consumes` entry. Pass
  `application/apply-patch+yaml` for server-side apply, or
  `application/json-patch+json` for RFC 6902 patches.
- Argument-name collisions in mixed-`in` operations (notably
  `connect_*_namespaced_pod_proxy_with_path`, where `path` is both a
  path and a query parameter) are disambiguated with a `_query` /
  `_header` / `_body` suffix while preserving the wire key.

### Other changes

- Windows: relaxed the URL-assertion in `test-client-request.R` to
  decode the query before comparing, fixing a Windows-only failure
  caused by httr2’s platform-dependent percent-encoding of `=`.
- Vignette and README rewritten to lead with the verb API; the typed
  layer is documented as a drop-down for advanced cases.
- Integration test suite under `tests/integration/` running against a
  kind cluster, gated on `RK8S_E2E=1`. New
  `.github/workflows/integration.yaml` runs it on push and PR.

## rk8s 0.1.0

Initial release.

### Runtime

- `Configuration` + `ApiClient` — transport, auth (bearer, basic,
  client-cert, token-file, exec plugin), TLS, JSON (de)serialization,
  typed error translation.
- [`load_kube_config()`](https://ian-flores.github.io/rk8s/reference/load_kube_config.md),
  [`load_incluster_config()`](https://ian-flores.github.io/rk8s/reference/load_incluster_config.md),
  [`list_kube_config_contexts()`](https://ian-flores.github.io/rk8s/reference/list_kube_config_contexts.md),
  [`new_client_from_config()`](https://ian-flores.github.io/rk8s/reference/new_client_from_config.md)
  — match the semantics of `kubernetes.config` in the Python client.
- `Watch` — streaming line-delimited JSON with 410-Gone resume.
- `Informer` + `Lister` — client-go-style shared cache, initial list
  plus watch with per-handler add/update/delete events.
- `DynamicClient` / `DynamicResource` — discovery-backed CRUD for
  CustomResources and any untyped resource.
- [`run_as_leader()`](https://ian-flores.github.io/rk8s/reference/run_as_leader.md)
  — leader election against a `coordination.k8s.io/v1` Lease, with
  optional `callr`-driven background renewer.
- `ApiException` + `rk8s_api_error` condition class.
- [`create_from_yaml()`](https://ian-flores.github.io/rk8s/reference/create_from_yaml.md),
  [`parse_quantity()`](https://ian-flores.github.io/rk8s/reference/parse_quantity.md).

### Generated API surface (Kubernetes 1.31 OpenAPI)

- 62 typed API classes (`CoreV1Api`, `AppsV1Api`, `BatchV1Api`,
  `NetworkingV1Api`, `RbacAuthorizationV1Api`, …) covering 944
  operations.
- 635 model classes (`V1Pod`, `V1Deployment`, `V1ConfigMap`, …) with
  `to_list()` / `from_list()` JSON round-tripping.
- Unstructured scalar types (`IntOrString`, `Quantity`, `Time`,
  `MicroTime`, `FieldsV1`, `RawExtension`, `JSON`, `Patch`,
  `JSONSchemaPropsOr*`) emitted as thin value wrappers.
- JSON-schema meta keys (`$ref`, `$schema`) mangled to `_ref`, `_schema`
  on the R side while preserving the literal JSON key on the wire.

### Generator

- `tools/gen/generate.R` + `tools/gen/lib.R` — reads a Kubernetes
  OpenAPI v2 swagger.json and writes `R/gen_model_*.R` and
  `R/gen_api_*.R`. Idempotent; NAMESPACE exports are managed between
  sentinel lines.
