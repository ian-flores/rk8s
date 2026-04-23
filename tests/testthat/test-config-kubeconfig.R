test_that("load_kube_config parses a minimal kubeconfig and selects a context", {
  yml <- '
apiVersion: v1
kind: Config
current-context: dev
clusters:
- name: c1
  cluster:
    server: https://1.2.3.4:6443
    insecure-skip-tls-verify: true
contexts:
- name: dev
  context: {cluster: c1, user: u1}
- name: prod
  context: {cluster: c1, user: u1}
users:
- name: u1
  user:
    token: tok
'
  path <- tempfile(fileext = ".yaml"); writeLines(yml, path)
  cfg <- load_kube_config(path)
  expect_equal(cfg$host, "https://1.2.3.4:6443")
  expect_equal(cfg$context_name, "dev")
  expect_false(cfg$verify_ssl)
  expect_equal(cfg$bearer_token(), "tok")

  cfg2 <- load_kube_config(path, context = "prod")
  expect_equal(cfg2$context_name, "prod")

  ctxs <- list_kube_config_contexts(path)
  expect_equal(ctxs$current_context, "dev")
  expect_length(ctxs$contexts, 2)
})

test_that("load_kube_config materializes inline base64 CA/cert/key to temp files", {
  # Two tiny PEM payloads, base64-encoded.
  ca <- base64enc::base64encode(charToRaw("CA-PEM"))
  crt <- base64enc::base64encode(charToRaw("CRT-PEM"))
  key <- base64enc::base64encode(charToRaw("KEY-PEM"))
  yml <- sprintf('
apiVersion: v1
kind: Config
current-context: dev
clusters: [{name: c1, cluster: {server: https://x, certificate-authority-data: %s}}]
contexts: [{name: dev, context: {cluster: c1, user: u1}}]
users:    [{name: u1, user: {client-certificate-data: %s, client-key-data: %s}}]
', ca, crt, key)
  path <- tempfile(fileext = ".yaml"); writeLines(yml, path)
  cfg <- load_kube_config(path)
  expect_true(file.exists(cfg$ssl_ca_cert))
  expect_true(file.exists(cfg$cert_file))
  expect_true(file.exists(cfg$key_file))
  expect_equal(rawToChar(readBin(cfg$ssl_ca_cert, "raw", 10)), "CA-PEM")
})

test_that("unknown context raises", {
  yml <- '
apiVersion: v1
kind: Config
current-context: dev
clusters: [{name: c1, cluster: {server: https://x}}]
contexts: [{name: dev, context: {cluster: c1}}]
users: []
'
  path <- tempfile(fileext = ".yaml"); writeLines(yml, path)
  expect_error(load_kube_config(path, context = "nope"), "not found")
})
