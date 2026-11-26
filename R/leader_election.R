#' Run as the leader under a Kubernetes Lease
#'
#' Acquire-and-renew leader election against a `coordination.k8s.io/v1` Lease
#' object. At most one caller across a cluster holds the lease at a time;
#' leadership passes to another caller when the holder stops renewing (within
#' `lease_duration_seconds`).
#'
#' Mirrors `kubernetes.leaderelection.LeaderElection` (Python) and
#' `client-go/tools/leaderelection`.
#'
#' `run_as_leader()` blocks until the lease is acquired, then starts a
#' background renewer (a `callr` child process) and calls
#' `on_started_leading(leader)`. Because R cannot interrupt running code
#' from another thread, **your callback must check in periodically** by
#' calling `leader$check()`. It returns invisibly while this caller is still
#' the leader and signals a condition of class `rk8s_leadership_lost` once
#' leadership is gone (the lease was taken over, or no renewal has succeeded
#' within `renew_deadline_seconds`). `run_as_leader()` catches that
#' condition. `leader$is_leader()` returns the same information as a logical.
#'
#' When the callback returns, errors, or loses leadership, the renewer is
#' stopped, the lease is released (so a successor can take over immediately,
#' unless `release_on_exit = FALSE`), and `on_stopped_leading()` is called.
#' Errors other than lost leadership are re-raised after this cleanup.
#'
#' A callback that takes no arguments is still supported, but it then has no
#' way to learn that leadership was lost while it runs.
#'
#' @param client An [ApiClient].
#' @param lease_name Name of the Lease object (created if missing).
#' @param lease_namespace Namespace of the Lease.
#' @param identity Unique identifier for this caller (hostname + PID is a
#'   common choice). Two callers with the same identity are considered the
#'   same holder and will never contest each other.
#' @param on_started_leading Function called once when this caller acquires
#'   the lease, with a leader handle (see Details) as its only argument.
#' @param on_stopped_leading Function called once, with no arguments, when
#'   this caller loses the lease (always paired with `on_started_leading`).
#' @param on_new_leader Optional `function(identity)` called whenever the
#'   observed leader changes (including this caller becoming leader).
#' @param lease_duration_seconds How long a successful acquire is valid
#'   (default 15s). Other callers will consider the lease expired after
#'   this interval of no renewal.
#' @param renew_deadline_seconds How long to keep trying to renew before
#'   giving up and calling `on_stopped_leading` (default 10s).
#' @param retry_period_seconds Interval between acquire attempts and between
#'   renewals (default 2s).
#' @param release_on_exit Release the lease when leadership ends, so a
#'   successor does not have to wait for it to expire (default `TRUE`).
#' @param on_wait Optional `function(seconds)` called instead of
#'   [Sys.sleep()] between attempts while waiting for the lease. Use it to
#'   keep doing other work (such as answering health checks) on a standby
#'   replica; it may signal a condition to stop waiting.
#'
#' Requires `lease_duration_seconds > renew_deadline_seconds >
#' retry_period_seconds`, as in client-go.
#'
#' @return Invisibly, `TRUE` once this caller has held and given up
#'   leadership.
#' @examples
#' \dontrun{
#' client <- new_client_from_config()
#' run_as_leader(
#'   client,
#'   lease_name = "my-controller",
#'   lease_namespace = "kube-system",
#'   identity = paste0(Sys.info()[["nodename"]], "-", Sys.getpid()),
#'   on_started_leading = function(leader) {
#'     repeat {
#'       leader$check()          # returns, or unwinds once leadership is lost
#'       reconcile_once()
#'       Sys.sleep(1)
#'     }
#'   },
#'   on_stopped_leading = function() message("stopped leading")
#' )
#' }
#' @export
run_as_leader <- function(client, lease_name, lease_namespace, identity,
                           on_started_leading,
                           on_stopped_leading = function() NULL,
                           on_new_leader = NULL,
                           lease_duration_seconds = 15,
                           renew_deadline_seconds = 10,
                           retry_period_seconds = 2,
                           release_on_exit = TRUE,
                           on_wait = NULL) {
  stopifnot(is.function(on_started_leading))
  wait <- on_wait %||% Sys.sleep
  if (!(lease_duration_seconds > renew_deadline_seconds &&
        renew_deadline_seconds > retry_period_seconds)) {
    stop("run_as_leader() requires lease_duration_seconds > ",
         "renew_deadline_seconds > retry_period_seconds", call. = FALSE)
  }
  if (!requireNamespace("callr", quietly = TRUE)) {
    stop("run_as_leader() requires the `callr` package for the background ",
         "lease renewer.", call. = FALSE)
  }
  observed_leader <- NA_character_

  lease_path <- sprintf("/apis/coordination.k8s.io/v1/namespaces/%s/leases",
                         lease_namespace)
  item_path <- paste0(lease_path, "/", lease_name)

  notify_leader <- function(id) {
    if (!is.na(id) && !identical(observed_leader, id) && !is.null(on_new_leader)) {
      on_new_leader(id)
    }
    if (!is.na(id)) observed_leader <<- id
  }

  # Acquire: block until we hold the lease.
  repeat {
    result <- try_acquire(client, lease_path, item_path, lease_name,
                           lease_namespace, identity, lease_duration_seconds)
    notify_leader(result$holder)
    if (identical(result$holder, identity)) break
    wait(jitter_sleep(retry_period_seconds))
  }

  status_file <- tempfile("rk8s-lease-")
  write_renew_stamp(status_file)
  renewer <- callr::r_bg(
    func = function(...) {
      utils::getFromNamespace("leader_renew_loop", "rk8s")(...)
    },
    args = list(cfg_list = config_to_list(client$configuration),
                item_path = item_path, identity = identity,
                renew_deadline = renew_deadline_seconds,
                retry_period = retry_period_seconds,
                status_file = status_file),
    supervise = TRUE
  )
  leader <- new_leader_handle(identity, renewer, status_file,
                              renew_deadline_seconds)

  on.exit({
    leader$.deactivate()
    tryCatch(renewer$kill(), error = function(e) NULL)
    if (isTRUE(release_on_exit)) {
      tryCatch(release_lease(client, item_path, identity),
               error = function(e) warning("failed to release lease: ",
                                           conditionMessage(e), call. = FALSE))
    }
    unlink(status_file)
    tryCatch(on_stopped_leading(), error = function(e) {
      warning("on_stopped_leading error: ", conditionMessage(e), call. = FALSE)
    })
  }, add = TRUE)

  tryCatch(
    if (length(formals(on_started_leading)) > 0) on_started_leading(leader)
    else on_started_leading(),
    rk8s_leadership_lost = function(e) NULL
  )
  invisible(TRUE)
}

