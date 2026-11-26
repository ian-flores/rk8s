#' Work queue for controllers
#'
#' A queue of object keys (`"namespace/name"`) with the semantics of
#' client-go's rate-limited work queue, which is what controllers use
#' between their informers and their reconcile function:
#'
#' * A key is queued at most once. Ten events for one object before it is
#'   handled still mean one reconcile.
#' * A key is never handed out twice at the same time. If it is added again
#'   while being processed, it goes back on the queue when `done()` is
#'   called, so the change is not lost.
#' * `add_after()` makes a key available after a delay (for "check again in
#'   a minute"). If a key is delayed twice, the earlier time wins.
#' * `add_rate_limited()` re-adds a key after a per-key exponential backoff
#'   (`base_delay`, doubling up to `max_delay`); `forget()` resets it after
#'   a success.
#'
#' The usual loop is `key <- q$get()`, reconcile, then `q$forget(key)` on
#' success or `q$add_rate_limited(key)` on failure, and finally
#' `q$done(key)`.
#'
#' @examples
#' q <- WorkQueue$new()
#' q$add("default/web"); q$add("default/web")
#' q$len()              # 1
#' key <- q$get()
#' q$add_rate_limited(key)   # failed: retry after base_delay
#' q$done(key)
#' q$next_ready_in()
#' @export
WorkQueue <- R6::R6Class(
  "WorkQueue",
  public = list(
    #' @description Create a queue.
    #' @param base_delay First retry delay for `add_rate_limited()`, seconds.
    #' @param max_delay Upper bound on the retry delay, seconds.
    #' @param clock Function returning the current time in seconds. Only
    #'   for tests.
    initialize = function(base_delay = 0.005, max_delay = 1000,
                          clock = function() as.numeric(Sys.time())) {
      private$base_delay <- base_delay
      private$max_delay <- max_delay
      private$clock <- clock
      private$queue <- character()
      private$dirty <- new.env(parent = emptyenv())
      private$processing <- new.env(parent = emptyenv())
      private$waiting <- new.env(parent = emptyenv())
      private$failures <- new.env(parent = emptyenv())
      invisible(self)
    },

    #' @description Queue a key now.
    #' @param key A string.
    add = function(key) {
      key <- as.character(key)
      if (private$has(private$dirty, key)) return(invisible(self))
      assign(key, TRUE, envir = private$dirty)
      if (!private$has(private$processing, key)) {
        private$queue <- c(private$queue, key)
      }
      invisible(self)
    },

    #' @description Queue a key once `seconds` have passed.
    #' @param key A string.
    #' @param seconds Delay in seconds; `<= 0` adds now.
    add_after = function(key, seconds) {
      key <- as.character(key)
      if (seconds <= 0) return(self$add(key))
      at <- private$clock() + seconds
      if (private$has(private$waiting, key)) {
        at <- min(at, get(key, envir = private$waiting))
      }
      assign(key, at, envir = private$waiting)
      invisible(self)
    },

    #' @description Queue a key after its backoff delay (a failed attempt).
    #' @param key A string.
    add_rate_limited = function(key) {
      key <- as.character(key)
      n <- self$num_requeues(key)
      assign(key, n + 1L, envir = private$failures)
      self$add_after(key, min(private$base_delay * 2^n, private$max_delay))
    },

    #' @description Reset a key's backoff (after a success).
    #' @param key A string.
    forget = function(key) {
      key <- as.character(key)
      if (private$has(private$failures, key)) rm(list = key, envir = private$failures)
      invisible(self)
    },

    #' @description How many times `add_rate_limited()` was called for a key
    #'   since it was last forgotten.
    #' @param key A string.
    num_requeues = function(key) {
      key <- as.character(key)
      if (private$has(private$failures, key)) get(key, envir = private$failures) else 0L
    },

    #' @description Take the next key to process, or `NULL` if none is
    #'   ready. The caller must call `done()` with it afterwards.
    get = function() {
      private$promote()
      if (!length(private$queue)) return(NULL)
      key <- private$queue[[1]]
      private$queue <- private$queue[-1]
      assign(key, TRUE, envir = private$processing)
      rm(list = key, envir = private$dirty)
      key
    },

    #' @description Mark a key as finished. If it was added again while being
    #'   processed, it goes back on the queue.
    #' @param key A string.
    done = function(key) {
      key <- as.character(key)
      if (private$has(private$processing, key)) {
        rm(list = key, envir = private$processing)
      }
      if (private$has(private$dirty, key)) private$queue <- c(private$queue, key)
      invisible(self)
    },

    #' @description Number of keys ready to be handed out now.
    len = function() {
      private$promote()
      length(private$queue)
    },

    #' @description Seconds until the next delayed key becomes ready: `0` if
    #'   one is ready now (or already queued), `Inf` if nothing is waiting.
    next_ready_in = function() {
      private$promote()
      if (length(private$queue)) return(0)
      times <- unlist(as.list(private$waiting))
      if (!length(times)) return(Inf)
      max(0, min(times) - private$clock())
    },

    #' @description Is this key being processed right now?
    #' @param key A string.
    is_processing = function(key) private$has(private$processing, as.character(key)),

    #' @description Snapshot of the queue: keys `ready` to hand out (in
    #'   order), `processing`, and `delayed`.
    keys = function() {
      private$promote()
      list(ready = private$queue,
           processing = sort(ls(private$processing, all.names = TRUE)),
           delayed = sort(ls(private$waiting, all.names = TRUE)))
    }
  ),

  private = list(
    base_delay = NULL,
    max_delay = NULL,
    clock = NULL,
    queue = NULL,       # character: ready keys, in order
    dirty = NULL,       # env: keys that need processing (queued or re-added)
    processing = NULL,  # env: keys handed out and not yet done()
    waiting = NULL,     # env: key -> time it becomes ready
    failures = NULL,    # env: key -> consecutive add_rate_limited() calls

    has = function(env, key) exists(key, envir = env, inherits = FALSE),

    # Move delayed keys whose time has come onto the queue.
    promote = function() {
      due <- character()
      now <- private$clock()
      for (key in ls(private$waiting, all.names = TRUE)) {
        if (get(key, envir = private$waiting) <= now) due <- c(due, key)
      }
      if (!length(due)) return(invisible())
      at <- vapply(due, function(k) get(k, envir = private$waiting), numeric(1))
      due <- due[order(at)]
      rm(list = due, envir = private$waiting)
      for (key in due) self$add(key)
      invisible()
    }
  )
)
