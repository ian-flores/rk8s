#!/usr/bin/env Rscript
# List every pod in every namespace. Equivalent to
#   kubectl get pods -A
# or the Python `kubernetes.client.CoreV1Api().list_pod_for_all_namespaces()`.

library(rk8s)

client <- new_client_from_config()
core <- CoreV1Api$new(client)

resp <- core$list_pod_for_all_namespaces()
# `resp` is a named list (server response). Convert to a model if you prefer:
pods <- V1PodList$from_list(resp)

for (p in pods$items) {
  phase <- if (is.null(p$status$phase)) "-" else p$status$phase
  cat(sprintf("%-30s %-40s %s\n", p$metadata$namespace, p$metadata$name, phase))
}
