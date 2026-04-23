# Contributing to rk8s

Thanks for your interest. This project aims to be a faithful R port of
the official Kubernetes Python client and Go client-go, so much of the
contribution surface is generated — please read this file before
opening a PR.

## Hand-written vs. generated code

| Path                    | Hand-written?              |
| ----------------------- | -------------------------- |
| `R/client.R`, `R/configuration.R`, `R/config.R`, `R/exceptions.R`, `R/exec_plugin.R`, `R/watch.R`, `R/dynamic.R`, `R/informer.R`, `R/leader_election.R`, `R/utils.R`, `R/rk8s-package.R` | Yes — runtime. |
| `R/gen_model_*.R`, `R/gen_api_*.R` | **Generated.** Do not edit. |
| `tools/gen/`            | Yes — generator and its tests. |
| `tools/gen/spec/swagger.json` | Pinned OpenAPI spec (committed). |
| `NAMESPACE`             | Runtime exports hand-maintained; generated exports live between `# >>> generated exports` / `# <<< generated exports <<<` sentinels and are rewritten by the generator. Do not edit inside the sentinels. |

If you want to change something that looks generated, edit the
generator (`tools/gen/lib.R`) and regenerate. Open the PR with both the
generator change and the regenerated output.

## Setting up

```sh
# One-time: R dependencies
R -e 'install.packages(c("R6","httr2","jsonlite","yaml","openssl","base64enc","curl","testthat","roxygen2","callr","knitr","rmarkdown"))'

# Build + install
R CMD build --no-build-vignettes --no-manual .
R CMD INSTALL rk8s_*.tar.gz
```

## Running tests

```sh
R -e 'testthat::test_dir("tests/testthat")'
```

Tests never touch a real cluster; they hit in-memory wiring only.

## Regenerating from a newer Kubernetes OpenAPI spec

```sh
curl -L -o tools/gen/spec/swagger.json \
  https://raw.githubusercontent.com/kubernetes/kubernetes/release-1.31/api/openapi-spec/swagger.json
Rscript tools/gen/generate.R tools/gen/spec/swagger.json R
R CMD build --no-build-vignettes --no-manual .
```

Commit both `tools/gen/spec/swagger.json` and the regenerated
`R/gen_*.R` / `NAMESPACE` in the same commit so reviewers can tell
what changed upstream.

## Regenerating man pages

We use roxygen2 with the `rd` roclet only — NAMESPACE is **not**
regenerated from roxygen tags (it's generator-managed). Run:

```r
roxygen2::roxygenise(".", roclets = "rd", clean = TRUE)
```

## Style

* 2-space indent, no trailing whitespace.
* Keep the hand-written runtime tight. Follow patterns in existing
  files (`client.R`, `watch.R`) rather than introducing new ones.
* Comments answer "why", not "what". Well-named identifiers cover
  the what.

## PRs

* One logical change per PR.
* Include tests for new runtime behaviour.
* Mention the Kubernetes API / Python / Go equivalent if the behaviour
  is meant to mirror something.

## Code of Conduct

This project follows the [Contributor Covenant](CODE_OF_CONDUCT.md).
