#' rk8s: Kubernetes client for R
#'
#' rk8s ports the Kubernetes Python client and Go client-go to R. The package
#' layout mirrors the Python client:
#'
#' * A hand-written runtime in `R/` — [Configuration], [ApiClient],
#'   [load_kube_config()], [load_incluster_config()], [Watch], [DynamicClient],
#'   [create_from_yaml()].
#' * Typed API and model classes under `R/gen/`, code-generated from the
#'   Kubernetes OpenAPI specification by the generator in `tools/gen/`.
#'
#' Do not hand-edit files under `R/gen/`; regenerate via
#' `Rscript tools/gen/generate.R`.
#'
#' @keywords internal
"_PACKAGE"
