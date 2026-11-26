skip_on_os("windows")

# Write a fake exec credential plugin (a /bin/sh script) and return its path.
fake_plugin <- function(body, .env = parent.frame()) {
  dir <- withr::local_tempdir(.local_envir = .env)
  path <- file.path(dir, "fake-plugin")
  writeLines(c("#!/bin/sh", body), path)
  Sys.chmod(path, "0755")
  path
}

cred_json <- function(status) {
  as.character(jsonlite::toJSON(list(
    apiVersion = "client.authentication.k8s.io/v1", kind = "ExecCredential",
    status = status), auto_unbox = TRUE))
}

future_ts <- function(secs = 3600, fmt = "%Y-%m-%dT%H:%M:%SZ") {
  strftime(Sys.time() + secs, fmt, tz = "UTC")
}

test_that("warnings on stderr don't corrupt the ExecCredential", {
  withr::defer(rk8s:::exec_cache_clear())
  p <- fake_plugin(c(
    "echo 'WARNING: using cached SSO session' >&2",
    sprintf("echo '%s'", cred_json(list(token = "tok-1")))
  ))
  expect_equal(rk8s:::exec_plugin_token(list(command = p)), "tok-1")
})

test_that("input is passed via KUBERNETES_EXEC_INFO, with cluster info on request", {
  withr::defer(rk8s:::exec_cache_clear())
  out <- tempfile()
  p <- fake_plugin(c(
    sprintf("printf '%%s' \"$KUBERNETES_EXEC_INFO\" > '%s'", out),
    sprintf("echo '%s'", cred_json(list(token = "t")))
  ))
  spec <- list(command = p, apiVersion = "client.authentication.k8s.io/v1",
               provideClusterInfo = TRUE)
  rk8s:::exec_plugin_token(spec, cluster = list(server = "https://k8s.example:6443"))
  info <- jsonlite::fromJSON(readLines(out, warn = FALSE))
  expect_equal(info$kind, "ExecCredential")
  expect_false(info$spec$interactive)
  expect_equal(info$spec$cluster$server, "https://k8s.example:6443")
})

test_that("env entries and args with spaces/quotes reach the plugin intact", {
  withr::defer(rk8s:::exec_cache_clear())
  out <- tempfile()
  p <- fake_plugin(c(
    sprintf("printf '%%s|%%s|%%s' \"$PROFILE_NAME\" \"$1\" \"$2\" > '%s'", out),
    sprintf("echo '%s'", cred_json(list(token = "t")))
  ))
  spec <- list(command = p, args = list("eks get-token", "it's"),
               env = list(list(name = "PROFILE_NAME", value = "dev account")))
  rk8s:::exec_plugin_token(spec)
  expect_equal(readLines(out, warn = FALSE), "dev account|eks get-token|it's")
  expect_equal(Sys.getenv("PROFILE_NAME", unset = "<unset>"), "<unset>")
  expect_equal(Sys.getenv("KUBERNETES_EXEC_INFO", unset = "<unset>"), "<unset>")
})

test_that("failures include stderr and the installHint", {
  withr::defer(rk8s:::exec_cache_clear())
  p <- fake_plugin(c("echo 'token expired, run aws sso login' >&2", "exit 3"))
  expect_error(
    rk8s:::exec_plugin_token(list(command = p, installHint = "Install the AWS CLI")),
    "status 3.*aws sso login.*Install the AWS CLI")
  expect_error(rk8s:::exec_plugin_token(list(command = "no-such-plugin-xyz")),
               "not found")
})

test_that("credentials are cached until expiry, fractional/offset timestamps included", {
  withr::defer(rk8s:::exec_cache_clear())
  counter <- tempfile()
  writeLines("0", counter)
  env <- environment()
  mk <- function(exp) fake_plugin(.env = env, c(
    sprintf("n=$(cat '%s'); n=$((n+1)); echo $n > '%s'", counter, counter),
    sprintf("echo '{\"apiVersion\":\"client.authentication.k8s.io/v1\",\"kind\":\"ExecCredential\",\"status\":{\"token\":\"tok-'$n'\",\"expirationTimestamp\":\"%s\"}}'", exp)
  ))
  # valid for an hour, with fractional seconds -> cached
  p <- mk(future_ts(3600, "%Y-%m-%dT%H:%M:%S.123456Z"))
  expect_equal(rk8s:::exec_plugin_token(list(command = p)), "tok-1")
  expect_equal(rk8s:::exec_plugin_token(list(command = p)), "tok-1")

  # already expired (written with a +02:00 offset) -> re-run every time
  writeLines("0", counter)
  past <- strftime(Sys.time() - 60 + 7200, "%Y-%m-%dT%H:%M:%S.5+02:00", tz = "UTC")
  p2 <- mk(past)
  expect_equal(rk8s:::exec_plugin_token(list(command = p2)), "tok-1")
  expect_equal(rk8s:::exec_plugin_token(list(command = p2)), "tok-2")
})

