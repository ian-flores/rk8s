# rk8s: Kubernetes client for R

rk8s ports the Kubernetes Python client and Go client-go to R. The
package layout mirrors the Python client:

## Details

- A hand-written runtime in `R/` -
  [Configuration](https://ian-flores.github.io/rk8s/reference/Configuration.md),
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md),
  [`load_kube_config()`](https://ian-flores.github.io/rk8s/reference/load_kube_config.md),
  [`load_incluster_config()`](https://ian-flores.github.io/rk8s/reference/load_incluster_config.md),
  [Watch](https://ian-flores.github.io/rk8s/reference/Watch.md),
  [DynamicClient](https://ian-flores.github.io/rk8s/reference/DynamicClient.md),
  [`create_from_yaml()`](https://ian-flores.github.io/rk8s/reference/create_from_yaml.md).

- Typed API and model classes under `R/gen/`, code-generated from the
  Kubernetes OpenAPI specification by the generator in `tools/gen/`.

Do not hand-edit files under `R/gen/`; regenerate via
`Rscript tools/gen/generate.R`.

## See also

Useful links:

- <https://ian-flores.github.io/rk8s/>

- <https://github.com/ian-flores/rk8s>

- Report bugs at <https://github.com/ian-flores/rk8s/issues>

## Author

**Maintainer**: Ian Flores Siaca <iflores.siaca@gmail.com>
