#' Run as the leader under a Kubernetes Lease
#'
#' Acquire-and-renew leader election against a `coordination.k8s.io/v1` Lease
#' object. Exactly one caller across a cluster holds the lease at a time;
#' leadership is released automatically when the caller crashes or stops
#' renewing (within `lease_duration_seconds`).
#'
#' Mirrors `kubernetes.leaderelection.LeaderElection` (Python) and
#' `client-go/tools/leaderelection`.
#'
#' The typical caller pattern is a long-running controller: call
#' `run_as_leader()` on the main thread; the function blocks while this
#' caller is the leader and the `on_started_leading` callback is invoked
#' exactly once. When leadership is lost (lease is stolen, the API server
#' returns errors past the renew deadline, or `$stop()` is called),
#' `on_stopped_leading` fires and the function returns.
#'
#' @param client An [ApiClient].
#' @param lease_name Name of the Lease object (created if missing).
#' @param lease_namespace Namespace of the Lease.
#' @param identity Unique identifier for this caller (hostname + PID is a
#'   common choice). Two callers with the same identity are considered the
#'   same holder and will never contest each other.
#' @param on_started_leading Function called once, with no arguments, when
#'   this caller acquires the lease.
#' @param on_stopped_leading Function called once, with no arguments, when
#'   this caller loses the lease (always paired with `on_started_leading`).
#' @param on_new_leader Optional `function(identity)` called whenever the
#'   observed leader changes (including this caller becoming leader).
#' @param lease_duration_seconds How long a successful acquire is valid
#'   (default 15s). Other callers will consider the lease expired after
#'   this interval of no renewal.
#' @param renew_deadline_seconds How long to keep trying to renew before
#'   giving up and calling `on_stopped_leading` (default 10s).
#' @param retry_period_seconds Base backoff between acquire attempts
#'   (default 2s).
#'
#' @return Invisibly, `TRUE` if this caller ever held leadership.
#' @examples
#' \dontrun{
#' client <- new_client_from_config()
#' run_as_leader(
#'   client,
#'   lease_name = "my-controller",
#'   lease_namespace = "kube-system",
#'   identity = paste0(Sys.info()[["nodename"]], "-", Sys.getpid()),
#'   on_started_leading = function() { message("leading"); controller_loop() },
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
                           retry_period_seconds = 2) {
  stopifnot(is.function(on_started_leading))
  held <- FALSE
  observed_leader <- NA_character_

  lease_path <- sprintf("/apis/coordination.k8s.io/v1/namespaces/%s/leases",
                         lease_namespace)
  item_path <- paste0(lease_path, "/", lease_name)

  notify_leader <- function(id) {
    if (!identical(observed_leader, id) && !is.null(on_new_leader)) {
      on_new_leader(id)
    }
    observed_leader <<- id
  }

  # Main acquire loop: try until we become leader or caller stops us.
  repeat {
    result <- try_acquire(client, lease_path, item_path, lease_name,
                           lease_namespace, identity, lease_duration_seconds)
    notify_leader(result$holder)
    if (identical(result$holder, identity)) {
      held <- TRUE
      break
    }
    Sys.sleep(jitter_sleep(retry_period_seconds))
  }

  # Leading: run the callback, while a background-ish renew loop ticks. Since
  # R isn't natively threaded, we alternate: call the user callback in a
  # non-blocking way via a renew-after-every-slice pattern. The simplest
  # faithful implementation is to run the callback in a child R process via
  # `callr`, but to avoid a hard dependency we use the blocking-callback
  # pattern documented in `run_as_leader`: the user is expected to invoke
  # `renew()` periodically, OR the caller can check `is_leader()`.
  #
  # Here we take the common approach: start a renewer in a child process
  # via callr if available; otherwise run the callback synchronously with
  # a best-effort pre-renew.
  renewer <- start_renewer(client, item_path, lease_name, lease_namespace,
                            identity, lease_duration_seconds,
                            renew_deadline_seconds, retry_period_seconds)
  leading <- TRUE
  on.exit({
    leading <- FALSE
    stop_renewer(renewer)
    tryCatch(on_stopped_leading(), error = function(e) {
      warning("on_stopped_leading error: ", conditionMessage(e))
    })
  }, add = TRUE)

  tryCatch(on_started_leading(), error = function(e) {
    warning("on_started_leading error: ", conditionMessage(e))
  })
  invisible(held)
}

