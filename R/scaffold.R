#' Create the files for an operator written in R
#'
#' Writes a starting point for an operator: an R script that runs a
#' [Manager], a Dockerfile to build it into an image, and the Kubernetes
#' manifests to install it (CustomResourceDefinition, RBAC and Deployment).
#'
#' The generated controller watches a new custom resource and, for each
#' object, keeps a ConfigMap it owns holding the object's `spec` and records
#' `status.observedGeneration`. Replace the body of `reconcile()` with your
#' own logic, and extend the RBAC rules if it manages other resources.
#'
#' Files written (relative to `path`):
#'
#' * `operator.R`: the controller. It connects in-cluster when run in a pod
#'   and through your kubeconfig otherwise, so you can run it locally with
#'   `Rscript operator.R` while developing.
#' * `Dockerfile`: builds the image on `rocker/r-ver`.
#' * `deploy/crd.yaml`, `deploy/rbac.yaml`, `deploy/deployment.yaml`.
#'
#' Then:
#'
#' ```
#' docker build -t my-operator:dev .
#' kubectl apply -f deploy/
#' ```
#'
#' (with kind, run `kind load docker-image my-operator:dev` before applying).
#'
#' @param path Directory to write into (created if needed).
#' @param name Operator name, used for the Deployment, ServiceAccount, RBAC
#'   objects and the leader election Lease. Lowercase letters, digits and
#'   `-`.
#' @param group API group of the custom resource, e.g. `"example.com"`.
#' @param kind Kind of the custom resource, e.g. `"Site"`.
#' @param version API version of the custom resource.
#' @param plural Plural resource name (default: lowercase `kind` + "s").
#' @param namespace Namespace to install the operator into.
#' @param image Image name for the Deployment (default `"<name>:dev"`).
#' @param replicas Number of operator replicas; with more than one, leader
#'   election keeps a single active one.
#' @param rk8s_source Where the image gets rk8s from: `"github"` (the
#'   default) or the path to a source tarball built with `R CMD build`,
#'   which is copied next to the Dockerfile.
#' @param overwrite Replace existing files.
#' @return The paths written, invisibly.
#' @examples
#' dir <- file.path(tempdir(), "site-operator")
#' use_operator(dir, name = "site-operator", group = "example.com", kind = "Site")
#' list.files(dir, recursive = TRUE)
#' @export
use_operator <- function(path, name, group, kind, version = "v1",
                         plural = NULL, namespace = "default", image = NULL,
                         replicas = 1L, rk8s_source = "github",
                         overwrite = FALSE) {
  dns_label <- "^[a-z0-9]([-a-z0-9]*[a-z0-9])?$"
  if (!grepl(dns_label, name) || nchar(name) > 63) {
    stop("`name` must be lowercase letters, digits and '-' (a DNS label)",
         call. = FALSE)
  }
  if (!grepl(".", group, fixed = TRUE)) {
    stop("`group` must be a domain such as \"example.com\"", call. = FALSE)
  }
  if (!grepl("^[A-Z][A-Za-z0-9]*$", kind)) {
    stop("`kind` must be CamelCase, e.g. \"Site\"", call. = FALSE)
  }
  plural <- plural %||% paste0(tolower(kind), "s")
  image <- image %||% paste0(name, ":dev")
  local_tarball <- !identical(rk8s_source, "github")
  if (local_tarball && !file.exists(rk8s_source)) {
    stop("`rk8s_source` must be \"github\" or an existing tarball path",
         call. = FALSE)
  }

  vars <- list(name = name, group = group, kind = kind, version = version,
               plural = plural, singular = tolower(kind), namespace = namespace,
               image = image, replicas = as.integer(replicas),
               ref = sprintf("%s/%s:%s", group, version, kind))
  files <- list(
    "operator.R" = template_operator,
    "Dockerfile" = if (local_tarball) template_dockerfile_local
                   else template_dockerfile_github,
    "deploy/crd.yaml" = template_crd,
    "deploy/rbac.yaml" = template_rbac,
    "deploy/deployment.yaml" = template_deployment
  )
  targets <- file.path(path, names(files))
  if (!overwrite && any(file.exists(targets))) {
    stop("These files already exist (use overwrite = TRUE): ",
         paste(targets[file.exists(targets)], collapse = ", "), call. = FALSE)
  }
  dir.create(file.path(path, "deploy"), recursive = TRUE, showWarnings = FALSE)
  for (i in seq_along(files)) {
    writeLines(fill_template(files[[i]], vars), targets[[i]])
  }
  if (local_tarball) {
    dest <- file.path(path, "rk8s.tar.gz")
    file.copy(rk8s_source, dest, overwrite = TRUE)
    targets <- c(targets, dest)
  }
  invisible(targets)
}

# Replace {{var}} placeholders.
fill_template <- function(text, vars) {
  for (nm in names(vars)) {
    text <- gsub(paste0("{{", nm, "}}"), as.character(vars[[nm]]), text,
                 fixed = TRUE)
  }
  if (grepl("{{", text, fixed = TRUE)) {
    stop("unfilled template placeholder", call. = FALSE)
  }
  text
}

template_operator <- '# {{name}}: an operator for {{ref}} objects, written with rk8s.
#
# For each {{kind}}, keep a ConfigMap "<name>-spec" holding the object\'s spec,
# and record status.observedGeneration. Replace reconcile() with your logic.
library(rk8s)

k <- if (nzchar(Sys.getenv("KUBERNETES_SERVICE_HOST"))) {
  kube(client = ApiClient$new(load_incluster_config()))   # running in a pod
} else {
  kube()                                                   # local development
}

