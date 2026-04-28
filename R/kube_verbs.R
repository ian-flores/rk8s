#' Get one or many Kubernetes resources
#'
#' If `name` is given (or embedded in `ref` as `"kind/name"`), returns a
#' single object. Otherwise lists the collection.
#'
#' @param k A [Kube] session.
#' @param ref Resource ref — kind alias (`"pods"`), `"kind/name"`, or
#'   explicit `"apiVersion:Kind"` / `c(apiVersion, Kind)`.
#' @param name Optional resource name (overrides any name in `ref`).
#' @param namespace Namespace (defaults to `k$namespace`).
#' @param label_selector,field_selector Optional selectors for list calls.
#' @param ... Extra query parameters passed through to the API.
#' @return A list (one object when fetching by name; a `*List` envelope
#'   otherwise) carrying the server response. Wrap with [as.data.frame()]
#'   or `tibble::as_tibble()` for tabular display.
#' @examples
#' \dontrun{
#' k <- kube()
#' kube_get(k, "pods", namespace = "default")
#' kube_get(k, "pod", "nginx-abc", namespace = "default")
#' kube_get(k, "deployment/nginx", namespace = "default")
#' kube_get(k, "apps/v1:Deployment", namespace = "default")
#' }
#' @export
kube_get <- function(k, ref, name = NULL, namespace = k$namespace,
                      label_selector = NULL, field_selector = NULL, ...) {
  rn <- k$resource_and_name(ref)
  res <- rn$resource
  nm  <- name %||% rn$name
  ns  <- if (isTRUE(res$info$namespaced)) namespace else NULL
  if (!is.null(nm)) {
    out <- res$get(name = nm, namespace = ns)
    structure(out, class = c("rk8s_object", class(out)))
  } else {
    out <- res$list(namespace = ns,
                    label_selector = label_selector,
                    field_selector = field_selector, ...)
    structure(out, class = c("rk8s_list", class(out)))
  }
}

#' List a resource (always; never returns a single object)
#'
#' Convenience wrapper over [kube_get()] that ignores any embedded name in
#' `ref`.
#'
#' @inheritParams kube_get
#' @return A `*List` envelope.
#' @export
kube_list <- function(k, ref, namespace = k$namespace,
                       label_selector = NULL, field_selector = NULL, ...) {
  rn <- k$resource_and_name(ref)
  ns <- if (isTRUE(rn$resource$info$namespaced)) namespace else NULL
  out <- rn$resource$list(namespace = ns,
                           label_selector = label_selector,
                           field_selector = field_selector, ...)
  structure(out, class = c("rk8s_list", class(out)))
}

#' Server-side apply a manifest
#'
#' Accepts a YAML/JSON file path, a YAML/JSON string, an R `list`, or a
#' generated model (e.g. `V1Deployment`). Sends a PATCH with
#' `Content-Type: application/apply-patch+yaml`, which is k8s
#' "server-side apply". Multi-document YAML is supported.
#'
#' @param k A [Kube] session.
#' @param manifest Path, string, list, or model object.
#' @param namespace Default namespace for documents that don't specify one.
#' @param field_manager Field manager (defaults to `k$field_manager`).
#' @param force Resolve conflicts by overwriting other field managers.
#' @return Invisibly, a list of server responses (one per document).
#' @examples
#' \dontrun{
#' k <- kube()
#' kube_apply(k, "deployment.yaml")
#' kube_apply(k, list(
#'   apiVersion = "v1", kind = "ConfigMap",
#'   metadata = list(name = "demo"),
#'   data = list(hello = "world")
#' ))
#' }
#' @export
kube_apply <- function(k, manifest, namespace = k$namespace,
                        field_manager = k$field_manager, force = FALSE) {
  docs <- normalize_manifest(manifest)
  out <- lapply(docs, function(doc) {
    if (is.null(doc$apiVersion) || is.null(doc$kind) ||
          is.null(doc$metadata$name)) {
      stop("apply: every document needs apiVersion, kind, and metadata.name",
           call. = FALSE)
    }
    res <- k$dynamic$resource(api_version = doc$apiVersion, kind = doc$kind)
    ns <- if (isTRUE(res$info$namespaced))
      doc$metadata$namespace %||% namespace else NULL
    item_path <- if (!is.null(ns))
      sprintf("%s/namespaces/%s/%s/%s", res$info$base_path, ns, res$info$name,
              doc$metadata$name)
    else
      sprintf("%s/%s/%s", res$info$base_path, res$info$name, doc$metadata$name)

    q <- list(fieldManager = field_manager)
    if (isTRUE(force)) q$force <- "true"

    k$client$call_api(
      resource_path = item_path,
      method = "PATCH",
      query_params = q,
      body = doc,
      content_type = "application/apply-patch+yaml",
      accept = "application/json"
    )
  })
  invisible(out)
}

