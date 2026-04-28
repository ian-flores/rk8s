# Helpers for the OpenAPI -> R generator.

# -----------------------------------------------------------------------------
# Naming
# -----------------------------------------------------------------------------

# Kubernetes swagger uses fully-qualified Java-style names like
# "io.k8s.api.core.v1.Pod" or "io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta".
# The Python client flattens these to "V1Pod" / "V1ObjectMeta". We do the same,
# and disambiguate collisions by keeping a short group hint.
#
# Returns a named character vector: fq_name -> short_name.
build_name_map <- function(defs) {
  short_names <- vapply(names(defs), short_name_for, character(1))
  collisions <- names(which(table(short_names) > 1))
  if (length(collisions) > 0) {
    for (c in collisions) {
      idx <- which(short_names == c)
      for (i in idx) {
        short_names[i] <- disambiguated_name(names(defs)[i])
      }
    }
  }
  setNames(as.list(short_names), names(defs))
}

short_name_for <- function(fq) {
  parts <- strsplit(fq, ".", fixed = TRUE)[[1]]
  n <- length(parts)
  if (n < 2) return(pascal(fq))
  kind <- parts[n]
  version_candidate <- parts[n - 1]
  # Version is like "v1", "v1beta1", "v1alpha1"
  if (grepl("^v[0-9]+", version_candidate)) {
    paste0(pascal(version_candidate), pascal(kind))
  } else {
    pascal(kind)
  }
}

disambiguated_name <- function(fq) {
  parts <- strsplit(fq, ".", fixed = TRUE)[[1]]
  n <- length(parts)
  kind <- parts[n]
  version <- parts[n - 1]
  # Use the immediate group for disambiguation. E.g.
  # io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta -> MetaV1ObjectMeta
  group <- parts[n - 2]
  paste0(pascal(group), pascal(version), pascal(kind))
}

pascal <- function(s) {
  s <- gsub("[^A-Za-z0-9]", " ", s)
  parts <- strsplit(trimws(s), "\\s+")[[1]]
  paste0(toupper(substr(parts, 1, 1)), substr(parts, 2, nchar(parts)), collapse = "")
}

# Make a free-text OpenAPI description safe as Rd/roxygen body:
# strip `[...]` bracket patterns (markdown link syntax that roxygen interprets
# as cross-references to R objects), %-characters (start Rd comments), and
# backticks near already-escaped content.
sanitize_doc <- function(s) {
  s <- gsub("\\[([^]]*)\\]", "\\1", s)   # drop [...] (both markdown links
                                          # and Rd would misread those)
  s <- gsub("%", "percent", s, fixed = TRUE)  # % starts Rd comments
  s
}

snake <- function(s) {
  # "listCoreV1NamespacedPod" -> "list_core_v1_namespaced_pod"
  # Also normalizes JSON-schema meta keys ($ref -> _ref) and x-kubernetes-*
  # keys to valid R identifiers while preserving the original JSON key on the
  # wire (callers retain the original key when emitting to_list / from_list).
  s <- gsub("([a-z0-9])([A-Z])", "\\1_\\2", s)
  s <- gsub("([A-Z]+)([A-Z][a-z])", "\\1_\\2", s)
  s <- gsub("[^A-Za-z0-9]", "_", s)
  s <- gsub("_+", "_", s)
  tolower(s)
}

api_class_name <- function(tag) {
  # "core_v1" -> "CoreV1Api"; "apiextensions_apiserver_v1" -> "ApiextensionsApiserverV1Api"
  paste0(pascal(tag), "Api")
}

# -----------------------------------------------------------------------------
# Type rendering
# -----------------------------------------------------------------------------

# Resolve a $ref to a short type name.
ref_to_short <- function(ref, name_map) {
  fq <- sub("^#/definitions/", "", ref)
  out <- name_map[[fq]]
  if (is.null(out)) stop("Unknown $ref: ", ref)
  out
}

# Given an OpenAPI schema, return list(kind, type_name, item_name).
#   kind: "primitive" | "model" | "array" | "map"
#   type_name: for primitives, an R-friendly label (character/integer/etc.)
#              for models, the short R6 class name
#   item_name: element type name for arrays/maps (same shape recursively)
resolve_schema <- function(schema, name_map) {
  if (!is.null(schema[["$ref"]])) {
    return(list(kind = "model", type_name = ref_to_short(schema[["$ref"]], name_map)))
  }
  t <- schema$type
  if (is.null(t)) return(list(kind = "primitive", type_name = "any"))
  if (t == "array") {
    return(list(kind = "array",
                item = resolve_schema(schema$items, name_map)))
  }
  if (t == "object" && !is.null(schema$additionalProperties)) {
    return(list(kind = "map",
                item = resolve_schema(schema$additionalProperties, name_map)))
  }
  list(kind = "primitive", type_name = t)
}

