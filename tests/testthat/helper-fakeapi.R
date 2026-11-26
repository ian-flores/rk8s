# A tiny in-memory fake of the Kubernetes API server, served by webfakes in a
# background process. It supports just enough to exercise the runtime:
#
# * pods in namespace "default": list (with limit/continue paging) and watch
#   (streamed, honours timeoutSeconds, replays ADDED when no resourceVersion,
#   sends ERROR 410 once the history has been compacted past the client's rv)
# * coordination.k8s.io/v1 Leases: GET / POST / PUT with resourceVersion
#   optimistic concurrency (409 on mismatch)
# * a control plane under /_ctl to schedule mutations from the test:
#   add / modify / delete (optionally `silent`, i.e. not recorded in the watch
#   history -- simulates changes missed while disconnected), compact (forces
#   410 Gone), steal_lease, and a `quiet_watch` flag to make the server ignore
#   timeoutSeconds (to test the client-side backstop), and `hold_resumed` to
#   send no bytes on a resumed watch until there is an event.

fake_api_app <- function() {
  app <- webfakes::new_app()
  st <- new.env()
  st$objects <- list()
  st$rv <- 100L
  st$log <- list()
  st$compacted <- 0L
  st$schedule <- list()
  st$lease <- NULL
  st$lease_puts <- 0L
  st$ignore_timeout <- FALSE
  st$hold_resumed <- FALSE
  st$requests <- character()
  app$locals$st <- st

  now <- function() as.numeric(Sys.time())
  json <- function(res, obj, status = 200L) {
    res$set_status(status)
    res$set_type("application/json")
    res$send(as.character(jsonlite::toJSON(obj, auto_unbox = TRUE, null = "null")))
  }
  status_obj <- function(code, reason, msg) {
    list(kind = "Status", apiVersion = "v1", status = "Failure",
         message = msg, reason = reason, code = code)
  }
  body_of <- function(req) {
    jsonlite::fromJSON(rawToChar(req$.body %||% req$body), simplifyVector = FALSE)
  }
  pod <- function(name, rv, gen = 1L) {
    list(apiVersion = "v1", kind = "Pod",
         metadata = list(name = name, namespace = "default",
                         resourceVersion = as.character(rv),
                         generation = gen))
  }
  mutate <- function(st, action, name, silent) {
    st$rv <- st$rv + 1L
    if (action == "delete") {
      obj <- st$objects[[name]]
      if (is.null(obj)) return()
      st$objects[[name]] <- NULL
      obj$metadata$resourceVersion <- as.character(st$rv)
      type <- "DELETED"
    } else {
      prev <- st$objects[[name]]
      gen <- if (is.null(prev)) 1L else prev$metadata$generation + 1L
      obj <- pod(name, st$rv, gen)
      st$objects[[name]] <- obj
      type <- if (action == "add") "ADDED" else "MODIFIED"
    }
    if (!isTRUE(silent)) {
      st$log[[length(st$log) + 1]] <- list(rv = st$rv, type = type, object = obj)
    }
  }
  apply_due <- function(st) {
    keep <- list()
    for (a in st$schedule) {
      if (a$at > now()) { keep[[length(keep) + 1]] <- a; next }
      switch(a$action,
        add = , modify = , delete = mutate(st, a$action, a$name, a$silent),
        compact = { st$compacted <- st$rv },
        steal_lease = {
          if (!is.null(st$lease)) {
            st$rv <- st$rv + 1L
            st$lease$spec$holderIdentity <- a$identity
            st$lease$spec$renewTime <- strftime(
              Sys.time() - as.numeric(a$age %||% 0),
              "%Y-%m-%dT%H:%M:%S.000000Z", tz = "UTC")
            st$lease$metadata$resourceVersion <- as.character(st$rv)
          }
        },
        ignore_timeout = { st$ignore_timeout <- TRUE },
        hold_resumed = { st$hold_resumed <- TRUE }
      )
    }
    st$schedule <- keep
  }

  # ---- control plane -------------------------------------------------------
  app$post("/_ctl/schedule", function(req, res) {
    st <- req$app$locals$st
    acts <- body_of(req)
    for (a in acts) {
      a$at <- now() + as.numeric(a$after %||% 0)
      st$schedule[[length(st$schedule) + 1]] <- a
    }
    apply_due(st)
    json(res, list(ok = TRUE))
  })
  app$get("/_ctl/state", function(req, res) {
    st <- req$app$locals$st
    apply_due(st)
    json(res, list(rv = st$rv, names = I(as.character(names(st$objects))),
                   lease = st$lease, lease_puts = st$lease_puts,
                   requests = I(st$requests)))
  })

  # ---- pods ------------------------------------------------------------------
  app$get("/api/v1/namespaces/default/pods", function(req, res) {
    st <- req$app$locals$st
    apply_due(st)
    q <- req$query
    if (!identical(q$watch, "true")) {
      st$requests <- c(st$requests, paste0("list?", req$query_string))
      items <- unname(st$objects[order(names(st$objects))])
      start <- as.integer(q[["continue"]] %||% "0")
      limit <- as.integer(q$limit %||% length(items))
      idx <- seq_len(length(items))
      idx <- idx[idx > start & idx <= start + limit]
      meta <- list(resourceVersion = as.character(st$rv))
      if (length(idx) && max(idx) < length(items)) {
        meta[["continue"]] <- as.character(max(idx))
      }
      return(json(res, list(kind = "PodList", apiVersion = "v1",
                            metadata = meta, items = I(items[idx]))))
    }

    L <- res$locals
    send_evt <- function(type, obj) {
      res$send_chunk(paste0(as.character(jsonlite::toJSON(
        list(type = type, object = obj), auto_unbox = TRUE, null = "null")), "\n"))
    }
    gone <- function() {
      send_evt("ERROR", status_obj(410L, "Expired", "too old resource version"))
    }
    if (is.null(L$init)) {
      L$init <- TRUE
      st$requests <- c(st$requests, paste0("watch?", req$query_string))
      L$deadline <- now() + as.numeric(q$timeoutSeconds %||% 1800)
      res$set_header("Content-Type", "application/json")
      rv <- q$resourceVersion
      if (!is.null(rv) && nzchar(rv) && as.integer(rv) < st$compacted) {
        return(gone())
      }
      # A resumed watch with nothing new sends no bytes at all on the real
      # API server until the first event (a bookmark can take a minute);
      # `hold_resumed` mimics that. Otherwise flush the headers right away.
      resumed <- !is.null(rv) && nzchar(rv)
      if (!(resumed && isTRUE(st$hold_resumed))) res$send_chunk("\n")
      if (is.null(rv) || !nzchar(rv)) {
        for (o in st$objects) send_evt("ADDED", o)
        L$cur <- st$rv
      } else {
        L$cur <- as.integer(rv)
      }
    }
    if (L$cur < st$compacted) return(gone())
    for (e in st$log) {
      if (e$rv > L$cur) { send_evt(e$type, e$object); L$cur <- e$rv }
    }
    if (now() >= L$deadline && !isTRUE(st$ignore_timeout)) return(invisible())
    res$delay(0.1)
  })

  # ---- leases ----------------------------------------------------------------
  lease_base <- "/apis/coordination.k8s.io/v1/namespaces/default/leases"
  app$get(paste0(lease_base, "/:name"), function(req, res) {
    st <- req$app$locals$st
    apply_due(st)
    if (is.null(st$lease) || !identical(st$lease$metadata$name, req$params$name)) {
      return(json(res, status_obj(404L, "NotFound", "lease not found"), 404L))
    }
    json(res, st$lease)
  })
  app$post(lease_base, function(req, res) {
    st <- req$app$locals$st
    apply_due(st)
    if (!is.null(st$lease)) {
      return(json(res, status_obj(409L, "AlreadyExists", "exists"), 409L))
    }
    b <- body_of(req)
    st$rv <- st$rv + 1L
    b$metadata$resourceVersion <- as.character(st$rv)
    # Like the real apiserver: managedFields contain empty JSON objects that
    # a naive list round-trip turns into `[]`.
    b$metadata$managedFields <- list(list(
      manager = "rk8s", operation = "Update", fieldsType = "FieldsV1",
      fieldsV1 = list(`f:spec` = list(`f:holderIdentity` = structure(list(), names = character())))
    ))
    st$lease <- b
    json(res, b, 201L)
  })
  app$put(paste0(lease_base, "/:name"), function(req, res) {
    st <- req$app$locals$st
    apply_due(st)
    b <- body_of(req)
    if (!is.null(b$metadata$managedFields)) {
      return(json(res, status_obj(422L, "Invalid",
                                  "managedFields must not be round-tripped"), 422L))
    }
    if (is.null(st$lease) ||
        !identical(b$metadata$resourceVersion, st$lease$metadata$resourceVersion)) {
      return(json(res, status_obj(409L, "Conflict", "resourceVersion mismatch"), 409L))
    }
    st$rv <- st$rv + 1L
    b$metadata$resourceVersion <- as.character(st$rv)
    st$lease <- b
    st$lease_puts <- st$lease_puts + 1L
    json(res, b)
  })
  app
}

