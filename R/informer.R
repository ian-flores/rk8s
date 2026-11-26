#' Shared Informer - local cache of a resource, kept in sync via watch
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
#' * `$run(stop_seconds = NULL)` - block, streaming events into the cache.
#'   Returns when `stop_seconds` of wall-clock time elapse (whether or not
#'   events arrive) or `$stop()` is called from a handler. Safe to re-invoke;
#'   the informer resumes from the last observed resourceVersion.
#' * On 410 Gone (the watch fell too far behind), the informer re-lists and
#'   reconciles the cache against the fresh list: objects that disappeared
#'   fire `on_delete`, new ones `on_add`, and changed ones (different
#'   `resourceVersion`) `on_update`.
#' * Lists are fetched in pages of `page_size` items (`limit`/`continue`).
#' * `$has_synced()` - `TRUE` once the initial list has been absorbed.
#' * `$lister()` - return a [Lister] view over the current cache snapshot.
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
    #' @param page_size Items per list page (`limit`); `NULL` disables paging.
    initialize = function(client, resource_path, query_params = list(),
                          object_from_list = NULL, page_size = 500L) {
      self$client <- client
      private$page_size <- page_size
      private$versions <- new.env(parent = emptyenv())
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

    #' @description Run the informer: list (or resume), notify handlers, then
    #'   watch until `stop_seconds` elapse or `$stop()` is called.
    #' @param stop_seconds Optional wall-clock limit. `NULL` runs until
    #'   `$stop()` is called from an event handler.
    run = function(stop_seconds = NULL) {
      private$stopping <- FALSE
      deadline <- if (is.null(stop_seconds)) Inf
                  else as.numeric(Sys.time()) + as.numeric(stop_seconds)
      if (!private$synced || is.null(self$resource_version)) private$relist()

      repeat {
        if (private$stopping) break
        remaining <- deadline - as.numeric(Sys.time())
        if (remaining <= 0) break
        w <- Watch$new()
        private$watch <- w
        w$stream(
          client = self$client,
          resource_path = self$resource_path,
          query_params = c(private$query_params,
                           list(allowWatchBookmarks = "true")),
          timeout_seconds = if (is.finite(remaining)) remaining else NULL,
          resource_version = self$resource_version,
          return_on_gone = TRUE,
          callback = function(type, obj) {
            private$handle_event(type, obj)
            if (!is.null(w$resource_version)) {
              self$resource_version <- w$resource_version
            }
            !private$stopping && as.numeric(Sys.time()) < deadline
          }
        )
        if (identical(w$end_reason, "gone")) {
          # Our resourceVersion is too old; anything could have happened
          # while we were away. Re-list and reconcile.
          self$resource_version <- NULL
          private$relist()
          next
        }
        break
      }
      invisible(self)
    },

    #' @description Stop the running watch. Call from an event handler.
    stop = function() {
      private$stopping <- TRUE
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

    page_size = NULL,
    versions = NULL,   # env: key -> resourceVersion of the cached object
    stopping = FALSE,

    rv_of = function(raw) raw$metadata$resourceVersion %||% NA_character_,

    put = function(key, raw) {
      obj <- private$wrap(raw)
      assign(key, obj, envir = private$store)
      assign(key, private$rv_of(raw), envir = private$versions)
      obj
    },

    drop = function(key) {
      if (exists(key, envir = private$store, inherits = FALSE)) {
        rm(list = key, envir = private$store)
      }
      if (exists(key, envir = private$versions, inherits = FALSE)) {
        rm(list = key, envir = private$versions)
      }
    },

    fire = function(what, ...) {
      args <- list(...)
      for (h in private$handlers) if (!is.null(h[[what]])) do.call(h[[what]], args)
    },

    list_all = function() {
      items <- list()
      cont <- NULL
      repeat {
        q <- private$query_params
        if (!is.null(private$page_size)) q$limit <- as.integer(private$page_size)
        if (!is.null(cont)) q[["continue"]] <- cont
        page <- self$client$call_api(
          resource_path = self$resource_path,
          method = "GET",
          query_params = q
        )
        items <- c(items, page$items %||% list())
        cont <- page$metadata[["continue"]]
        if (is.null(cont) || !nzchar(cont)) {
          self$resource_version <- page$metadata$resourceVersion
          break
        }
      }
      items
    },

    # List everything and reconcile the cache against it. On the first call
    # this just populates; afterwards it emits add/update/delete for the diff.
    relist = function() {
      items <- private$list_all()
      seen <- character()
      for (raw in items) {
        key <- private$key_for(raw)
        if (is.na(key)) next
        seen <- c(seen, key)
        if (exists(key, envir = private$store, inherits = FALSE)) {
          old <- get(key, envir = private$store, inherits = FALSE)
          old_rv <- get(key, envir = private$versions, inherits = FALSE)
          if (!identical(old_rv, private$rv_of(raw))) {
            # Store first: `fire()` passes `...` lazily, so a side effect in
            # its arguments would be skipped when no handler is registered.
            new_obj <- private$put(key, raw)
            private$fire("on_update", old, new_obj)
          }
        } else {
          new_obj <- private$put(key, raw)
          private$fire("on_add", new_obj)
        }
      }
      for (key in setdiff(ls(private$store, all.names = TRUE), seen)) {
        old <- get(key, envir = private$store, inherits = FALSE)
        private$drop(key)
        private$fire("on_delete", old)
      }
      private$synced <- TRUE
    },

    handle_event = function(type, raw) {
      key <- private$key_for(raw)
      if (is.na(key)) return()
      known <- exists(key, envir = private$store, inherits = FALSE)
      old <- if (known) get(key, envir = private$store, inherits = FALSE) else NULL
      if (identical(type, "DELETED")) {
        private$drop(key)
        private$fire("on_delete", old %||% private$wrap(raw))
      } else if (identical(type, "ADDED") || identical(type, "MODIFIED")) {
        new_obj <- private$put(key, raw)
        if (known) private$fire("on_update", old, new_obj)
        else private$fire("on_add", new_obj)
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