# -----------------------------------------------------------------------------
# Model class emission
# -----------------------------------------------------------------------------

emit_model <- function(cls, def, name_map) {
  props <- def$properties %||% list()
  required <- unlist(def$required %||% list(), use.names = FALSE)
  field_names <- names(props)
  r_names <- vapply(field_names, snake, character(1))

  # Scalar / unstructured leaf types (no properties): emit a thin wrapper that
  # holds an arbitrary value and round-trips it as-is. Covers IntOrString,
  # Quantity, Time, MicroTime, FieldsV1, RawExtension, JSON, Patch, the various
  # JSONSchemaPropsOr* union types, etc.
  if (length(field_names) == 0) {
    return(c(
      "# Generated by tools/gen/generate.R -- do not edit by hand.",
      "",
      paste0("#' ", cls),  # title (first non-blank #' line)
      "#'",
      if (!is.null(def$description) && nzchar(def$description))
        paste("#'", strsplit(sanitize_doc(def$description), "\n")[[1]]) else "#' (no description)",
      paste0("#' @name ", cls),
      paste0("#' @noMd"),
      paste0("#' @export"),
      paste0(cls, " <- R6::R6Class("),
      paste0("  \"", cls, "\","),
      "  public = list(",
      "    #' @field value Underlying scalar / unstructured value.",
      "    value = NULL,",
      "    #' @description Construct.",
      "    #' @param value The underlying value.",
      "    initialize = function(value = NULL) { self$value <- value },",
      "    #' @description Return the underlying value (no key wrapping).",
      "    to_list = function() self$value",
      "  )",
      ")",
      "",
      paste0(cls, "$from_list <- function(x) ", cls, "$new(value = x)"),
      ""
    ))
  }

  lines <- c(
    "# Generated by tools/gen/generate.R -- do not edit by hand.",
    "",
    paste0("#' ", cls),  # title (first non-blank #' line)
    "#'",
    if (!is.null(def$description) && nzchar(def$description))
      paste("#'", strsplit(sanitize_doc(def$description), "\n")[[1]]) else "#' (no description)",
    paste0("#' @name ", cls),
    paste0("#' @noMd"),
    paste0("#' @export"),
    paste0(cls, " <- R6::R6Class("),
    paste0("  \"", cls, "\","),
    "  public = list("
  )

  # Field declarations (backtick-quoted: field names may be non-identifiers
  # after mangling, e.g. "_ref" from "$ref" or digit-leading keys).
  q_names <- paste0("`", r_names, "`")
  field_lines <- paste0("    ", q_names, " = NULL")
  field_lines[-length(field_lines)] <- paste0(field_lines[-length(field_lines)], ",")
  if (length(field_lines) == 0) field_lines <- character()

  # initialize()
  init_args <- if (length(r_names)) paste(q_names, "= NULL", collapse = ", ") else ""
  init_body <- if (length(r_names)) paste0("      self$", q_names, " <- ", q_names) else character()

  # to_list() — emit JSON-key-preserving list
  to_list_body <- vapply(seq_along(field_names), function(i) {
    key <- field_names[i]; r <- r_names[i]
    info <- resolve_schema(props[[key]], name_map)
    render_to_list_line(key, r, info)
  }, character(1))
  if (length(to_list_body) == 0) to_list_body <- character()

  lines <- c(lines,
    field_lines,
    if (length(field_lines) > 0) "    ," else NULL,
    "    #' @description Construct.",
    paste0("    initialize = function(", init_args, ") {"),
    init_body,
    "    },",
    "",
    "    #' @description Convert to a plain named list (JSON keys).",
    "    to_list = function() {",
    "      out <- list()",
    to_list_body,
    "      drop_nulls_deep(out)",
    "    }",
    "  )",
    ")",
    "",
    paste0(cls, "$from_list <- function(x) {"),
    if (length(field_names) == 0) "  NULL" else emit_from_list_body(cls, field_names, r_names, props, name_map),
    "}",
    ""
  )

  # Required validator — emitted only when there are required fields. Kept
  # runtime-opt-in: callers invoke $validate() explicitly.
  if (length(required)) {
    lines <- c(lines,
      paste0(cls, "$required_fields <- c(",
             paste0("\"", required, "\"", collapse = ", "), ")"),
      "")
  }
  lines
}

