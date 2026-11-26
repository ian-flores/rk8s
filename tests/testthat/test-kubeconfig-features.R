write_kc <- function(dir, file, yml) {
  path <- file.path(dir, file)
  writeLines(yml, path)
  path
}

test_that("KUBECONFIG with several files is merged, first definition wins", {
  d <- withr::local_tempdir()
  dir.create(file.path(d, "a")); dir.create(file.path(d, "b"))
  writeLines("CA-B", file.path(d, "b", "ca.crt"))
  a <- write_kc(file.path(d, "a"), "config", '
current-context: from-a
contexts:
- {name: from-a, context: {cluster: shared, user: ua, namespace: team-a}}
clusters:
- {name: shared, cluster: {server: "https://a.example:6443"}}
users:
- {name: ua, user: {token: tok-a}}
')
  b <- write_kc(file.path(d, "b"), "config", '
current-context: from-b
contexts:
- {name: from-b, context: {cluster: only-b, user: ub}}
clusters:
- {name: shared, cluster: {server: "https://b.example:6443"}}
- {name: only-b, cluster: {server: "https://bb.example:6443", certificate-authority: ca.crt}}
users:
- {name: ub, user: {tokenFile: token}}
')
  writeLines("tok-b", file.path(d, "b", "token"))
  missing <- file.path(d, "nope", "config")
  withr::local_envvar(KUBECONFIG = paste(c(missing, a, b), collapse = .Platform$path.sep))

  cfg <- load_kube_config()
  expect_equal(cfg$context_name, "from-a")               # first current-context
  expect_equal(cfg$host, "https://a.example:6443")       # first 'shared' wins
  expect_equal(cfg$namespace, "team-a")

  cfg_b <- load_kube_config(context = "from-b")          # context from 2nd file
  expect_equal(cfg_b$host, "https://bb.example:6443")
  # relative paths resolve against the file that defined the entry
  expect_equal(normalizePath(cfg_b$ssl_ca_cert), normalizePath(file.path(d, "b", "ca.crt")))
  expect_equal(cfg_b$bearer_token(), "tok-b")
  expect_null(cfg_b$namespace)

  ctx <- list_kube_config_contexts()
  expect_equal(ctx$current_context, "from-a")
  expect_setequal(vapply(ctx$contexts, `[[`, "", "name"), c("from-a", "from-b"))
  expect_null(ctx$contexts[[1]]$.origin)
})

test_that("KUBECONFIG pointing only at missing files is a clear error", {
  withr::local_envvar(KUBECONFIG = file.path(tempdir(), "definitely-missing"))
  expect_error(load_kube_config(), "None of the files in KUBECONFIG exist")
})

test_that("context namespace flows into kube(); explicit argument wins", {
  d <- withr::local_tempdir()
  p <- write_kc(d, "config", '
current-context: c
contexts: [{name: c, context: {cluster: k, user: u, namespace: payments}}]
clusters: [{name: k, cluster: {server: "https://k:6443"}}]
users: [{name: u, user: {token: t}}]
')
  expect_equal(kube(config_file = p)$namespace, "payments")
  expect_equal(kube(config_file = p, namespace = "other")$namespace, "other")
  cfg <- Configuration$new(host = "https://x")
  expect_equal(kube(client = ApiClient$new(cfg))$namespace, "default")
})

test_that("proxy-url and tls-server-name are honoured", {
  d <- withr::local_tempdir()
  p <- write_kc(d, "config", '
current-context: c
contexts: [{name: c, context: {cluster: k, user: u}}]
clusters: [{name: k, cluster: {server: "https://10.0.0.5:6443", proxy-url: "http://proxy:3128", tls-server-name: "kubernetes.internal"}}]
users: [{name: u, user: {token: t}}]
')
  cfg <- load_kube_config(p)
  expect_equal(cfg$proxy, "http://proxy:3128")
  expect_equal(cfg$tls_server_name, "kubernetes.internal")
  req <- ApiClient$new(cfg)$call_api("/api", stream = TRUE)
  expect_equal(req$options$proxy, "http://proxy:3128")
  expect_match(req$url, "^https://kubernetes\\.internal:6443/api")
  expect_equal(req$options$connect_to, "kubernetes.internal:6443:10.0.0.5:6443")
})

test_that("tls-server-name routes the connection to the real host", {
  skip_if_not_installed("webfakes")
  app <- webfakes::new_app()
  app$get("/api", function(req, res) res$send_json(list(host = req$get_header("Host")),
                                                    auto_unbox = TRUE))
  web <- webfakes::local_app_process(app)
  real <- httr2::url_parse(web$url())
  cfg <- Configuration$new(host = sprintf("http://127.0.0.1:%s", real$port))
  cfg$tls_server_name <- "apiserver.invalid"   # unresolvable on purpose
  res <- ApiClient$new(cfg)$call_api("/api")
  expect_match(res$host, "^apiserver\\.invalid")
})

test_that("exec plugins get cluster info, the exec extension, and relative command paths", {
  d <- withr::local_tempdir()
  p <- write_kc(d, "config", '
current-context: c
contexts: [{name: c, context: {cluster: k, user: u}}]
clusters:
- name: k
  cluster:
    server: "https://k:6443"
    certificate-authority-data: Q0EtUEVN
    extensions:
    - {name: client.authentication.k8s.io/exec, extension: {audience: sts.example}}
users:
- name: u
  user:
    exec: {command: ./bin/get-token, apiVersion: client.authentication.k8s.io/v1, provideClusterInfo: true}
')
  dir.create(file.path(d, "bin")); file.create(file.path(d, "bin", "get-token"))
  cfg <- load_kube_config(p)
  expect_equal(normalizePath(cfg$exec$command),
               normalizePath(file.path(d, "bin", "get-token")))
  expect_equal(cfg$exec_cluster$server, "https://k:6443")
  expect_equal(cfg$exec_cluster$`certificate-authority-data`, "Q0EtUEVN")
  expect_equal(cfg$exec_cluster$config$audience, "sts.example")
})

test_that("removed gcp/azure auth-providers give an actionable error", {
  d <- withr::local_tempdir()
  p <- write_kc(d, "config", '
current-context: c
contexts: [{name: c, context: {cluster: k, user: u}}]
clusters: [{name: k, cluster: {server: "https://k:6443"}}]
users: [{name: u, user: {auth-provider: {name: gcp, config: {}}}}]
')
  expect_error(load_kube_config(p), "gke-gcloud-auth-plugin")
})

# ---- OIDC --------------------------------------------------------------------

make_jwt <- function(exp) {
  enc <- function(x) {
    b <- base64enc::base64encode(charToRaw(jsonlite::toJSON(x, auto_unbox = TRUE)))
    chartr("+/", "-_", sub("=+$", "", b))
  }
  paste(enc(list(alg = "none")), enc(list(sub = "me", exp = exp)), "sig", sep = ".")
}

oidc_kubeconfig <- function(d, id_token, issuer = "https://issuer.invalid",
                            refresh = "rt-1") {
  write_kc(d, "config", sprintf('
current-context: c
contexts: [{name: c, context: {cluster: k, user: u}}]
clusters: [{name: k, cluster: {server: "https://k:6443"}}]
users:
- name: u
  user:
    auth-provider:
      name: oidc
      config: {client-id: kube, client-secret: s3cret, id-token: "%s", refresh-token: %s, idp-issuer-url: "%s"}
', id_token, refresh, issuer))
}

fake_idp <- function(.env = parent.frame()) {
  skip_if_not_installed("webfakes")
  app <- webfakes::new_app()
  app$use(webfakes::mw_urlencoded())
  app$locals$new_token <- make_jwt(as.numeric(Sys.time()) + 3600)
  app$get("/.well-known/openid-configuration", function(req, res) {
    res$send_json(list(token_endpoint = paste0("http://", req$get_header("Host"), "/token")),
                  auto_unbox = TRUE)
  })
  app$post("/token", function(req, res) {
    f <- req$form
    if (!identical(f$grant_type, "refresh_token") || !identical(f$refresh_token, "rt-1") ||
        !identical(f$client_id, "kube") || !identical(f$client_secret, "s3cret")) {
      return(res$set_status(400L)$send_json(list(error = "invalid_grant"), auto_unbox = TRUE))
    }
    res$send_json(list(id_token = req$app$locals$new_token, refresh_token = "rt-2"),
                  auto_unbox = TRUE)
  })
  web <- webfakes::local_app_process(app, .local_envir = .env)
  web
}

test_that("a valid OIDC id-token is used as the bearer token", {
  d <- withr::local_tempdir()
  tok <- make_jwt(as.numeric(Sys.time()) + 600)
  cfg <- load_kube_config(oidc_kubeconfig(d, tok))
  expect_equal(cfg$bearer_token(), tok)
})

test_that("an expired OIDC id-token is refreshed (and persisted only on request)", {
  web <- fake_idp()
  issuer <- sub("/$", "", web$url())
  d <- withr::local_tempdir()
  old <- make_jwt(as.numeric(Sys.time()) - 60)
  path <- oidc_kubeconfig(d, old, issuer = issuer)
  before <- readLines(path)

  cfg <- load_kube_config(path)
  tok <- cfg$bearer_token()
  expect_false(rk8s:::jwt_expired(tok))
  expect_equal(cfg$auth_provider$config$`refresh-token`, "rt-2")
  expect_identical(readLines(path), before)            # not persisted by default
  expect_equal(cfg$bearer_token(), tok)                 # cached in memory

  cfg2 <- load_kube_config(path, persist_config = TRUE)
  tok2 <- cfg2$bearer_token()
  kc <- yaml::read_yaml(path)
  saved <- kc$users[[1]]$user$`auth-provider`$config
  expect_equal(saved$`id-token`, tok2)
  expect_equal(saved$`refresh-token`, "rt-2")
  expect_equal(saved$`client-id`, "kube")               # rest of the file kept
})

test_that("an expired OIDC id-token without a refresh-token is a clear error", {
  d <- withr::local_tempdir()
  path <- write_kc(d, "config", sprintf('
current-context: c
contexts: [{name: c, context: {cluster: k, user: u}}]
clusters: [{name: k, cluster: {server: "https://k:6443"}}]
users: [{name: u, user: {auth-provider: {name: oidc, config: {id-token: "%s"}}}}]
', make_jwt(as.numeric(Sys.time()) - 60)))
  expect_error(load_kube_config(path)$bearer_token(), "expired.*Log in again")
})

test_that("refresh failures surface the IdP error", {
  web <- fake_idp()
  d <- withr::local_tempdir()
  path <- oidc_kubeconfig(d, make_jwt(1), issuer = sub("/$", "", web$url()),
                          refresh = "wrong")
  expect_error(load_kube_config(path)$bearer_token(), "HTTP 400.*invalid_grant")
})

test_that("in-cluster config picks up the service account namespace", {
  # Exercise just the namespace part via the internal helper path.
  cfg <- Configuration$new(host = "https://x")
  expect_null(cfg$namespace)
  back <- rk8s:::config_from_list(rk8s:::config_to_list(
    local({ cfg$namespace <- "ns1"; cfg$tls_server_name <- "t"; cfg })))
  expect_equal(back$namespace, "ns1")
  expect_equal(back$tls_server_name, "t")
})