#' Delete a resource
#'
#' @inheritParams kube_get
#' @param grace_period Optional override for the default termination grace.
#' @param propagation_policy "Orphan", "Background", or "Foreground" (the
#'   default).
#' @return The server response.
#' @export
kube_delete <- function(k, ref, name = NULL, namespace = k$namespace,
                         grace_period = NULL, propagation_policy = NULL) {
  rn <- k$resource_and_name(ref)
  nm <- name %||% rn$name
  if (is.null(nm)) stop("kube_delete: a resource name is required", call. = FALSE)
  ns <- if (isTRUE(rn$resource$info$namespaced)) namespace else NULL
  body <- drop_nulls(list(
    apiVersion = "v1", kind = "DeleteOptions",
    gracePeriodSeconds = grace_period,
    propagationPolicy = propagation_policy
  ))
  rn$resource$delete(name = nm, namespace = ns,
                      body = if (length(body) > 2) body else NULL)
}

#' Scale a workload (Deployment, StatefulSet, ReplicaSet, ReplicationController)
#'
#' @inheritParams kube_get
#' @param replicas New replica count.
#' @return The updated `Scale` subresource response.
#' @export
kube_scale <- function(k, ref, name = NULL, replicas, namespace = k$namespace) {
  rn <- k$resource_and_name(ref)
  nm <- name %||% rn$name
  if (is.null(nm)) stop("kube_scale: a resource name is required", call. = FALSE)
  info <- rn$resource$info
  if (!isTRUE(info$namespaced)) {
    stop("kube_scale: resource '", info$name, "' is not namespaced; cannot scale",
         call. = FALSE)
  }
  scale_path <- sprintf("%s/namespaces/%s/%s/%s/scale",
                         info$base_path, namespace, info$name, nm)
  body <- list(spec = list(replicas = as.integer(replicas)))
  k$client$call_api(
    resource_path = scale_path,
    method = "PATCH",
    body = body,
    content_type = "application/merge-patch+json"
  )
}

#' Stream pod logs
#'
#' @param k A [Kube] session.
#' @param pod Pod name.
#' @param namespace Namespace.
#' @param container Optional container name (required for multi-container pods).
#' @param tail Optional integer; only the last N lines.
#' @param follow If `TRUE`, stream until the pod exits or the connection drops.
#' @param previous If `TRUE`, fetch logs from a previously-terminated container.
#' @param since_seconds Only return logs newer than this many seconds.
#' @return A character string with the log content (or invisible NULL when
#'   `follow=TRUE`, with content emitted via `cat()`).
#' @examples
#' \dontrun{
#' k <- kube()
#' cat(kube_logs(k, "nginx-abc", namespace = "default", tail = 50))
#' }
#' @export
kube_logs <- function(k, pod, namespace = k$namespace, container = NULL,
                       tail = NULL, follow = FALSE, previous = FALSE,
                       since_seconds = NULL) {
  q <- drop_nulls(list(
    container = container,
    tailLines = if (!is.null(tail)) as.integer(tail) else NULL,
    sinceSeconds = if (!is.null(since_seconds)) as.integer(since_seconds) else NULL,
    previous = if (isTRUE(previous)) "true" else NULL,
    follow = if (isTRUE(follow)) "true" else NULL
  ))
  path <- sprintf("/api/v1/namespaces/%s/pods/%s/log", namespace, pod)
  if (!isTRUE(follow)) {
    return(k$client$call_api(path, method = "GET", query_params = q,
                              accept = "text/plain", response_type = "text"))
  }
  # Streaming follow: pipe chunks to stdout. Use whichever httr2 streaming
  # API is available on the local install.
  req <- k$client$call_api(path, method = "GET", query_params = q,
                            accept = "text/plain", stream = TRUE)
  if (exists("req_perform_connection", envir = asNamespace("httr2"),
              inherits = FALSE)) {
    resp <- httr2::req_perform_connection(req)
    on.exit(try(close(resp), silent = TRUE), add = TRUE)
    repeat {
      chunk <- httr2::resp_stream_raw(resp, kb = 64)
      if (length(chunk) == 0) break
      cat(rawToChar(chunk))
    }
  } else {
    httr2::req_perform_stream(req, function(chunk) {
      cat(rawToChar(chunk)); TRUE
    }, buffer_kb = 64)
  }
  invisible(NULL)
}