render_to_list_line <- function(json_key, r_name, info) {
  v <- paste0("self$`", r_name, "`")
  expr <- switch(info$kind,
    "primitive" = v,
    "model" = sprintf("if (!is.null(%s)) %s$to_list() else NULL", v, v),
    "array" = {
      item <- info$item
      if (item$kind == "model") {
        sprintf("if (!is.null(%s)) lapply(%s, function(.x) if (is.null(.x)) NULL else .x$to_list()) else NULL", v, v)
      } else {
        v
      }
    },
    "map" = {
      item <- info$item
      if (item$kind == "model") {
        sprintf("if (!is.null(%s)) lapply(%s, function(.x) if (is.null(.x)) NULL else .x$to_list()) else NULL", v, v)
      } else {
        v
      }
    }
  )
  sprintf("      out[[\"%s\"]] <- %s", json_key, expr)
}

emit_from_list_body <- function(cls, field_names, r_names, props, name_map) {
  lines <- character()
  ctor_args <- character()
  for (i in seq_along(field_names)) {
    key <- field_names[i]; r <- r_names[i]
    info <- resolve_schema(props[[key]], name_map)
    expr <- switch(info$kind,
      "primitive" = sprintf("x[[\"%s\"]]", key),
      "model" = sprintf("if (is.null(x[[\"%s\"]])) NULL else %s$from_list(x[[\"%s\"]])",
                        key, info$type_name, key),
      "array" = {
        item <- info$item
        if (item$kind == "model") {
          sprintf("if (is.null(x[[\"%s\"]])) NULL else lapply(x[[\"%s\"]], %s$from_list)",
                  key, key, item$type_name)
        } else {
          sprintf("x[[\"%s\"]]", key)
        }
      },
      "map" = {
        item <- info$item
        if (item$kind == "model") {
          sprintf("if (is.null(x[[\"%s\"]])) NULL else lapply(x[[\"%s\"]], %s$from_list)",
                  key, key, item$type_name)
        } else {
          sprintf("x[[\"%s\"]]", key)
        }
      }
    )
    ctor_args <- c(ctor_args, sprintf("    `%s` = %s", r, expr))
  }
  ctor_args[-length(ctor_args)] <- paste0(ctor_args[-length(ctor_args)], ",")
  c(paste0("  ", cls, "$new("), ctor_args, "  )")
}

# -----------------------------------------------------------------------------
# API class emission
# -----------------------------------------------------------------------------

# Resolve `{"$ref": "#/parameters/<key>"}` entries in every path-level and
# operation-level `parameters` list against the top-level `spec.parameters`
# table. Returns the same `paths` structure with refs replaced by their full
# parameter objects.
resolve_param_refs <- function(paths, registry) {
  resolve_one <- function(p) {
    if (!is.null(p[["$ref"]])) {
      key <- sub("^#/parameters/", "", p[["$ref"]])
      r <- registry[[key]]
      if (is.null(r)) {
        warning("Unknown parameter ref: ", p[["$ref"]], call. = FALSE)
        return(p)
      }
      return(r)
    }
    p
  }
  resolve_list <- function(plist) lapply(plist %||% list(), resolve_one)
  for (path_name in names(paths)) {
    item <- paths[[path_name]]
    if (!is.null(item$parameters)) {
      paths[[path_name]]$parameters <- resolve_list(item$parameters)
    }
    for (m in c("get", "post", "put", "patch", "delete", "options", "head")) {
      if (!is.null(item[[m]]) && !is.null(item[[m]]$parameters)) {
        paths[[path_name]][[m]]$parameters <- resolve_list(item[[m]]$parameters)
      }
    }
  }
  paths
}

group_operations_by_tag <- function(paths) {
  out <- list()
  for (p in names(paths)) {
    path_item <- paths[[p]]
    # Path-level parameters (applied to every op under this path)
    path_params <- path_item$parameters %||% list()
    for (method in c("get", "post", "put", "patch", "delete", "options", "head")) {
      op <- path_item[[method]]
      if (is.null(op)) next
      tags <- op$tags %||% list("default")
      tag <- tags[[1]]
      out[[tag]] <- c(out[[tag]], list(list(
        path = p, method = method, op = op,
        path_params = path_params
      )))
    }
  }
  out
}

