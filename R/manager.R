#' Run controllers: informers, a work queue and a reconcile function
#'
#' A `Manager` runs one or more controllers in a single R process. Each
#' controller watches a primary resource (and optionally the resources it
#' creates), turns every change into a key on a [WorkQueue], and calls your
#' `reconcile` function with that key. This is the same model as
#' controller-runtime in Go and kopf in Python, in one loop instead of
#' threads.
#'
#' `reconcile(req)` or `reconcile(req, k)` receives `req`, a list with
#' `key`, `namespace` and `name`, and (if it takes a second argument) the
#' [Kube] session. It should read the current state, make the cluster match
#' what the object asks for, and return:
#'
#' * `NULL` (or anything else): done until the next change.
#' * [requeue()]: try again soon, with per-key exponential backoff.
#' * [requeue_after()]`(seconds)`: look again after a delay (e.g. to poll
#'   something outside the cluster).
#'
#' An error is logged with [message()] and retried with backoff; it does not
#' stop the manager. Reconciles run one at a time, so keep them short.
#'
#' Changes to owned resources (`owns`) reconcile their owner: the object
#' named by an `ownerReferences` entry with `controller: true` whose kind
#' and API group match the primary resource.
#'
#' @examples
#' \dontrun{
#' k <- kube()
#' mgr <- Manager$new(k)
#' mgr$controller(
#'   "example.com/v1:Site",
#'   owns = "apps/v1:Deployment",
#'   reconcile = function(req, k) {
#'     site <- tryCatch(kube_get(k, "example.com/v1:Site", req$name,
#'                               namespace = req$namespace),
#'                      rk8s_api_error = function(e) NULL)
#'     if (is.null(site)) return(NULL)        # deleted; owned objects are GC'd
#'     # ... kube_apply() the Deployment it needs ...
#'     requeue_after(300)
#'   }
#' )
#' mgr$run(leader_election = "site-operator")
#' }
#' @export
Manager <- R6::R6Class(
  "Manager",
  public = list(
    #' @field kube The [Kube] session controllers use.
    kube = NULL,

    #' @description Create a manager.
    #' @param k A [Kube] session (from [kube()]).
    #' @param poll_interval Seconds to sleep between passes when idle.
    initialize = function(k, poll_interval = 0.05) {
      if (!inherits(k, "Kube")) stop("`k` must be a Kube session from kube()", call. = FALSE)
      self$kube <- k
      private$poll_interval <- poll_interval
      private$ctls <- list()
      invisible(self)
    },

    #' @description Add a controller.
    #' @param ref The primary resource, as for [kube_get()] (e.g. `"pods"`,
    #'   `"example.com/v1:Site"`).
    #' @param reconcile `function(req)` or `function(req, k)`; see Details.
    #' @param owns Resources this controller creates (refs). Changes to them
    #'   reconcile their owner.
    #' @param namespace Watch only this namespace; `NULL` watches all
    #'   namespaces (for namespaced resources).
    #' @param label_selector Optional label selector for the primary resource.
    #' @param resync_seconds If set, requeue every primary object this often,
    #'   even without changes.
    #' @param name Controller name used in log messages (default: the kind).
    #' @param base_delay,max_delay Retry backoff bounds, seconds (see
    #'   [WorkQueue]).
    #' @return The controller, invisibly.
    controller = function(ref, reconcile, owns = character(), namespace = NULL,
                          label_selector = NULL, resync_seconds = NULL,
                          name = NULL, base_delay = 0.25, max_delay = 300) {
      ctl <- Controller$new(self$kube, ref, reconcile, owns = owns,
                            namespace = namespace,
                            label_selector = label_selector,
                            resync_seconds = resync_seconds, name = name,
                            base_delay = base_delay, max_delay = max_delay)
      private$ctls[[length(private$ctls) + 1L]] <- ctl
      invisible(ctl)
    },

    #' @description The controllers added so far.
    controllers = function() private$ctls,

    #' @description List every watched resource and open the watches.
    #'   `run()` does this for you; call it yourself to drive `step()`.
    start = function() {
      for (ctl in private$ctls) ctl$start()
      private$state <- "running"
      invisible(self)
    },

    #' @description Answer Kubernetes probes on `port`: `GET /healthz`
    #'   returns 200 whenever the loop is turning, and `GET /readyz` returns
    #'   200 once the manager is running or standing by for the leader lease
    #'   (503 before). Requests are answered between reconciles, so a
    #'   reconcile that hangs makes the liveness probe fail. `run()` calls
    #'   this for you when given `health_port`.
    #' @param port TCP port to listen on (all interfaces).
    serve_health = function(port) {
      if (!is.null(private$health)) private$health$close()
      private$health <- HealthServer$new(port)
      invisible(self)
    },

    #' @description One pass of the loop: handle watch events, then run the
    #'   reconciles that are ready. Waits up to `max_wait` seconds if there is
    #'   nothing to do.
    #' @param max_wait Seconds to wait for work.
    #' @return The number of reconciles run, invisibly.
    step = function(max_wait = 0) {
      deadline <- as.numeric(Sys.time()) + max_wait
      n <- 0L
      repeat {
        private$poll_health()
        for (ctl in private$ctls) ctl$poll()
        for (ctl in private$ctls) {
          n <- n + ctl$process(check = private$check,
                              should_stop = function() private$stopping)
          if (private$stopping) break
        }
        if (n > 0 || private$stopping) break
        left <- deadline - as.numeric(Sys.time())
        if (left <= 0) break
        due <- min(vapply(private$ctls, function(c) c$queue$next_ready_in(), 0), Inf)
        Sys.sleep(max(0.001, min(left, private$poll_interval, due)))
      }
      invisible(n)
    },

    #' @description Run until `stop_seconds` pass or `stop()` is called.
    #' @param stop_seconds Optional time limit; `NULL` runs until `stop()`.
    #' @param leader_election Name of a Lease to hold while running. When
    #'   set, the manager waits until it holds the lease, reconciles only
    #'   while it does, and stops if the lease is lost. Use this whenever more
    #'   than one replica runs.
    #' @param lease_namespace Namespace of the Lease (default: the session's).
    #' @param identity This replica's identity (default: host name and PID).
    #' @param health_port If set, answer `/healthz` and `/readyz` on this port
    #'   (see `serve_health()`), including while waiting for the lease.
    #' @param ... Passed to [run_as_leader()] (lease timings).
    run = function(stop_seconds = NULL, leader_election = NULL,
                   lease_namespace = NULL, identity = NULL,
                   health_port = NULL, ...) {
      deadline <- if (is.null(stop_seconds)) Inf
                  else as.numeric(Sys.time()) + as.numeric(stop_seconds)
      private$stopping <- FALSE
      private$state <- "starting"
      if (!is.null(health_port)) {
        self$serve_health(health_port)
        on.exit({ private$health$close(); private$health <- NULL }, add = TRUE)
      }
      time_up <- function() {
        private$stopping || as.numeric(Sys.time()) >= deadline
      }
      loop <- function(leader = NULL) {
        private$check <- if (is.null(leader)) NULL else function() leader$check()
        on.exit({ private$check <- NULL; self$close() }, add = TRUE)
        self$start()
        repeat {
          if (time_up()) break
          if (!is.null(private$check)) private$check()
          self$step(min(0.25, deadline - as.numeric(Sys.time())))
        }
      }
      # While waiting for the lease: keep answering probes, and give up
      # waiting once time is up or stop() was called.
      standby <- function(seconds) {
        private$state <- "standby"
        until <- as.numeric(Sys.time()) + seconds
        repeat {
          if (time_up()) {
            stop(structure(class = c("rk8s_stop_waiting", "error", "condition"),
                           list(message = "stopped while waiting for the lease",
                                call = NULL)))
          }
          private$poll_health()
          left <- until - as.numeric(Sys.time())
          if (left <= 0) break
          Sys.sleep(min(0.1, left))
        }
      }
      if (is.null(leader_election)) {
        loop()
      } else {
        tryCatch(
          run_as_leader(
            self$kube$client,
            lease_name = leader_election,
            lease_namespace = lease_namespace %||% self$kube$namespace,
            identity = identity %||%
              paste0(Sys.info()[["nodename"]], "-", Sys.getpid()),
            on_started_leading = function(leader) loop(leader),
            on_wait = standby,
            ...
          ),
          rk8s_stop_waiting = function(e) NULL)
      }
      private$state <- "stopped"
      invisible(self)
    },

    #' @description Make `run()` return after the current reconcile.
    stop = function() {
      private$stopping <- TRUE
      invisible(self)
    },

    #' @description Close every watch.
    close = function() {
      for (ctl in private$ctls) ctl$close()
      invisible(self)
    }
  ),

  private = list(
    ctls = NULL,
    poll_interval = 0.05,
    stopping = FALSE,
    check = NULL,      # leader$check while running under leader election
    health = NULL,     # HealthServer, if serving probes
    state = "new",     # new, starting, standby, running, stopped

    poll_health = function() {
      if (!is.null(private$health)) {
        private$health$poll(ready = private$state %in% c("running", "standby"))
      }
    }
  )
)