reconcile <- function(req, k) {
  obj <- tryCatch(
    kube_get(k, "{{ref}}", req$name, namespace = req$namespace),
    rk8s_api_error = function(e) {
      if (e$exception$status == 404L) NULL else stop(e)
    })
  # Deleted: the ConfigMap is garbage-collected through its owner reference.
  if (is.null(obj)) return(NULL)

  spec <- as.character(jsonlite::toJSON(obj$spec, auto_unbox = TRUE, null = "null"))
  config <- list(
    apiVersion = "v1", kind = "ConfigMap",
    metadata = list(name = paste0(req$name, "-spec")),
    data = list(spec = spec))
  kube_apply(k, set_owner(config, obj), force = TRUE)

  if (!identical(obj$status$observedGeneration, obj$metadata$generation)) {
    kube_patch_status(k, obj, list(observedGeneration = obj$metadata$generation))
    kube_event(k, obj, "Reconciled", paste("updated ConfigMap", config$metadata$name))
  }
  NULL
}

mgr <- Manager$new(k)
mgr$controller("{{ref}}", owns = "configmaps", reconcile = reconcile)
message("{{name}} starting")
mgr$run(leader_election = "{{name}}", health_port = 8081L)
'

template_dockerfile_github <- '# Build: docker build -t {{image}} .
FROM rocker/r-ver:4.5.2
RUN apt-get update && apt-get install -y --no-install-recommends tini \\
 && rm -rf /var/lib/apt/lists/*
RUN install2.r --error --skipinstalled remotes nanonext callr \\
 && Rscript -e \'remotes::install_github("ian-flores/rk8s", upgrade = "never")\'
COPY operator.R /app/operator.R
USER 65534
# tini runs as PID 1 and forwards SIGTERM to R. Without it, R is PID 1, the
# kernel ignores SIGTERM, and every pod deletion waits out the full grace
# period (delaying leader failover by ~30s).
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["Rscript", "/app/operator.R"]
'

template_dockerfile_local <- '# Build: docker build -t {{image}} .
# Installs rk8s from the rk8s.tar.gz next to this file.
FROM rocker/r-ver:4.5.2
RUN apt-get update && apt-get install -y --no-install-recommends tini \\
 && rm -rf /var/lib/apt/lists/*
RUN install2.r --error --skipinstalled R6 curl httr2 jsonlite yaml openssl \\
      base64enc nanonext callr
COPY rk8s.tar.gz /tmp/rk8s.tar.gz
RUN R CMD INSTALL /tmp/rk8s.tar.gz && rm /tmp/rk8s.tar.gz
COPY operator.R /app/operator.R
USER 65534
# tini runs as PID 1 and forwards SIGTERM to R. Without it, R is PID 1, the
# kernel ignores SIGTERM, and every pod deletion waits out the full grace
# period (delaying leader failover by ~30s).
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["Rscript", "/app/operator.R"]
'

template_crd <- 'apiVersion: apiextensions.k8s.io/v1
kind: CustomResourceDefinition
metadata:
  name: {{plural}}.{{group}}
spec:
  group: {{group}}
  scope: Namespaced
  names:
    kind: {{kind}}
    plural: {{plural}}
    singular: {{singular}}
  versions:
  - name: {{version}}
    served: true
    storage: true
    subresources:
      status: {}
    schema:
      openAPIV3Schema:
        type: object
        properties:
          spec:
            type: object
            x-kubernetes-preserve-unknown-fields: true
          status:
            type: object
            x-kubernetes-preserve-unknown-fields: true
'

template_rbac <- 'apiVersion: v1
kind: ServiceAccount
metadata:
  name: {{name}}
  namespace: {{namespace}}
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: {{name}}
rules:
- apiGroups: ["{{group}}"]
  resources: ["{{plural}}"]
  verbs: ["get", "list", "watch", "update", "patch"]
- apiGroups: ["{{group}}"]
  resources: ["{{plural}}/status"]
  verbs: ["get", "update", "patch"]
- apiGroups: [""]
  resources: ["configmaps"]
  verbs: ["get", "list", "watch", "create", "update", "patch", "delete"]
- apiGroups: [""]
  resources: ["events"]
  verbs: ["create", "patch"]
- apiGroups: ["coordination.k8s.io"]
  resources: ["leases"]
  verbs: ["get", "create", "update"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: {{name}}
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: {{name}}
subjects:
- kind: ServiceAccount
  name: {{name}}
  namespace: {{namespace}}
'

template_deployment <- 'apiVersion: apps/v1
kind: Deployment
metadata:
  name: {{name}}
  namespace: {{namespace}}
  labels:
    app: {{name}}
spec:
  replicas: {{replicas}}
  selector:
    matchLabels:
      app: {{name}}
  template:
    metadata:
      labels:
        app: {{name}}
    spec:
      serviceAccountName: {{name}}
      containers:
      - name: operator
        image: {{image}}
        imagePullPolicy: IfNotPresent
        ports:
        - name: health
          containerPort: 8081
        # R takes a few seconds to start and list everything it watches.
        startupProbe:
          httpGet: {path: /healthz, port: health}
          periodSeconds: 2
          failureThreshold: 30
        livenessProbe:
          httpGet: {path: /healthz, port: health}
          periodSeconds: 10
          timeoutSeconds: 5
          failureThreshold: 3
        readinessProbe:
          httpGet: {path: /readyz, port: health}
          periodSeconds: 5
        resources:
          requests: {cpu: 50m, memory: 128Mi}
          limits: {memory: 512Mi}
'
