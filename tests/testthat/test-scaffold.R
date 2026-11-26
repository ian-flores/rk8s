read_docs <- function(path) {
  docs <- strsplit(paste(readLines(path), collapse = "\n"), "\n---\n", fixed = TRUE)[[1]]
  lapply(docs, yaml::yaml.load)
}

test_that("use_operator() writes a consistent set of files", {
  dir <- withr::local_tempdir()
  paths <- use_operator(dir, name = "site-operator", group = "example.com",
                        kind = "Site", namespace = "ops", replicas = 2)
  expect_setequal(basename(paths), c("operator.R", "Dockerfile", "crd.yaml",
                                     "rbac.yaml", "deployment.yaml"))

  crd <- yaml::read_yaml(file.path(dir, "deploy/crd.yaml"))
  expect_equal(crd$metadata$name, "sites.example.com")
  expect_equal(crd$spec$names[c("kind", "plural", "singular")],
               list(kind = "Site", plural = "sites", singular = "site"))
  expect_true("status" %in% names(crd$spec$versions[[1]]$subresources))

  rbac <- read_docs(file.path(dir, "deploy/rbac.yaml"))
  expect_equal(vapply(rbac, `[[`, "", "kind"),
               c("ServiceAccount", "ClusterRole", "ClusterRoleBinding"))
  expect_equal(rbac[[1]]$metadata$namespace, "ops")
  rules <- rbac[[2]]$rules
  res <- unlist(lapply(rules, `[[`, "resources"))
  expect_true(all(c("sites", "sites/status", "configmaps", "events", "leases") %in% res))
  expect_equal(rbac[[3]]$subjects[[1]][c("name", "namespace")],
               list(name = "site-operator", namespace = "ops"))

  dep <- yaml::read_yaml(file.path(dir, "deploy/deployment.yaml"))
  expect_equal(dep$spec$replicas, 2L)
  expect_equal(dep$spec$template$spec$serviceAccountName, "site-operator")
  ctr <- dep$spec$template$spec$containers[[1]]
  expect_equal(ctr$image, "site-operator:dev")
  expect_equal(ctr$livenessProbe$httpGet$path, "/healthz")
  expect_equal(ctr$readinessProbe$httpGet$path, "/readyz")
  expect_equal(ctr$ports[[1]]$containerPort, 8081L)

  op <- readLines(file.path(dir, "operator.R"))
  expect_silent(parse(text = op))
  expect_true(any(grepl('"example.com/v1:Site"', op, fixed = TRUE)))
  expect_true(any(grepl('leader_election = "site-operator"', op, fixed = TRUE)))
  expect_true(any(grepl("health_port = 8081L", op, fixed = TRUE)))
  expect_true(any(grepl("install_github", readLines(file.path(dir, "Dockerfile")))))
  # tini as PID 1, so SIGTERM stops the operator promptly.
  expect_true(any(grepl('ENTRYPOINT ["/usr/bin/tini", "--"]',
                        readLines(file.path(dir, "Dockerfile")), fixed = TRUE)))
})

test_that("use_operator() validates names and refuses to overwrite", {
  dir <- withr::local_tempdir()
  expect_error(use_operator(dir, "Bad_Name", "example.com", "Site"), "DNS label")
  expect_error(use_operator(dir, "op", "example", "Site"), "domain")
  expect_error(use_operator(dir, "op", "example.com", "site"), "CamelCase")
  use_operator(dir, "op", "example.com", "Site")
  expect_error(use_operator(dir, "op", "example.com", "Site"), "already exist")
  expect_no_error(use_operator(dir, "op", "example.com", "Site", overwrite = TRUE))
})

test_that("a local rk8s tarball is copied and installed by the Dockerfile", {
  dir <- withr::local_tempdir()
  tarball <- withr::local_tempfile(fileext = ".tar.gz")
  writeLines("not really a tarball", tarball)
  paths <- use_operator(dir, "op", "example.com", "Site", rk8s_source = tarball)
  expect_true(file.exists(file.path(dir, "rk8s.tar.gz")))
  df <- readLines(file.path(dir, "Dockerfile"))
  expect_true(any(grepl("R CMD INSTALL /tmp/rk8s.tar.gz", df, fixed = TRUE)))
  expect_false(any(grepl("install_github", df)))
  expect_error(use_operator(withr::local_tempdir(), "op", "example.com", "Site",
                            rk8s_source = "/no/such/file.tar.gz"), "tarball")
})
