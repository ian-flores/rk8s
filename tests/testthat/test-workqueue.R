# A controllable clock so delay tests don't sleep.
fake_clock <- function(start = 1000) {
  now <- start
  list(now = function() now, advance = function(s) now <<- now + s)
}

test_that("keys come out in order and duplicates collapse", {
  q <- WorkQueue$new()
  q$add("default/a"); q$add("default/b"); q$add("default/a")
  expect_equal(q$len(), 2)
  expect_equal(q$get(), "default/a")
  expect_equal(q$get(), "default/b")
  expect_null(q$get())
  expect_equal(q$len(), 0)
})

test_that("a key added while it is being processed is not handed out twice", {
  q <- WorkQueue$new()
  q$add("a")
  expect_equal(q$get(), "a")
  q$add("a")                  # changed again while we work on it
  expect_null(q$get())        # ...but not handed out concurrently
  expect_equal(q$len(), 0)
  q$done("a")                 # finished: it goes back on the queue once
  expect_equal(q$len(), 1)
  expect_equal(q$get(), "a")
  q$done("a")
  expect_null(q$get())
})

test_that("done() without a pending re-add drops the key", {
  q <- WorkQueue$new()
  q$add("a")
  k <- q$get()
  q$done(k)
  expect_equal(q$len(), 0)
  expect_false(q$is_processing("a"))
})

test_that("add_after() makes a key available once its delay has passed", {
  clk <- fake_clock()
  q <- WorkQueue$new(clock = clk$now)
  q$add_after("a", 10)
  expect_null(q$get())
  expect_equal(q$next_ready_in(), 10)
  clk$advance(9.5)
  expect_null(q$get())
  expect_equal(q$next_ready_in(), 0.5)
  clk$advance(0.5)
  expect_equal(q$get(), "a")
  expect_equal(q$next_ready_in(), Inf)
})

test_that("an immediate add wins over a pending delayed add, without duplicates", {
  clk <- fake_clock()
  q <- WorkQueue$new(clock = clk$now)
  q$add_after("a", 30)
  q$add("a")
  expect_equal(q$get(), "a")
  q$done("a")
  clk$advance(31)
  # The delayed copy still fires (a requeue the controller asked for)...
  expect_equal(q$get(), "a")
  q$done("a")
  expect_null(q$get())
  # ...but two delayed adds of one key keep only the earliest.
  q$add_after("b", 5); q$add_after("b", 20)
  clk$advance(6)
  expect_equal(q$get(), "b")
  q$done("b")
  clk$advance(20)
  expect_null(q$get())
})

test_that("add_rate_limited() backs off exponentially per key until forget()", {
  clk <- fake_clock()
  q <- WorkQueue$new(base_delay = 0.5, max_delay = 4, clock = clk$now)
  delays <- numeric()
  for (i in 1:6) {
    q$add_rate_limited("a")
    delays <- c(delays, q$next_ready_in())
    clk$advance(q$next_ready_in())
    expect_equal(q$get(), "a")
    q$done("a")
  }
  expect_equal(delays, c(0.5, 1, 2, 4, 4, 4))
  expect_equal(q$num_requeues("a"), 6)

  # Other keys have their own counters.
  q$add_rate_limited("b")
  expect_equal(q$next_ready_in(), 0.5)

  q$forget("a")
  expect_equal(q$num_requeues("a"), 0)
  clk$advance(0.5); q$get(); q$done("b")
  q$add_rate_limited("a")
  expect_equal(q$next_ready_in(), 0.5)
})

test_that("keys() lists what is waiting, delayed or in progress", {
  clk <- fake_clock()
  q <- WorkQueue$new(clock = clk$now)
  q$add("a"); q$add("b"); q$add_after("c", 5)
  q$get()
  s <- q$keys()
  expect_equal(s$ready, "b")
  expect_equal(s$processing, "a")
  expect_equal(s$delayed, "c")
})