#' Reconcile results
#'
#' Return one of these from a [Manager] reconcile function. Returning `NULL`
#' means the object is in the desired state.
#'
#' * `requeue()`: reconcile this object again soon, with per-key
#'   exponential backoff (for "not ready yet, try again").
#' * `requeue_after(seconds)`: reconcile it again after `seconds`, without
#'   backoff (for periodic checks).
#'
#' @param seconds Delay before the next reconcile.
#' @return A reconcile result.
#' @export
requeue <- function() structure(list(after = NULL), class = "rk8s_requeue")

#' @rdname requeue
#' @export
requeue_after <- function(seconds) {
  stopifnot(is.numeric(seconds), length(seconds) == 1, seconds >= 0)
  structure(list(after = as.numeric(seconds)), class = "rk8s_requeue")
}

# One primary resource, its owned resources, a work queue and a reconcile
# function. Created by Manager$controller().
Controller <- R6::R6Class(
  "Controller",
  public = list(
    name = NULL,
    queue = NULL,
    api_version = NULL,
    kind = NULL,

    initialize = function(k, ref, reconcile, owns = character(),
                          namespace = NULL, label_selector = NULL,
                          resync_seconds = NULL, name = NULL,
                          base_delay = 0.25, max_delay = 300) {
      private$k <- k
      private$reconcile <- reconcile
      private$wants_kube <- {
        f <- names(formals(reconcile))
        length(f) >= 2 || "..." %in% f
      }
      info <- k$resource_and_name(ref)$resource$info
      self$api_version <- info$api_version
      self$kind <- info$kind
      self$name <- name %||% info$kind
      self$queue <- WorkQueue$new(base_delay = base_delay, max_delay = max_delay)
      private$resync_seconds <- resync_seconds
      private$last_resync <- as.numeric(Sys.time())

      q <- drop_nulls(list(labelSelector = label_selector))
      private$primary <- Informer$new(k$client, collection_path(info, namespace),
                                      query_params = q)
      enqueue <- function(obj) {
        key <- object_key(obj)
        if (!is.na(key)) self$queue$add(key)
      }
      private$primary$add_event_handler(
        on_add = enqueue,
        on_update = function(old, new) enqueue(new),
        on_delete = enqueue)

      private$owned <- list()
      for (r in owns) {
        oinfo <- k$resource_and_name(r)$resource$info
        inf <- Informer$new(k$client, collection_path(oinfo, namespace))
        to_owner <- function(obj) {
          for (key in owner_keys(obj, self$api_version, self$kind)) self$queue$add(key)
        }
        inf$add_event_handler(
          on_add = to_owner,
          on_update = function(old, new) { to_owner(old); to_owner(new) },
          on_delete = to_owner)
        private$owned[[length(private$owned) + 1L]] <- inf
      }
    },

    start = function() {
      private$primary$start()
      for (inf in private$owned) inf$start()
      invisible(self)
    },

    # Handle watch events (and resync) without waiting.
    poll = function() {
      private$primary$poll(0)
      for (inf in private$owned) inf$poll(0)
      if (!is.null(private$resync_seconds) &&
          as.numeric(Sys.time()) - private$last_resync >= private$resync_seconds) {
        private$last_resync <- as.numeric(Sys.time())
        for (obj in private$primary$list()) {
          key <- object_key(obj)
          if (!is.na(key)) self$queue$add(key)
        }
      }
      invisible(self)
    },

    # Run reconciles for ready keys (at most `max_items`). `check` is called
    # before each one (leader election); `should_stop` says whether to stop
    # early.
    process = function(max_items = 50L, check = NULL,
                       should_stop = function() FALSE) {
      n <- 0L
      while (n < max_items && !should_stop()) {
        key <- self$queue$get()
        if (is.null(key)) break
        n <- n + 1L
        if (!is.null(check)) {
          tryCatch(check(), error = function(e) { self$queue$done(key); stop(e) })
        }
        private$reconcile_one(key)
        self$queue$done(key)
      }
      n
    },

    lister = function() private$primary$lister(),

    close = function() {
      private$primary$close()
      for (inf in private$owned) inf$close()
      invisible(self)
    }
  ),

  private = list(
    k = NULL,
    reconcile = NULL,
    wants_kube = FALSE,
    primary = NULL,
    owned = NULL,
    resync_seconds = NULL,
    last_resync = 0,

    reconcile_one = function(key) {
      parts <- strsplit(key, "/", fixed = TRUE)[[1]]
      req <- if (length(parts) == 2) {
        list(key = key, namespace = parts[1], name = parts[2])
      } else {
        list(key = key, namespace = NULL, name = parts[1])
      }
      result <- tryCatch(
        if (private$wants_kube) private$reconcile(req, private$k)
        else private$reconcile(req),
        rk8s_leadership_lost = function(e) stop(e),
        error = function(e) {
          message(sprintf("[%s] reconcile %s failed: %s", self$name, key,
                          conditionMessage(e)))
          structure(list(), class = "rk8s_reconcile_error")
        })
      if (inherits(result, "rk8s_reconcile_error")) {
        self$queue$add_rate_limited(key)
      } else if (inherits(result, "rk8s_requeue")) {
        if (is.null(result$after)) {
          self$queue$add_rate_limited(key)
        } else {
          self$queue$forget(key)
          self$queue$add_after(key, result$after)
        }
      } else {
        self$queue$forget(key)
      }
    }
  )
)