#' Watch a resource
#'
#' @param k A [Kube] session.
#' @param ref Resource ref.
#' @param namespace Namespace (`NULL` for all-namespaces watch on namespaced
#'   resources, or for cluster-scoped resources).
#' @param on_event Callback `function(type, object)`. Return `FALSE` to stop.
#' @param label_selector,field_selector Optional selectors.
#' @param resource_version Starting resourceVersion.
#' @param timeout_seconds Wall-clock cap.
#' @return Invisibly, the underlying [Watch] object (so callers can `$stop()`).
#' @examples
#' \dontrun{
#' k <- kube()
#' kube_watch(k, "pods",
#'            on_event = function(type, obj) {
#'              message(type, " ", obj$metadata$name); TRUE
#'            },
#'            timeout_seconds = 30)
#' }
#' @export
kube_watch <- function(k, ref, on_event, namespace = k$namespace,
                        label_selector = NULL, field_selector = NULL,
                        resource_version = NULL, timeout_seconds = NULL) {
  rn <- k$resource_and_name(ref)
  info <- rn$resource$info
  if (isTRUE(info$namespaced) && !is.null(namespace)) {
    path <- sprintf("%s/namespaces/%s/%s", info$base_path, namespace, info$name)
  } else {
    path <- sprintf("%s/%s", info$base_path, info$name)
  }
  w <- Watch$new()
  w$stream(
    client = k$client,
    resource_path = path,
    query_params = drop_nulls(list(labelSelector = label_selector,
                                     fieldSelector = field_selector)),
    callback = on_event,
    timeout_seconds = timeout_seconds,
    resource_version = resource_version
  )
  invisible(w)
}

# --- internal -----------------------------------------------------------------

# Accept any of: file path, YAML/JSON string, list (single doc), list-of-lists
# (multi-doc), or an R6 model with $to_list(). Always return a list of
# named-list documents, NULL-stripped.
normalize_manifest <- function(manifest) {
  if (inherits(manifest, "R6") && is.function(manifest$to_list)) {
    return(list(manifest$to_list()))
  }
  if (is.list(manifest)) {
    # If it looks like {apiVersion, kind, metadata, ...} treat as one doc.
    if (!is.null(manifest$apiVersion) && !is.null(manifest$kind)) {
      return(list(manifest))
    }
    # Else assume list-of-docs.
    return(manifest)
  }
  if (is.character(manifest) && length(manifest) == 1) {
    text <- if (is_path(manifest))
      paste(readLines(manifest, warn = FALSE), collapse = "\n") else manifest
    parts <- split_yaml_docs(text)
    out <- lapply(parts, function(p) if (nzchar(trimws(p))) yaml::yaml.load(p) else NULL)
    return(Filter(Negate(is.null), out))
  }
  stop("kube_apply: don't know how to interpret `manifest` of class ",
       class(manifest)[1], call. = FALSE)
}

is_path <- function(s) {
  !grepl("\n", s, fixed = TRUE) && file.exists(s)
}

#' @export
print.rk8s_list <- function(x, ...) {
  cat(sprintf("<%s> %d items (resourceVersion=%s)\n",
              x$kind %||% "List",
              length(x$items %||% list()),
              x$metadata$resourceVersion %||% ""))
  if (length(x$items)) {
    df <- as.data.frame(x)
    print(df, row.names = FALSE)
  }
  invisible(x)
}

#' @export
print.rk8s_object <- function(x, ...) {
  cat(sprintf("<%s> %s/%s\n",
              x$kind %||% "Object",
              x$metadata$namespace %||% "-",
              x$metadata$name %||% "-"))
  utils::str(x, max.level = 2, give.attr = FALSE, no.list = TRUE)
  invisible(x)
}

#' @export
as.data.frame.rk8s_list <- function(x, ...) {
  items <- x$items %||% list()
  if (!length(items)) return(data.frame())
  rows <- lapply(items, function(it) {
    list(
      namespace = it$metadata$namespace %||% NA_character_,
      name      = it$metadata$name %||% NA_character_,
      kind      = it$kind %||% x$kind %||% NA_character_,
      age       = age_string(it$metadata$creationTimestamp),
      status    = first_status(it)
    )
  })
  do.call(rbind, lapply(rows, as.data.frame, stringsAsFactors = FALSE))
}

age_string <- function(ts) {
  if (is.null(ts) || !nzchar(ts)) return(NA_character_)
  t <- tryCatch(as.POSIXct(ts, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
                error = function(e) NA)
  if (is.na(t)) return(NA_character_)
  s <- as.numeric(difftime(Sys.time(), t, units = "secs"))
  if (s < 60)        sprintf("%ds", round(s))
  else if (s < 3600) sprintf("%dm", round(s / 60))
  else if (s < 86400) sprintf("%dh", round(s / 3600))
  else                sprintf("%dd", round(s / 86400))
}

# Best-effort one-line status: pod phase, deployment ready replicas, etc.
first_status <- function(it) {
  s <- it$status
  if (is.null(s)) return(NA_character_)
  if (!is.null(s$phase)) return(s$phase)
  if (!is.null(s$readyReplicas) || !is.null(s$replicas)) {
    return(sprintf("%s/%s",
                    s$readyReplicas %||% 0L, s$replicas %||% 0L))
  }
  if (!is.null(s$conditions) && length(s$conditions)) {
    last <- s$conditions[[length(s$conditions)]]
    return(sprintf("%s=%s", last$type, last$status))
  }
  NA_character_
}