test_that("parse_rfc3339 handles Z, fractions and offsets", {
  base <- as.numeric(as.POSIXct("2024-05-06 07:08:09", tz = "UTC"))
  expect_equal(rk8s:::parse_rfc3339("2024-05-06T07:08:09Z"), base)
  expect_equal(rk8s:::parse_rfc3339("2024-05-06T07:08:09.25Z"), base + 0.25)
  expect_equal(rk8s:::parse_rfc3339("2024-05-06T09:08:09+02:00"), base)
  expect_equal(rk8s:::parse_rfc3339("2024-05-06T02:38:09.000-04:30"), base)
  expect_true(is.na(rk8s:::parse_rfc3339("yesterday")))
})

test_that("client certificate credentials from a plugin are used for TLS", {
  withr::defer(rk8s:::exec_cache_clear())
  pem_c <- "-----BEGIN CERTIFICATE-----\\nMIIB\\n-----END CERTIFICATE-----\\n"
  pem_k <- "-----BEGIN PRIVATE KEY-----\\nMIIE\\n-----END PRIVATE KEY-----\\n"
  p <- fake_plugin(sprintf("echo '%s'", cred_json(list(
    clientCertificateData = pem_c, clientKeyData = pem_k))))
  cfg <- Configuration$new(host = "https://h", exec = list(command = p),
                           cert_file = "/static.crt", key_file = "/static.key")
  cc <- cfg$client_cert()
  expect_true(file.exists(cc$cert_file))
  expect_match(paste(readLines(cc$cert_file), collapse = "\n"), "BEGIN CERTIFICATE")
  expect_match(paste(readLines(cc$key_file), collapse = "\n"), "BEGIN PRIVATE KEY")
  expect_equal(unname(file.info(cc$key_file)$mode), as.octmode("600"))
  expect_null(cfg$bearer_token())

  req <- ApiClient$new(cfg)$call_api("/api", stream = TRUE)
  expect_equal(req$options$sslcert, cc$cert_file)
  expect_equal(req$options$sslkey, cc$key_file)
})

test_that("a plugin returning neither token nor cert is an error", {
  withr::defer(rk8s:::exec_cache_clear())
  p <- fake_plugin(sprintf("echo '%s'", cred_json(list(foo = "bar"))))
  expect_error(rk8s:::exec_plugin_token(list(command = p)), "neither a token")
})

test_that("HTTP 401 re-runs the plugin and retries once", {
  withr::defer(rk8s:::exec_cache_clear())
  skip_if_not_installed("webfakes")
  app <- webfakes::new_app()
  app$get("/api", function(req, res) {
    if (identical(req$get_header("Authorization"), "Bearer tok-2")) {
      res$send_json(list(ok = TRUE), auto_unbox = TRUE)
    } else {
      res$set_status(401L)$send_json(list(kind = "Status", code = 401L),
                                     auto_unbox = TRUE)
    }
  })
  web <- webfakes::local_app_process(app)
  counter <- tempfile()
  writeLines("0", counter)
  p <- fake_plugin(c(
    sprintf("n=$(cat '%s'); n=$((n+1)); echo $n > '%s'", counter, counter),
    "echo '{\"apiVersion\":\"client.authentication.k8s.io/v1\",\"kind\":\"ExecCredential\",\"status\":{\"token\":\"tok-'$n'\"}}'"
  ))
  client <- ApiClient$new(Configuration$new(host = sub("/$", "", web$url()),
                                            exec = list(command = p)))
  expect_true(client$call_api("/api")$ok)
  expect_equal(readLines(counter), "2")
})
