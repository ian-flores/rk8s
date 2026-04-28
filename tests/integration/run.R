#!/usr/bin/env Rscript
# Run rk8s integration tests against a real Kubernetes cluster.
#
# Skipped by default. Set RK8S_E2E=1 (and have a working KUBECONFIG pointing
# at a fresh cluster — kind is fine) to enable.
#
# Used by .github/workflows/integration.yaml.

if (!nzchar(Sys.getenv("RK8S_E2E"))) {
  message("RK8S_E2E not set; skipping integration tests.")
  quit(status = 0)
}

library(testthat)
library(rk8s)

# Locate this file's directory regardless of how it's invoked.
script_dir <- local({
  ca <- commandArgs(trailingOnly = FALSE)
  f <- sub("^--file=", "", grep("^--file=", ca, value = TRUE))
  if (length(f)) normalizePath(dirname(f[1]))
  else file.path(getwd(), "tests", "integration")
})

reporter <- if (nzchar(Sys.getenv("CI"))) "progress" else "summary"
res <- test_dir(
  script_dir,
  reporter = reporter,
  stop_on_failure = TRUE
)
