# Split a YAML document stream on top-level `---` separators (YAML 1.2 spec:
# a `---` line at column 0 starts a new document). Everything before any `---`
# is treated as the first document. Returns a character vector of documents
# (may be empty strings for trailing separators).
split_yaml_docs <- function(text) {
  lines <- strsplit(text, "\n", fixed = TRUE)[[1]]
  is_sep <- grepl("^---\\s*$", lines)
  if (!any(is_sep)) return(list(text))
  idx <- which(is_sep)
  starts <- c(1, idx + 1)
  ends <- c(idx - 1, length(lines))
  out <- mapply(function(s, e) if (s > e) "" else paste(lines[s:e], collapse = "\n"),
                 starts, ends, SIMPLIFY = FALSE)
  out
}

# Used by generated to_list() methods to strip NULL entries recursively so
# JSON-serialized output matches the wire format exactly (no "field": null
# noise except where the API actually uses nullables).
drop_nulls_deep <- function(x) {
  if (is.list(x) && !inherits(x, "R6")) {
    x <- x[!vapply(x, is.null, logical(1))]
    x <- lapply(x, drop_nulls_deep)
  }
  x
}

#' Create one or more Kubernetes resources from a YAML manifest
#'
#' Accepts a path or a character string containing one or more YAML documents
#' (separated by `---`). Each document is routed to the correct endpoint via
#' the [DynamicClient]. Mirrors `kubernetes.utils.create_from_yaml`.
#'
#' @param client An [ApiClient].
#' @param yaml_file Path to a YAML file; mutually exclusive with `yaml_string`.
#' @param yaml_string A character string of YAML content.
#' @param namespace Default namespace for namespaced resources that don't
#'   specify one. Defaults to "default".
#'
#' @return A list of server responses, one per document.
#' @examples
#' \dontrun{
#' client <- new_client_from_config()
#' create_from_yaml(client, yaml_file = "manifest.yaml")
#' }
#' @export
create_from_yaml <- function(client, yaml_file = NULL, yaml_string = NULL,
                              namespace = "default") {
  if (is.null(yaml_file) == is.null(yaml_string)) {
    stop("Provide exactly one of `yaml_file` or `yaml_string`")
  }
  text <- if (!is.null(yaml_file)) paste(readLines(yaml_file, warn = FALSE),
                                          collapse = "\n") else yaml_string
  # yaml::yaml.load_all isn't exported; split the multi-doc stream ourselves
  # at top-level `---` separators (per YAML 1.2 document stream).
  parts <- split_yaml_docs(text)
  docs <- lapply(parts, function(p) if (nzchar(trimws(p))) yaml::yaml.load(p) else NULL)
  docs <- Filter(Negate(is.null), docs)
  dyn <- DynamicClient$new(client)
  lapply(docs, function(doc) {
    if (is.null(doc) || is.null(doc$kind)) return(NULL)
    res <- dyn$resource(api_version = doc$apiVersion, kind = doc$kind)
    ns <- doc$metadata$namespace %||% namespace
    res$create(doc, namespace = if (isTRUE(res$info$namespaced)) ns else NULL)
  })
}

#' Parse a Kubernetes resource quantity
#'
#' Converts strings like "100m", "256Mi", "2Gi", "1.5", "500k" into numeric
#' values. Suffix semantics match `k8s.io/apimachinery/pkg/api/resource.Quantity`.
#'
#' @param x Character vector of quantity strings.
#' @return Numeric vector of the same length.
#' @examples
#' parse_quantity(c("100m", "256Mi", "1.5Gi", "2"))
#' @export
parse_quantity <- function(x) {
  suffixes <- c(
    n  = 1e-9, u  = 1e-6, m  = 1e-3,
    k  = 1e3,  M  = 1e6,  G  = 1e9,  T  = 1e12, P  = 1e15, E  = 1e18,
    Ki = 2^10, Mi = 2^20, Gi = 2^30, Ti = 2^40, Pi = 2^50, Ei = 2^60
  )
  vapply(x, function(s) {
    if (is.na(s) || !nzchar(s)) return(NA_real_)
    m <- regmatches(s, regexec("^([0-9.eE+-]+)([a-zA-Z]*)$", s))[[1]]
    if (length(m) != 3) stop("Invalid quantity: ", s)
    num <- as.numeric(m[2]); suf <- m[3]
    mult <- if (!nzchar(suf)) 1
            else if (suf %in% names(suffixes)) suffixes[[suf]]
            else stop("Unknown quantity suffix: ", suf)
    num * mult
  }, numeric(1), USE.NAMES = FALSE)
}