# ---- leader handle -----------------------------------------------------------

new_leader_handle <- function(identity, renewer, status_file, renew_deadline) {
  state <- new.env(parent = emptyenv())
  state$leading <- TRUE
  state$reason <- NULL
  lose <- function(reason) {
    state$leading <- FALSE
    state$reason <- state$reason %||% reason
    FALSE
  }
  h <- list(
    identity = identity,
    is_leader = function() {
      if (!state$leading) return(FALSE)
      if (!renewer$is_alive()) {
        r <- tryCatch(renewer$get_result()$reason,
                      error = function(e) paste("renewer failed:", conditionMessage(e)))
        return(lose(r %||% "renewer exited"))
      }
      last <- read_renew_stamp(status_file)
      if (!is.na(last) && as.numeric(Sys.time()) - last > renew_deadline) {
        return(lose("deadline"))
      }
      TRUE
    },
    reason = function() state$reason,
    .deactivate = function() lose("stopped")
  )
  h$check <- function() {
    if (!h$is_leader()) {
      cond <- structure(
        class = c("rk8s_leadership_lost", "error", "condition"),
        list(message = paste0("leadership lost (", state$reason, ")"),
             call = NULL, reason = state$reason)
      )
      stop(cond)
    }
    invisible(TRUE)
  }
  structure(h, class = "rk8s_leader")
}

#' @export
print.rk8s_leader <- function(x, ...) {
  cat("<rk8s_leader>", x$identity,
      if (x$is_leader()) "(leading)" else paste0("(not leading: ", x$reason(), ")"),
      "\n")
  invisible(x)
}

write_renew_stamp <- function(path) {
  tmp <- paste0(path, ".tmp")
  writeLines(format(as.numeric(Sys.time()), digits = 15), tmp)
  file.rename(tmp, path)
}

read_renew_stamp <- function(path) {
  suppressWarnings(tryCatch(as.numeric(readLines(path, n = 1, warn = FALSE)),
                            error = function(e) NA_real_))
}

