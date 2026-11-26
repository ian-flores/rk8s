# ---- ws_plan(): decisions made before any network I/O -----------------------

plan_cfg <- function(host = "https://k:6443", token = "t", ...) {
  cfg <- Configuration$new(
    host = host,
    api_key = if (!is.null(token)) list(authorization = paste("Bearer", token))
              else list(), ...)
  cfg
}

test_that("ws_plan builds the URL, auth and subprotocol headers", {
  p <- ws_plan(plan_cfg(ssl_ca_cert = "/ca.pem"), "/api/v1/x/exec",
               c("command=ls", "stdin=false"))
  expect_equal(p$url, "wss://k:6443/api/v1/x/exec?command=ls&stdin=false")
  expect_equal(p$headers[["Authorization"]], "Bearer t")
  expect_equal(p$headers[["Sec-WebSocket-Protocol"]], "v4.channel.k8s.io")
  expect_equal(p$ca, "/ca.pem")
  expect_true(p$verify)

  p2 <- ws_plan(plan_cfg(host = "http://k:8080/"), "/p")
  expect_equal(p2$url, "ws://k:8080/p")
  expect_null(p2$ca)
})

test_that("ws_plan falls back to the system CA bundle, or errors without one", {
  local_mocked_bindings(system_ca_bundle = function() "/sys/bundle.pem")
  expect_equal(ws_plan(plan_cfg(), "/p")$ca, "/sys/bundle.pem")
  local_mocked_bindings(system_ca_bundle = function() NULL)
  expect_error(ws_plan(plan_cfg(), "/p"), "needs a CA certificate")
})

test_that("insecure-skip-tls-verify disables verification only when asked", {
  p <- ws_plan(plan_cfg(verify_ssl = FALSE), "/p")
  expect_null(p$ca)
  expect_false(p$verify)
})

test_that("client-cert-only users get an actionable error", {
  cfg <- plan_cfg(token = NULL, cert_file = "/c.pem", key_file = "/k.pem",
                  ssl_ca_cert = "/ca.pem")
  expect_error(ws_plan(cfg, "/p"), "only has client-certificate auth")
  # with a token as well, the token is used
  cfg$api_key <- list(authorization = "Bearer t")
  expect_equal(ws_plan(cfg, "/p")$headers[["Authorization"]], "Bearer t")
})

test_that("tls-server-name is refused rather than silently ignored", {
  cfg <- plan_cfg(ssl_ca_cert = "/ca.pem")
  cfg$tls_server_name <- "kubernetes.internal"
  expect_error(ws_plan(cfg, "/p"), "tls-server-name")
})

# ---- against a fake API server over real TLS --------------------------------

# write_cert() makes 4096-bit RSA keys (seconds each), so reuse them.
test_cert <- local({
  cache <- list()
  function(cn, slot = "a") {
    key <- paste(cn, slot)
    if (is.null(cache[[key]])) cache[[key]] <<- nanonext::write_cert(cn = cn)
    cache[[key]]
  }
})

# Starts fixtures/fake_kubelet.py with a fresh self-signed certificate for
# `cn`. Returns the URL, the CA file a client should trust, and a reader for
# the server's request log.
local_fake_kubelet <- function(cn = "127.0.0.1", .env = parent.frame()) {
  skip_on_cran()
  skip_if_not_installed("nanonext", "1.10.3")
  skip_if_not_installed("processx")
  py <- Sys.which("python3")
  skip_if(!nzchar(py), "python3 not available")

  d <- withr::local_tempdir(.local_envir = .env)
  cert <- test_cert(cn)
  writeLines(cert$server[1], file.path(d, "cert.pem"))
  writeLines(cert$server[2], file.path(d, "key.pem"))
  portfile <- file.path(d, "port"); logfile <- file.path(d, "log")
  file.create(logfile)
  proc <- processx::process$new(
    py, c(test_path("fixtures", "fake_kubelet.py"), file.path(d, "cert.pem"),
          file.path(d, "key.pem"), portfile, logfile),
    stdout = "|", stderr = "|")
  withr::defer(proc$kill(), envir = .env)
  deadline <- Sys.time() + 10
  while (!file.exists(portfile)) {
    if (!proc$is_alive()) stop("fake kubelet died: ", proc$read_all_error())
    if (Sys.time() > deadline) stop("fake kubelet did not start")
    Sys.sleep(0.05)
  }
  list(host = paste0("https://127.0.0.1:", readLines(portfile, warn = FALSE)),
       ca = file.path(d, "cert.pem"),
       log = function() readLines(logfile))
}

fake_client <- function(f, token = "good-token", ca = f$ca, verify = TRUE) {
  ApiClient$new(Configuration$new(
    host = f$host, api_key = list(authorization = paste("Bearer", token)),
    ssl_ca_cert = ca, verify_ssl = verify))
}

test_that("pod_exec runs over verified TLS: stdout, stderr, stdin, exit code", {
  f <- local_fake_kubelet()
  cl <- fake_client(f)

  r <- pod_exec(cl, "ns", "pod", c("ls", "-la"), timeout = 10)
  expect_false(r$timed_out)
  expect_equal(r$stdout, "ran: ls -la\n")
  expect_equal(r$stderr, "a warning\n")
  expect_equal(r$exit_code, 0L)

  r2 <- pod_exec(cl, "ns", "pod", c("cat"), stdin_data = "piped in", timeout = 10)
  expect_equal(r2$stdout, "ran: cat\npiped in")

  r3 <- pod_exec(cl, "ns", "pod", "false", timeout = 10)
  expect_equal(r3$exit_code, 1L)

  expect_true(all(grepl(
    "auth=Bearer good-token proto=v5.channel.k8s.io, v4.channel.k8s.io$",
    grep("^REQUEST", f$log(), value = TRUE))))
})

