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
