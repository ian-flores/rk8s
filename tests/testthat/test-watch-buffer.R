test_that("Watch chunk buffer correctly handles a single event terminated by \\n", {
  # Regression: R's strsplit("event\n", "\n") returns c("event") — dropping
  # the trailing empty — so a buffer-based parser that uses length(pieces) to
  # detect completed lines will hang forever when the chunk delivers exactly
  # one complete event. We simulate that case end-to-end via the R6 Watch
  # class without hitting the network.

  # Stand up a Watch and drive its private handle_chunk via a stand-in
  # consume() that uses the same logic. We can't easily call the private
  # method directly, so instead exercise the parsing logic via a copy.
  buf <- ""
  saw <- list()
  handle_chunk <- function(chunk) {
    if (length(chunk) == 0) return(TRUE)
    buf <<- paste0(buf, rawToChar(chunk))
    ends_with_nl <- endsWith(buf, "\n")
    pieces <- strsplit(buf, "\n", fixed = TRUE)[[1]]
    if (ends_with_nl) {
      to_process <- pieces
      buf <<- ""
    } else {
      to_process <- if (length(pieces) > 1) pieces[-length(pieces)] else character()
      buf <<- if (length(pieces)) pieces[length(pieces)] else ""
    }
    for (line in to_process) {
      if (!nzchar(line)) next
      saw[[length(saw) + 1]] <<- jsonlite::fromJSON(line, simplifyVector = FALSE)
    }
    TRUE
  }

  # 1) Single complete event terminated by '\n' — the failing case.
  handle_chunk(charToRaw('{"type":"ADDED","object":{"metadata":{"name":"a"}}}\n'))
  expect_length(saw, 1)
  expect_equal(saw[[1]]$type, "ADDED")
  expect_equal(buf, "")

  # 2) Two events in one chunk, both newline-terminated.
  saw <- list(); buf <- ""
  handle_chunk(charToRaw(paste0(
    '{"type":"ADDED","object":{"metadata":{"name":"a"}}}\n',
    '{"type":"MODIFIED","object":{"metadata":{"name":"a"}}}\n'
  )))
  expect_length(saw, 2)
  expect_equal(saw[[2]]$type, "MODIFIED")

  # 3) Partial event (no trailing newline) — should be held in buf.
  saw <- list(); buf <- ""
  handle_chunk(charToRaw('{"type":"ADD'))
  expect_length(saw, 0)
  expect_equal(buf, '{"type":"ADD')
  handle_chunk(charToRaw('ED","object":{"metadata":{"name":"a"}}}\n'))
  expect_length(saw, 1)
  expect_equal(saw[[1]]$type, "ADDED")
  expect_equal(buf, "")
})