# Runs in the callr child process: renew every `retry_period` seconds until
# the lease is taken over ("stolen") or no renewal has succeeded within
# `renew_deadline` seconds ("deadline").
leader_renew_loop <- function(cfg_list, item_path, identity, renew_deadline,
                              retry_period, status_file) {
  cfg <- config_from_list(cfg_list)
  cfg$timeout <- cfg$timeout %||% renew_deadline
  client <- ApiClient$new(cfg)
  last_ok <- as.numeric(Sys.time())
  repeat {
    Sys.sleep(retry_period)
    res <- tryCatch(renew_once(client, item_path, identity),
                    error = function(e) "error")
    now <- as.numeric(Sys.time())
    if (identical(res, "stolen")) return(list(reason = "stolen"))
    if (identical(res, "ok")) {
      last_ok <- now
      write_renew_stamp(status_file)
    } else if (now - last_ok > renew_deadline) {
      return(list(reason = "deadline"))
    }
  }
}

renew_once <- function(client, item_path, identity) {
  lease <- client$call_api(item_path, "GET")
  if (!identical(lease$spec$holderIdentity, identity)) return("stolen")
  lease$spec$renewTime <- micro_time()
  client$call_api(item_path, "PUT", body = for_update(lease))
  "ok"
}

release_lease <- function(client, item_path, identity) {
  lease <- client$call_api(item_path, "GET")
  if (!identical(lease$spec$holderIdentity, identity)) return(invisible(FALSE))
  lease$spec$holderIdentity <- NULL
  lease$spec$leaseDurationSeconds <- 1L
  lease$spec$renewTime <- micro_time()
  client$call_api(item_path, "PUT", body = for_update(lease))
  invisible(TRUE)
}

micro_time <- function() {
  strftime(Sys.time(), "%Y-%m-%dT%H:%M:%S.000000Z", tz = "UTC")
}

# Prepare a fetched object for PUT. managedFields contain empty JSON objects
# (`{}`) that jsonlite turns into `[]` on the way back out, which the API
# server rejects; leaving them out keeps the server's existing ones.
for_update <- function(obj) {
  obj$metadata$managedFields <- NULL
  obj
}

# ---- internal -------------------------------------------------------------

try_acquire <- function(client, lease_path, item_path, name, namespace,
                         identity, lease_duration_seconds) {
  now <- micro_time()
  lease <- tryCatch(
    client$call_api(item_path, "GET"),
    rk8s_api_error = function(e) if (identical(e$exception$status, 404L)) NULL else stop(e)
  )

  if (is.null(lease)) {
    # Create with us as holder
    body <- list(
      apiVersion = "coordination.k8s.io/v1",
      kind = "Lease",
      metadata = list(name = name, namespace = namespace),
      spec = list(
        holderIdentity = identity,
        leaseDurationSeconds = as.integer(lease_duration_seconds),
        acquireTime = now,
        renewTime = now,
        leaseTransitions = 0L
      )
    )
    created <- tryCatch(
      client$call_api(lease_path, "POST", body = body),
      rk8s_api_error = function(e) {
        # 409: someone else created it in the meantime; fall through to next loop
        if (identical(e$exception$status, 409L)) return(NULL)
        stop(e)
      }
    )
    if (!is.null(created)) {
      return(list(holder = identity, lease = created))
    }
    return(list(holder = NA_character_, lease = NULL))
  }

  # Lease exists. If it's ours, renew. If it's free or stale, take it.
  holder <- lease$spec$holderIdentity
  free <- is.null(holder) || !nzchar(holder)
  expired <- free || is_expired(lease$spec$renewTime, lease$spec$leaseDurationSeconds)

  if (identical(holder, identity) || isTRUE(expired)) {
    new_spec <- lease$spec
    new_spec$holderIdentity <- identity
    new_spec$leaseDurationSeconds <- as.integer(lease_duration_seconds)
    new_spec$renewTime <- now
    if (!identical(holder, identity)) {
      new_spec$acquireTime <- now
      new_spec$leaseTransitions <- (new_spec$leaseTransitions %||% 0L) + 1L
    }
    lease$spec <- new_spec
    updated <- tryCatch(
      client$call_api(item_path, "PUT", body = for_update(lease)),
      rk8s_api_error = function(e) {
        # 409 conflict: resourceVersion mismatch; another caller won the race.
        if (identical(e$exception$status, 409L)) return(NULL)
        stop(e)
      }
    )
    if (!is.null(updated)) return(list(holder = identity, lease = updated))
    return(list(holder = NA_character_, lease = lease))
  }
  list(holder = holder, lease = lease)
}

is_expired <- function(renew_time, duration_seconds) {
  if (is.null(renew_time) || is.null(duration_seconds)) return(TRUE)
  rt <- as.POSIXct(sub("\\..*Z$", "Z", renew_time),
                    format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")
  if (is.na(rt)) return(TRUE)
  as.numeric(Sys.time()) - as.numeric(rt) > as.numeric(duration_seconds)
}

jitter_sleep <- function(base) base * (0.8 + stats::runif(1) * 0.4)