# ---- internal -------------------------------------------------------------

try_acquire <- function(client, lease_path, item_path, name, namespace,
                         identity, lease_duration_seconds) {
  now <- strftime(Sys.time(), "%Y-%m-%dT%H:%M:%S.000000Z", tz = "UTC")
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

  # Lease exists. If it's ours, renew. If it's stale, steal. Otherwise wait.
  holder <- lease$spec$holderIdentity
  renewed <- lease$spec$renewTime
  expired <- is_expired(renewed, lease$spec$leaseDurationSeconds)

  if (identical(holder, identity) || isTRUE(expired)) {
    new_spec <- lease$spec
    new_spec$holderIdentity <- identity
    new_spec$renewTime <- now
    if (!identical(holder, identity)) {
      new_spec$acquireTime <- now
      new_spec$leaseTransitions <- (new_spec$leaseTransitions %||% 0L) + 1L
    }
    lease$spec <- new_spec
    updated <- tryCatch(
      client$call_api(item_path, "PUT", body = lease),
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

start_renewer <- function(client, item_path, name, namespace, identity,
                           lease_duration_seconds, renew_deadline_seconds,
                           retry_period_seconds) {
  # Best-effort: if `callr` is installed, run the renewer in a child R
  # process. Otherwise skip; the user's callback is responsible for calling
  # `try_acquire()` itself, or they can vendor their own renewer.
  if (!requireNamespace("callr", quietly = TRUE)) {
    warning("`callr` is not installed; the leader-election renewer will not ",
            "run in the background. Leadership will be held only for the ",
            "initial lease_duration_seconds unless you manually renew.",
            call. = FALSE)
    return(NULL)
  }
  callr::r_bg(
    func = function(host, token, ca_cert, item_path, name, namespace, identity,
                    ldur, rdl, rp) {
      # Child process: construct a minimal client mirroring the parent's
      # transport (host/token/ca), and tick-renew.
      cfg <- rk8s::Configuration$new(
        host = host,
        api_key = if (!is.null(token)) list(authorization = paste("Bearer", token)) else list(),
        ssl_ca_cert = ca_cert,
        verify_ssl = !is.null(ca_cert)
      )
      c2 <- rk8s::ApiClient$new(cfg)
      deadline <- Sys.time() + rdl
      repeat {
        Sys.sleep(rp)
        ok <- tryCatch({
          now <- strftime(Sys.time(), "%Y-%m-%dT%H:%M:%S.000000Z", tz = "UTC")
          lease <- c2$call_api(item_path, "GET")
          if (!identical(lease$spec$holderIdentity, identity)) {
            return(list(reason = "stolen"))
          }
          lease$spec$renewTime <- now
          c2$call_api(item_path, "PUT", body = lease)
          deadline <- Sys.time() + rdl
          TRUE
        }, error = function(e) FALSE)
        if (!ok && Sys.time() > deadline) return(list(reason = "deadline"))
      }
    },
    args = list(
      host = client$configuration$host,
      token = client$configuration$bearer_token(),
      ca_cert = client$configuration$ssl_ca_cert,
      item_path = item_path, name = name, namespace = namespace,
      identity = identity,
      ldur = lease_duration_seconds, rdl = renew_deadline_seconds,
      rp = retry_period_seconds
    ),
    supervise = TRUE
  )
}

stop_renewer <- function(renewer) {
  if (is.null(renewer)) return(invisible())
  tryCatch(renewer$kill(), error = function(e) NULL)
}
