#' Shared Informer — local cache of a resource, kept in sync via watch
#'
#' An `Informer` performs an initial list of a resource, then watches for
#' subsequent changes and maintains a local cache keyed by
#' `namespace/name` (or just `name` for cluster-scoped resources). Event
#' handlers fire on add/update/delete.
#'
#' This is the R equivalent of client-go's `SharedIndexInformer`. Informers
#' are the canonical way to build controllers: one watch feeds many handlers
#' and many [Lister] views, without each consumer re-listing the API server.
#'
#' Lifecycle:
#' * `$run(stop_seconds = NULL)` — block, streaming events into the cache.
#'   Returns when `stop_seconds` elapses, the stream callback returns FALSE,
#'   or `$stop()` is called. Safe to re-invoke; the informer resumes from
#'   the last observed resourceVersion (or re-lists on 410 Gone).
#' * `$has_synced()` — `TRUE` once the initial list has been absorbed.
#' * `$lister()` — return a [Lister] view over the current cache snapshot.
#'
#' @examples
#' \dontrun{
#' client <- new_client_from_config()
#' inf <- Informer$new(
#'   client,
#'   resource_path = "/api/v1/namespaces/default/pods",
#'   object_from_list = V1Pod$from_list
#' )
#' inf$add_event_handler(
#'   on_add    = function(obj) message("add: ", obj$metadata$name),
#'   on_update = function(old, new) if (!identical(old$status, new$status))
#'                                    message("status change on ", new$metadata$name),
#'   on_delete = function(obj) message("gone: ", obj$metadata$name)
#' )
#' inf$run(stop_seconds = 30)
#' pods <- inf$lister()
#' pods$get("nginx")
#' pods$list()
#' }
#' @export
Informer <- R6::R6Class(
  "Informer",
  public = list(
    #' @field client The backing [ApiClient].
    client = NULL,
    #' @field resource_path Path template (no `{namespace}`/`{name}` unresolved).
    resource_path = NULL,
    #' @field object_from_list Optional constructor `function(list) -> R6`;
    #'   when supplied, cached objects are R6 instances. Otherwise raw lists.
    object_from_list = NULL,
    #' @field resource_version Last observed resourceVersion (used to resume).
    resource_version = NULL,

    #' @description Construct.
    #' @param client An [ApiClient].
    #' @param resource_path Collection path, e.g.
    #'   "/api/v1/namespaces/default/pods" or "/api/v1/pods" for all-namespaces.
    #' @param query_params Extra query parameters (e.g. `list(labelSelector = ...)`).
    #' @param object_from_list Optional `from_list` constructor.
    initialize = function(client, resource_path, query_params = list(),
                          object_from_list = NULL) {
      self$client <- client
      self$resource_path <- resource_path
      self$object_from_list <- object_from_list
      private$query_params <- query_params
      private$store <- new.env(parent = emptyenv())
      private$handlers <- list()
      private$watch <- NULL
      private$synced <- FALSE
    },

    #' @description Register event handlers.
    #' @param on_add Function `function(obj)` called for each added object.
    #' @param on_update Function `function(old, new)`.
    #' @param on_delete Function `function(obj)`.
    add_event_handler = function(on_add = NULL, on_update = NULL, on_delete = NULL) {
      private$handlers[[length(private$handlers) + 1]] <- list(
        on_add = on_add, on_update = on_update, on_delete = on_delete
      )
      invisible(self)
    },

    #' @description Run the informer: perform an initial list, notify `on_add`
    #'   for every item, then start a watch.
    #' @param stop_seconds Optional wall-clock limit. `NULL` runs forever
    #'   (until `$stop()` or the server hangs up).
    run = function(stop_seconds = NULL) {
      private$list_and_populate()
      private$synced <- TRUE

      deadline <- if (is.null(stop_seconds)) Inf else Sys.time() + stop_seconds
      private$watch <- Watch$new()
      private$watch$resource_version <- self$resource_version
      private$watch$stream(
        client = self$client,
        resource_path = self$resource_path,
        query_params = private$query_params,
        timeout_seconds = if (is.finite(deadline))
          max(1, as.integer(deadline - Sys.time())) else NULL,
        callback = function(type, obj) {
          private$handle_event(type, obj)
          if (Sys.time() >= deadline) FALSE else TRUE
        }
      )
      invisible(self)
    },

    #' @description Stop the running watch.
    stop = function() {
      if (!is.null(private$watch)) private$watch$stop()
      invisible(self)
    },

    #' @description Has the initial list completed?
    has_synced = function() isTRUE(private$synced),

    #' @description Return a [Lister] view over the current cache.
    lister = function() Lister$new(private$store),

    #' @description Return a list of all cached objects (snapshot).
    list = function() as.list(private$store)
  ),

  private = list(
    query_params = NULL,
    store = NULL,       # env: "namespace/name" -> object
    handlers = NULL,
    watch = NULL,
    synced = FALSE,

    key_for = function(obj) {
      meta <- if (is.null(obj$metadata)) list() else obj$metadata
      ns <- meta$namespace
      nm <- meta$name
      if (is.null(nm)) return(NA_character_)
      if (is.null(ns) || !nzchar(ns)) nm else paste0(ns, "/", nm)
    },

    wrap = function(raw) {
      if (is.null(self$object_from_list)) raw else self$object_from_list(raw)
    },

    list_and_populate = function() {
      q <- c(private$query_params, list())
      page <- self$client$call_api(
        resource_path = self$resource_path,
        method = "GET",
        query_params = q
      )
      self$resource_version <- page$metadata$resourceVersion
      items <- page$items %||% list()
      for (raw in items) {
        key <- private$key_for(raw)
        if (is.na(key)) next
        obj <- private$wrap(raw)
        assign(key, obj, envir = private$store)
        for (h in private$handlers) if (!is.null(h$on_add)) h$on_add(obj)
      }
    },

    handle_event = function(type, raw) {
      key <- private$key_for(raw)
      if (is.na(key)) return()
      new_obj <- private$wrap(raw)
      if (identical(type, "DELETED")) {
        old <- if (exists(key, envir = private$store, inherits = FALSE))
          get(key, envir = private$store, inherits = FALSE) else NULL
        if (exists(key, envir = private$store, inherits = FALSE)) {
          rm(list = key, envir = private$store)
        }
        for (h in private$handlers) if (!is.null(h$on_delete)) h$on_delete(old %||% new_obj)
      } else if (identical(type, "ADDED") ||
                   (identical(type, "MODIFIED") &&
                    !exists(key, envir = private$store, inherits = FALSE))) {
        assign(key, new_obj, envir = private$store)
        for (h in private$handlers) if (!is.null(h$on_add)) h$on_add(new_obj)
      } else if (identical(type, "MODIFIED")) {
        old <- get(key, envir = private$store, inherits = FALSE)
        assign(key, new_obj, envir = private$store)
        for (h in private$handlers) if (!is.null(h$on_update)) h$on_update(old, new_obj)
      }
      # BOOKMARK events only carry resourceVersion; nothing else to do.
    }
  )
)