test_that("stdin EOF needs v5; against a v4-only server the session is bounded", {
  # v5 (preferred) closes stdin, so `cat` finishes.
  f <- local_fake_kubelet()
  r <- pod_exec(fake_client(f), "ns", "pod", "cat", stdin_data = "x", timeout = 10)
  expect_false(r$timed_out)
  expect_equal(r$stdout, "ran: cat\nx")

  # A v4-only server ignores the close message, so `cat` never sees EOF;
  # the timeout still ends the session and the output so far is returned.
  withr::local_envvar(FAKE_PROTOCOLS = "v4.channel.k8s.io")
  f4 <- local_fake_kubelet()
  r4 <- pod_exec(fake_client(f4), "ns", "pod", "cat", stdin_data = "y", timeout = 2)
  expect_true(r4$timed_out)
  expect_equal(r4$stdout, "ran: cat\ny")
  # without stdin, v4 sessions end normally
  expect_equal(pod_exec(fake_client(f4), "ns", "pod", "ls", timeout = 10)$exit_code, 0L)
})

test_that("exec ends promptly however the server closes the connection", {
  for (mode in c("abrupt", "graceful", "tcp")) {
    withr::local_envvar(FAKE_CLOSE_MODE = mode)
    f <- local_fake_kubelet()
    t0 <- Sys.time()
    r <- pod_exec(fake_client(f), "ns", "pod", "ls", timeout = 10)
    expect_false(r$timed_out, label = mode)
    expect_lt(as.numeric(difftime(Sys.time(), t0, units = "secs")), 3)
  }
})

test_that("an untrusted server certificate is refused before the token is sent", {
  f <- local_fake_kubelet()
  other <- withr::local_tempfile(fileext = ".pem")
  writeLines(test_cert("127.0.0.1", slot = "other")$client[1], other)
  expect_error(pod_exec(fake_client(f, ca = other), "ns", "pod", "ls"),
               "could not open WebSocket.*Cryptographic error")
  Sys.sleep(0.2)
  expect_false(any(grepl("^REQUEST", f$log())))
})

test_that("a certificate for another hostname is refused", {
  f <- local_fake_kubelet(cn = "kubernetes.invalid")
  # The CA is the server's own cert, so the chain verifies; only the name
  # (kubernetes.invalid vs 127.0.0.1) is wrong.
  expect_error(pod_exec(fake_client(f), "ns", "pod", "ls"), "Cryptographic error")
  Sys.sleep(0.2)
  expect_false(any(grepl("^REQUEST", f$log())))
})

test_that("insecure-skip-tls-verify still connects when explicitly set", {
  f <- local_fake_kubelet(cn = "kubernetes.invalid")
  r <- pod_exec(fake_client(f, ca = NULL, verify = FALSE), "ns", "pod", "ls",
                timeout = 10)
  expect_equal(r$exit_code, 0L)
})

test_that("a rejected token surfaces as a connection error", {
  f <- local_fake_kubelet()
  expect_error(pod_exec(fake_client(f, token = "bad"), "ns", "pod", "ls"),
               "could not open WebSocket")
  expect_true(any(grepl("auth=Bearer bad", f$log())))
})

test_that("PodPortForwardSession round-trips bytes and swallows port headers", {
  f <- local_fake_kubelet()
  pf <- pod_port_forward_open(fake_client(f), "ns", "pod", ports = 8080)
  withr::defer(pf$close())
  got <- raw(0)
  pf$on_data(8080, function(b) got <<- c(got, b))
  pf$write(8080, "ping")
  deadline <- Sys.time() + 5
  while (length(got) < 4 && Sys.time() < deadline) pf$pump(0.1)
  expect_equal(rawToChar(got), "PING")
  expect_false(pf$is_closed())
  pf$close()
  expect_true(pf$is_closed())
})

test_that("pod_port_forward bridges a local TCP port through the WebSocket", {
  f <- local_fake_kubelet()
  skip_if_not_installed("callr")
  # The bridge runs in a child process that loads the *installed* rk8s.
  skip_if_not(callr::r(function() {
    requireNamespace("rk8s", quietly = TRUE) &&
      exists("ws_connect", envir = asNamespace("rk8s"))
  }), "installed rk8s predates the nanonext transport")

  fwd <- pod_port_forward(fake_client(f), "ns", "pod", remote_port = 8080)
  withr::defer(fwd$close())
  con <- socketConnection("127.0.0.1", fwd$port, blocking = TRUE,
                          open = "r+b", timeout = 5)
  withr::defer(close(con))
  writeBin(charToRaw("hello bridge"), con)
  got <- raw(0)
  deadline <- Sys.time() + 5
  while (length(got) < 12 && Sys.time() < deadline) {
    got <- c(got, readBin(con, raw(), 64))
  }
  expect_equal(rawToChar(got), "HELLO BRIDGE")
})
