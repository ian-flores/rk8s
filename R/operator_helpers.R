# Helpers that controllers need on almost every reconcile: status updates,
# owner references, finalizers and events.

#' Update an object's status
#'
#' Sends a JSON merge patch of `list(status = status)` to the object's
#' `/status` subresource. Only the fields you pass change; set a field to
#' `NA` to remove it. Custom resources need `subresources: {status: {}}` in
#' their CRD for this endpoint to exist; without it, status is part of the
#' main object and is written with [kube_apply()].
#'
#' @param k A [Kube] session.
#' @param obj The object, as returned by [kube_get()] (needs `apiVersion`,
#'   `kind` and `metadata$name`).
#' @param status A list of status fields.
#' @return The updated object.
#' @examples
#' \dontrun{
#' site <- kube_get(k, "example.com/v1:Site", "blog")
#' kube_patch_status(k, site, list(ready = TRUE, url = "https://blog.example"))
#' }
#' @export
kube_patch_status <- function(k, obj, status) {
  k$client$call_api(
    resource_path = paste0(object_item_path(k, obj), "/status"),
    method = "PATCH",
    body = list(status = status),
    content_type = "application/merge-patch+json",
    accept = "application/json"
  )
}

#' Make one object the controller owner of another
#'
#' Adds an `ownerReferences` entry to `obj` pointing at `owner`, with
#' `controller: true`. Kubernetes then deletes `obj` when `owner` is deleted,
#' and a [Manager] controller that `owns` `obj`'s kind reconciles `owner`
#' whenever `obj` changes. Use it on objects before you [kube_apply()] them.
#'
#' Owner references cannot cross namespaces, so if `obj` has no namespace
#' it gets the owner's.
#'
#' @param obj The object to own (a manifest list).
#' @param owner The owning object, as returned by [kube_get()]; it needs
#'   `metadata$uid`.
#' @param controller Mark the owner as the controller (only one owner can
#'   be).
#' @param block_owner_deletion With foreground deletion, keep the owner
#'   until this object is gone.
#' @return `obj` with the owner reference added (an existing reference to
#'   the same owner is replaced).
#' @examples
#' owner <- list(apiVersion = "example.com/v1", kind = "Site",
#'               metadata = list(name = "blog", namespace = "web", uid = "1234"))
#' cm <- list(apiVersion = "v1", kind = "ConfigMap",
#'            metadata = list(name = "blog-config"))
#' set_owner(cm, owner)$metadata$ownerReferences
#' @export
set_owner <- function(obj, owner, controller = TRUE, block_owner_deletion = TRUE) {
  uid <- owner$metadata$uid
  if (is.null(uid) || !nzchar(uid)) {
    stop("set_owner(): `owner` has no metadata$uid; pass the object as ",
         "returned by kube_get(), not a manifest", call. = FALSE)
  }
  ref <- list(apiVersion = owner$apiVersion, kind = owner$kind,
              name = owner$metadata$name, uid = uid,
              controller = isTRUE(controller),
              blockOwnerDeletion = isTRUE(block_owner_deletion))
  refs <- Filter(function(r) !identical(r$uid, uid),
                 obj$metadata$ownerReferences %||% list())
  if (isTRUE(controller) &&
      any(vapply(refs, function(r) isTRUE(r$controller), logical(1)))) {
    stop("set_owner(): `obj` already has a different controller owner",
         call. = FALSE)
  }
  obj$metadata$ownerReferences <- c(refs, list(ref))
  owner_ns <- owner$metadata$namespace
  if (is.null(obj$metadata$namespace) && !is.null(owner_ns)) {
    obj$metadata$namespace <- owner_ns
  }
  obj
}

#' Finalizers
#'
#' A finalizer keeps a deleted object around (with
#' `metadata$deletionTimestamp` set) until your controller has cleaned up
#' whatever lives outside the cluster, then removes the finalizer so the
#' deletion completes. The usual reconcile is:
#'
#' * if `is_deleting(obj)`: clean up, then `remove_finalizer()`;
#' * otherwise: `add_finalizer()` (a no-op once present), then do the
#'   normal work.
#'
#' `add_finalizer()` and `remove_finalizer()` patch the object with its
#' `resourceVersion`, so they fail with a 409 Conflict if it changed since
#' you read it; the [Manager] retries the reconcile with fresh data.
#'
#' @param obj The object, as returned by [kube_get()].
#' @param finalizer A finalizer name, conventionally a domain-qualified
#'   string such as `"example.com/cleanup"`.
#' @param k A [Kube] session.
#' @return `has_finalizer()` and `is_deleting()` return `TRUE`/`FALSE`;
#'   `add_finalizer()` and `remove_finalizer()` return the updated object
#'   (or `obj` unchanged if there was nothing to do).
#' @name finalizers
NULL

