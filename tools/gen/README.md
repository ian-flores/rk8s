# rk8s code generator

Reads a Kubernetes OpenAPI v2 (swagger.json) specification and writes R6
model classes and per-tag API classes into `R/`.

## Run

```bash
Rscript tools/gen/generate.R [spec.json] [out_dir]
```

Defaults: spec = `tools/gen/spec/swagger.json`, out_dir = `R`.

Generated file prefixes:

- `R/gen_model_<Name>.R` — one R6 class per OpenAPI definition
- `R/gen_api_<Name>Api.R` — one R6 class per OpenAPI tag

Existing `R/gen_*` files are removed before regeneration, so renames
and deletions in the upstream spec are reflected. Exports are
re-inserted into `NAMESPACE` between the sentinel lines
`# >>> generated exports ...` / `# <<< generated exports <<<`.

## Pin a spec version

```bash
curl -L -o tools/gen/spec/swagger.json \
  https://raw.githubusercontent.com/kubernetes/kubernetes/release-1.31/api/openapi-spec/swagger.json
```

The spec is checked into the repository so regeneration is
reproducible.

## Naming

- `io.k8s.api.core.v1.Pod` → `V1Pod`
- `io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta` → `V1ObjectMeta`
- Ambiguous short names are disambiguated by prepending the group
  (e.g. `CoreV1Event` vs. `EventsV1Event`).
- Operation IDs like `listCoreV1NamespacedPod` on `CoreV1Api` collapse
  to `list_namespaced_pod` — the class prefix is stripped and the
  rest is snake-cased, matching the Python client.
- Non-identifier JSON keys like `$ref`, `$schema`, and
  `x-kubernetes-*` are mangled to `_ref`, `_schema`,
  `x_kubernetes_*` while preserving the original key on the wire.
- Unstructured scalar types (`IntOrString`, `Quantity`, `Time`,
  `MicroTime`, `FieldsV1`, `RawExtension`, `JSON`, `Patch`, the various
  `JSONSchemaPropsOr*` union types) are emitted as `$value`-bearing
  wrappers that serialize as their raw value.