emit_api <- function(cls, ops, name_map) {
  method_lines <- list()
  for (o in ops) {
    method_lines[[length(method_lines) + 1]] <- emit_operation(cls, o, name_map)
  }
  body <- unlist(interleave_commas(method_lines), use.names = FALSE)

  c(
    "# Generated by tools/gen/generate.R -- do not edit by hand.",
    "",
    paste0("#' ", cls),
    "#'",
    paste0("#' Typed Kubernetes API client for the `", sub("Api$", "", cls),
           "` surface. See generated methods for available operations."),
    paste0("#' @name ", cls),
    paste0("#' @noMd"),
    paste0("#' @export"),
    paste0(cls, " <- R6::R6Class("),
    paste0("  \"", cls, "\","),
    "  public = list(",
    "    #' @field api_client The backing [ApiClient].",
    "    api_client = NULL,",
    "    #' @description",
    "    #' @param api_client An [ApiClient].",
    "    initialize = function(api_client = ApiClient$new()) {",
    "      self$api_client <- api_client",
    "    }",
    if (length(body)) "    ," else NULL,
    body,
    "  )",
    ")",
    ""
  )
}

# Intersperse a top-level comma between method blocks (R6 public = list() wants
# commas between entries). Each `blocks[[i]]` is a character vector of method
# source lines without a trailing comma.
interleave_commas <- function(blocks) {
  if (length(blocks) == 0) return(list())
  out <- vector("list", 2 * length(blocks) - 1)
  for (i in seq_along(blocks)) {
    out[[2 * i - 1]] <- blocks[[i]]
    if (i < length(blocks)) out[[2 * i]] <- "    ,"
  }
  out
}

emit_operation <- function(cls, o, name_map) {
  op <- o$op
  op_id <- op$operationId %||% paste0(o$method, "_", gsub("[^A-Za-z0-9]+", "_", o$path))
  method_name <- operation_method_name(op_id, cls)
  all_params <- c(o$path_params, op$parameters %||% list())

  path_params  <- Filter(function(p) identical(p[["in"]], "path"),  all_params)
  query_params <- Filter(function(p) identical(p[["in"]], "query"), all_params)
  body_param   <- Filter(function(p) identical(p[["in"]], "body"),  all_params)
  header_params <- Filter(function(p) identical(p[["in"]], "header"), all_params)

  # Build R arg list: required path params first (no default), then body (if
  # required), then remaining with defaults. Mirror Python client ordering.
  r_path <- vapply(path_params, function(p) snake(p$name), character(1))
  r_query <- vapply(query_params, function(p) snake(p$name), character(1))
  r_header <- vapply(header_params, function(p) snake(p$name), character(1))
  has_body <- length(body_param) > 0
  r_body <- if (has_body) snake(body_param[[1]]$name) else character()
  body_required <- has_body && isTRUE(body_param[[1]]$required)

  # PATCH: expose `content_type` so callers can pick between strategic-merge
  # (default), JSON-merge, RFC 6902 JSON Patch, or apply-patch (server-side
  # apply). The default is always the first `consumes` value from the spec,
  # which matches the historical hard-coded behaviour.
  is_patch <- identical(o$method, "patch")
  consumes <- unlist(op$consumes %||% list("application/json"))
  default_content_type <- consumes[1]

  # A few k8s ops have a same-named param in two different `in:` locations
  # (notably /pods/{name}/proxy/{path} which has `path` as a path param AND
  # `path` as a query param). Disambiguate query/header collisions with a
  # `_query` / `_header` suffix; remember the renames so the call_api list
  # still carries the original JSON key.
  query_orig <- vapply(query_params, function(p) p$name, character(1))
  header_orig <- vapply(header_params, function(p) p$name, character(1))
  taken <- r_path
  for (i in seq_along(r_query)) {
    if (r_query[i] %in% taken) r_query[i] <- paste0(r_query[i], "_query")
    taken <- c(taken, r_query[i])
  }
  for (i in seq_along(r_header)) {
    if (r_header[i] %in% taken) r_header[i] <- paste0(r_header[i], "_header")
    taken <- c(taken, r_header[i])
  }
  if (has_body && r_body %in% taken) r_body <- paste0(r_body, "_body")

  arg_defs <- c(
    r_path,
    if (has_body && body_required) r_body,
    if (length(r_query)) paste0(r_query, " = NULL"),
    if (length(r_header)) paste0(r_header, " = NULL"),
    if (has_body && !body_required) paste0(r_body, " = NULL"),
    if (is_patch) sprintf("content_type = \"%s\"", default_content_type)
  )
  arg_str <- paste(arg_defs, collapse = ", ")

  # Determine response deserialization target
  ok <- op$responses[["200"]] %||% op$responses[["201"]] %||% op$responses[["202"]]
  resp_type <- "NULL"
  if (!is.null(ok) && !is.null(ok$schema)) {
    info <- resolve_schema(ok$schema, name_map)
    if (info$kind == "model") resp_type <- paste0("\"", info$type_name, "\"")
  }

  # Path/query/header param lists keep the original JSON names as keys but
  # bind the (possibly suffix-disambiguated) R variable names as values.
  path_list <- if (length(r_path)) paste0(
    "list(", paste(sprintf("`%s` = %s", sapply(path_params, `[[`, "name"), r_path), collapse = ", "),
    ")") else "list()"
  query_list <- if (length(r_query)) paste0(
    "list(", paste(sprintf("`%s` = %s", query_orig, r_query), collapse = ", "),
    ")") else "list()"
  header_list <- if (length(r_header)) paste0(
    "list(", paste(sprintf("`%s` = %s", header_orig, r_header), collapse = ", "),
    ")") else "list()"
  body_expr <- if (has_body)
    sprintf("if (inherits(%s, \"R6\")) %s$to_list() else %s", r_body, r_body, r_body)
  else "NULL"

  produces <- unlist(op$produces %||% list("application/json"))
  # For PATCH the content_type comes from the function argument (defaulted
  # above); for everything else it's fixed from the spec.
  content_type_expr <- if (is_patch) "content_type"
                       else paste0("\"", default_content_type, "\"")
  accept <- produces[1]

  doc <- c(
    paste0("    #' ", op$summary %||% op_id),
    if (!is.null(op$description) && nzchar(op$description))
      paste0("    #' ", strsplit(op$description, "\n")[[1]]) else NULL,
    if (length(arg_defs)) paste0("    #' @param ", arg_defs) else NULL
  )
  c(
    doc,
    paste0("    ", method_name, " = function(", arg_str, ") {"),
    "      self$api_client$call_api(",
    paste0("        resource_path = \"", o$path, "\","),
    paste0("        method = \"", toupper(o$method), "\","),
    paste0("        path_params = ", path_list, ","),
    paste0("        query_params = ", query_list, ","),
    paste0("        header_params = ", header_list, ","),
    paste0("        body = ", body_expr, ","),
    paste0("        response_type = ", resp_type, ","),
    paste0("        content_type = ", content_type_expr, ","),
    paste0("        accept = \"", accept, "\""),
    "      )",
    "    }"
  )
}

