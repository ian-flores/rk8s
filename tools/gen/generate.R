#!/usr/bin/env Rscript
# OpenAPI -> R code generator for rk8s.
#
# Reads a Kubernetes OpenAPI v2 (swagger) JSON spec and emits:
#
#   R/gen/models/<V1Pod>.R        one R6 class per definition
#   R/gen/apis/<CoreV1Api>.R      one R6 class per tag, with one method per op
#   R/gen/zz_exports.R            @export tags for roxygen / NAMESPACE
#
# Run:
#   Rscript tools/gen/generate.R [path/to/swagger.json] [output-dir]
#
# Defaults: spec = tools/gen/spec/swagger.json; output-dir = R/gen/.
#
# This mirrors what kubernetes-client/gen + openapi-generator produce for the
# Python client. Do NOT hand-edit files under R/gen/; edit the templates here
# and regenerate.

suppressPackageStartupMessages({
  library(jsonlite)
})

args <- commandArgs(trailingOnly = TRUE)
spec_path <- if (length(args) >= 1) args[[1]] else "tools/gen/spec/swagger.json"
# R packages don't recurse into subdirectories of R/ — everything must sit
# directly in R/. Generated files are prefixed "gen_" so they sort after the
# hand-written runtime and are easy to clean up.
out_dir   <- if (length(args) >= 2) args[[2]] else "R"

`%||%` <- function(x, y) if (is.null(x)) y else x

# Resolve the directory containing this script regardless of how it's invoked
# (Rscript, source(), R CMD BATCH). Fall back to CWD/tools/gen.
script_dir <- local({
  ca <- commandArgs(trailingOnly = FALSE)
  f <- sub("^--file=", "", grep("^--file=", ca, value = TRUE))
  if (length(f)) normalizePath(dirname(f[1]))
  else if (!is.null(sys.frame(1)$ofile)) normalizePath(dirname(sys.frame(1)$ofile))
  else file.path(getwd(), "tools", "gen")
})
source(file.path(script_dir, "lib.R"))

main <- function(spec_path, out_dir) {
  cat(sprintf("[gen] reading %s\n", spec_path))
  spec <- jsonlite::fromJSON(spec_path, simplifyVector = FALSE)

  dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)
  # Wipe previously-generated files so renames and removals are reflected.
  old <- list.files(out_dir, pattern = "^gen_", full.names = TRUE)
  file.remove(old)

  name_map <- build_name_map(spec$definitions)
  if (length(unique(unlist(name_map))) != length(name_map)) {
    dups <- name_map[duplicated(unlist(name_map)) | duplicated(unlist(name_map), fromLast = TRUE)]
    stop("Duplicate short names after normalization: ",
         paste(names(dups), "->", unlist(dups), collapse = "; "))
  }

  cat(sprintf("[gen] %d definitions\n", length(spec$definitions)))
  exports <- character()
  for (fq in names(spec$definitions)) {
    short <- name_map[[fq]]
    code <- emit_model(short, spec$definitions[[fq]], name_map)
    writeLines(code, file.path(out_dir, paste0("gen_model_", short, ".R")))
    exports <- c(exports, short)
  }

  ops_by_tag <- group_operations_by_tag(spec$paths)
  cat(sprintf("[gen] %d API tags, %d operations\n",
              length(ops_by_tag), sum(vapply(ops_by_tag, length, integer(1)))))

  for (tag in names(ops_by_tag)) {
    cls <- api_class_name(tag)
    code <- emit_api(cls, ops_by_tag[[tag]], name_map)
    writeLines(code, file.path(out_dir, paste0("gen_api_", cls, ".R")))
    exports <- c(exports, cls)
  }

  update_namespace("NAMESPACE", exports)
  cat(sprintf("[gen] wrote %d models + %d api classes to %s\n",
              length(spec$definitions), length(ops_by_tag), out_dir))
}

main(spec_path, out_dir)