#' Read-only indexed view over an Informer's cache
#'
#' A `Lister` is a cheap read-only wrapper over the cache an [Informer]
#' maintains. Use it in controllers to answer "does an object by this name
#' already exist?" without hitting the API server on every tick.
#'
#' Mirrors client-go's `Lister` / `NamespaceLister` interfaces.
#'
#' @export
Lister <- R6::R6Class(
  "Lister",
  public = list(
    #' @description Construct (usually via `Informer$lister()`).
    #' @param store An environment holding `namespace/name -> object`.
    initialize = function(store) {
      private$store <- store
    },

    #' @description All objects in the cache.
    list = function() unname(as.list(private$store)),

    #' @description Objects scoped to a namespace.
    #' @param namespace Namespace to filter on.
    namespace = function(namespace) {
      keys <- ls(envir = private$store)
      pref <- paste0(namespace, "/")
      unname(mget(keys[startsWith(keys, pref)], envir = private$store))
    },

    #' @description Fetch a single object by name.
    #' @param name Object name.
    #' @param namespace Optional namespace (for namespaced resources).
    get = function(name, namespace = NULL) {
      key <- if (is.null(namespace)) name else paste0(namespace, "/", name)
      if (!exists(key, envir = private$store, inherits = FALSE)) return(NULL)
      get(key, envir = private$store, inherits = FALSE)
    }
  ),

  private = list(store = NULL)
)