operation_method_name <- function(op_id, cls) {
  # K8s operationIds are <verb><ClassPrefix><Rest> — e.g.
  # listCoreV1NamespacedPod on CoreV1Api becomes list_namespaced_pod.
  # Strip the class prefix from the camelCase form, then snake_case.
  prefix <- sub("Api$", "", cls)
  verbs <- c("list", "create", "read", "delete", "patch", "replace",
             "watch", "connect", "deletecollection", "proxy", "get",
             "log", "logFile", "logFileList")
  m <- regmatches(op_id, regexec(
    sprintf("^(%s)(.*?)(.*)$", paste(verbs, collapse = "|")), op_id))[[1]]
  if (length(m) == 4) {
    verb <- m[2]; rest <- paste0(m[3], m[4])
    if (startsWith(rest, prefix)) rest <- substr(rest, nchar(prefix) + 1, nchar(rest))
    return(snake(paste0(verb, rest)))
  }
  snake(op_id)
}

# -----------------------------------------------------------------------------
# NAMESPACE update
# -----------------------------------------------------------------------------

update_namespace <- function(path, exports) {
  lines <- readLines(path, warn = FALSE)
  sentinel <- "# >>> generated exports (managed by tools/gen/generate.R) >>>"
  end_sent <- "# <<< generated exports <<<"
  before <- lines
  start <- match(sentinel, lines, nomatch = 0L)
  end   <- match(end_sent, lines, nomatch = 0L)
  if (start > 0 && end > 0 && end > start) {
    before <- lines[seq_len(start - 1)]
    after  <- lines[seq_len(length(lines) - end) + end]
  } else {
    after <- character()
  }
  writeLines(c(
    before,
    sentinel,
    paste0("export(", sort(unique(exports)), ")"),
    end_sent,
    after
  ), path)
}
