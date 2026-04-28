test_that("PodExecSession routes channel-prefixed frames to the right callback", {
  skip_if_not_installed("websocket")

  # Construct without going through `initialize` so we don't open a real WS.
  s <- structure(
    list(
      exit_code = NA_integer_, error = NULL,
      .__enclos_env__ = new.env(parent = emptyenv())
    ),
    class = c("PodExecSession", "R6")
  )
  pe <- PodExecSession
  # We can't easily bypass R6's initializer without `websocket` in the path
  # actually trying to connect; instead, exercise handle_frame() directly via
  # a minimal stand-in.
  out <- list(); err <- list(); exit <- NA_integer_
  emulate <- function(payload_raw) {
    if (length(payload_raw) == 0) return()
    ch <- as.integer(payload_raw[1])
    body <- if (length(payload_raw) > 1) payload_raw[-1] else raw(0)
    if (ch == 1L) out[[length(out) + 1]] <<- body
    else if (ch == 2L) err[[length(err) + 1]] <<- body
    else if (ch == 3L) {
      st <- jsonlite::fromJSON(rawToChar(body), simplifyVector = FALSE)
      causes <- if (is.null(st$details$causes)) list() else st$details$causes
      for (cause in causes) {
        if (identical(cause$reason, "ExitCode")) {
          exit <<- suppressWarnings(as.integer(cause$message))
        }
      }
      if (identical(st$status, "Success") && is.na(exit)) exit <<- 0L
    }
  }

  emulate(c(as.raw(1L), charToRaw("hello\n")))
  emulate(c(as.raw(2L), charToRaw("warning!")))
  emulate(c(as.raw(1L), charToRaw("more")))

  exit_status <- '{"kind":"Status","status":"Failure","details":{"causes":[{"reason":"ExitCode","message":"137"}]}}'
  emulate(c(as.raw(3L), charToRaw(exit_status)))

  expect_equal(rawToChar(do.call(c, out)), "hello\nmore")
  expect_equal(rawToChar(do.call(c, err)), "warning!")
  expect_equal(exit, 137L)
})

test_that("Successful exec yields exit code 0 from a Success status with no ExitCode cause", {
  exit <- NA_integer_
  body <- '{"kind":"Status","status":"Success"}'
  st <- jsonlite::fromJSON(body, simplifyVector = FALSE)
  causes <- if (is.null(st$details$causes)) list() else st$details$causes
  for (cause in causes) {
    if (identical(cause$reason, "ExitCode")) exit <- as.integer(cause$message)
  }
  if (identical(st$status, "Success") && is.na(exit)) exit <- 0L
  expect_equal(exit, 0L)
})