# "namespace/name", or "name" for cluster-scoped objects.
object_key <- function(obj) {
  meta <- obj$metadata
  if (is.null(meta$name)) return(NA_character_)
  ns <- meta$namespace
  if (is.null(ns) || !nzchar(ns)) meta$name else paste0(ns, "/", meta$name)
}

# Keys of the owners of `obj` that are controllers of kind `kind` in the
# API group of `api_version` (any version).
owner_keys <- function(obj, api_version, kind) {
  group <- function(av) if (grepl("/", av, fixed = TRUE)) sub("/.*$", "", av) else ""
  want <- group(api_version)
  ns <- obj$metadata$namespace
  keys <- character()
  for (r in obj$metadata$ownerReferences %||% list()) {
    if (!isTRUE(r$controller) || !identical(r$kind, kind)) next
    if (!identical(group(r$apiVersion %||% ""), want)) next
    keys <- c(keys, if (is.null(ns) || !nzchar(ns)) r$name else paste0(ns, "/", r$name))
  }
  unique(keys)
}

# Collection path for a discovered resource; all namespaces when
# `namespace` is NULL.
collection_path <- function(info, namespace = NULL) {
  if (isTRUE(info$namespaced) && !is.null(namespace)) {
    sprintf("%s/namespaces/%s/%s", info$base_path, namespace, info$name)
  } else {
    sprintf("%s/%s", info$base_path, info$name)
  }
}