# Start the fake in a background process for the duration of the calling test.
local_fake_api <- function(pods = character(), .env = parent.frame()) {
  testthat::skip_if_not_installed("webfakes")
  proc <- webfakes::new_app_process(
    fake_api_app(),
    opts = webfakes::server_opts(num_threads = 4, enable_keep_alive = FALSE)
  )
  withr::defer(proc$stop(), envir = .env)
  base <- sub("/$", "", proc$url())
  ctl <- function(...) {
    acts <- list(...)
    req <- httr2::request(paste0(base, "/_ctl/schedule"))
    req <- httr2::req_body_json(req, acts, auto_unbox = TRUE)
    invisible(httr2::resp_body_json(httr2::req_perform(req)))
  }
  state <- function() {
    httr2::resp_body_json(httr2::req_perform(
      httr2::request(paste0(base, "/_ctl/state"))))
  }
  for (p in pods) ctl(list(action = "add", name = p))
  client <- ApiClient$new(Configuration$new(host = base))
  list(url = base, client = client, ctl = ctl, state = state)
}

act <- function(action, name = NULL, after = 0, silent = FALSE, ...) {
  c(list(action = action, name = name, after = after, silent = silent), list(...))
}

# The app is serialized into a separate R process; give it a minimal
# environment so it doesn't drag the test env (and the package namespace)
# along with it.
environment(fake_api_app) <- list2env(
  list(`%||%` = function(x, y) if (is.null(x)) y else x),
  parent = baseenv()
)