#' @rdname finalizers
#' @export
has_finalizer <- function(obj, finalizer) {
  finalizer %in% unlist(obj$metadata$finalizers)
}

#' @rdname finalizers
#' @export
is_deleting <- function(obj) !is.null(obj$metadata$deletionTimestamp)

#' @rdname finalizers
#' @export
add_finalizer <- function(k, obj, finalizer) {
  if (has_finalizer(obj, finalizer)) return(invisible(obj))
  set_finalizers(k, obj, c(unlist(obj$metadata$finalizers), finalizer))
}

#' @rdname finalizers
#' @export
remove_finalizer <- function(k, obj, finalizer) {
  if (!has_finalizer(obj, finalizer)) return(invisible(obj))
  fins <- unlist(obj$metadata$finalizers)
  set_finalizers(k, obj, fins[fins != finalizer])
}

set_finalizers <- function(k, obj, finalizers) {
  meta <- list(finalizers = as.list(finalizers))
  # Include the resourceVersion so the patch fails (409) instead of
  # overwriting a list someone else changed since we read it.
  if (!is.null(obj$metadata$resourceVersion)) {
    meta$resourceVersion <- obj$metadata$resourceVersion
  }
  k$client$call_api(
    resource_path = object_item_path(k, obj),
    method = "PATCH",
    body = list(metadata = meta),
    content_type = "application/merge-patch+json",
    accept = "application/json"
  )
}

#' Record an event about an object
#'
#' Creates a core/v1 Event, which `kubectl describe` and
#' `kubectl get events` show next to the object. Use it to say what the
#' controller did or why it could not.
#'
#' @param k A [Kube] session.
#' @param obj The object the event is about, as returned by [kube_get()].
#' @param reason A short CamelCase reason, e.g. `"Created"`, `"Failed"`.
#' @param message A human-readable sentence.
#' @param type `"Normal"` or `"Warning"`.
#' @param component Who is reporting (default: the session's field manager).
#' @return The created Event.
#' @examples
#' \dontrun{
#' kube_event(k, site, "Deployed", "Deployment blog is ready")
#' kube_event(k, site, "InvalidSpec", "spec.replicas must be positive",
#'            type = "Warning")
#' }
#' @export
kube_event <- function(k, obj, reason, message, type = c("Normal", "Warning"),
                       component = k$field_manager %||% "rk8s") {
  type <- match.arg(type)
  meta <- obj$metadata
  ns <- meta$namespace %||% "default"
  now <- format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
  event <- list(
    apiVersion = "v1", kind = "Event",
    metadata = list(generateName = paste0(meta$name, "."), namespace = ns),
    involvedObject = drop_nulls(list(
      apiVersion = obj$apiVersion, kind = obj$kind, name = meta$name,
      namespace = meta$namespace, uid = meta$uid,
      resourceVersion = meta$resourceVersion)),
    reason = reason, message = message, type = type,
    source = list(component = component),
    reportingComponent = component,
    reportingInstance = Sys.info()[["nodename"]],
    firstTimestamp = now, lastTimestamp = now, count = 1L
  )
  k$client$call_api(sprintf("/api/v1/namespaces/%s/events", ns), "POST",
                    body = event, accept = "application/json")
}

# Item URL of an object, resolved through discovery from its apiVersion and
# kind.
object_item_path <- function(k, obj) {
  if (is.null(obj$apiVersion) || is.null(obj$kind) || is.null(obj$metadata$name)) {
    stop("object needs apiVersion, kind and metadata$name", call. = FALSE)
  }
  info <- k$dynamic$resource(api_version = obj$apiVersion, kind = obj$kind)$info
  if (isTRUE(info$namespaced)) {
    ns <- obj$metadata$namespace %||% k$namespace
    sprintf("%s/namespaces/%s/%s/%s", info$base_path, ns, info$name, obj$metadata$name)
  } else {
    sprintf("%s/%s/%s", info$base_path, info$name, obj$metadata$name)
  }
}
