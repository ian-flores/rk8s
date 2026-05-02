#' Open a Kubernetes session
#'
#' Returns a `Kube` object — a thin wrapper over [ApiClient] and
#' [DynamicClient] that lets you write idiomatic R against the cluster
#' without touching the typed `V1*` model classes:
#'
#' \preformatted{
#' k <- kube()                                   # ~/.kube/config
#' kube_get(k, "pods", namespace = "default")
#' kube_apply(k, "deployment.yaml")
#' kube_logs(k, "nginx-abc", namespace = "default")
#' kube_delete(k, "deployment/nginx", namespace = "default")
#' kube_scale(k, "deployment", "nginx", replicas = 5, namespace = "default")
#' kube_watch(k, "pods", on_event = function(type, obj)
#'              message(type, " ", obj$metadata$name))
#' }
#'
#' This is the high-level surface most users want. The typed classes
#' (`V1Pod`, `CoreV1Api`, …) and the [DynamicClient] still work and are
#' there when you need them — `Kube` is built on top of both.
#'
#' Resource references can be:
#' * a kind alias: `"pod"`, `"pods"`, `"po"`, `"deployment"`, `"deploy"`,
#'   `"svc"`, …
#' * `"kind/name"`: `"deployment/nginx"`
#' * an explicit `apiVersion+kind`: `"apps/v1:Deployment"`
#' * a `c(api_version, kind)` vector: `c("apps/v1", "Deployment")`
#'
#' @param config_file Passed to [load_kube_config()].
#' @param context Passed to [load_kube_config()].
#' @param namespace Default namespace for verbs that take one.
#' @param client Optional pre-built [ApiClient]. When given, `config_file`
#'   and `context` are ignored.
#' @param field_manager Field manager used by [kube_apply()] (defaults to
#'   `"rk8s"`).
#' @return A `Kube` object.
#' @rdname Kube
#' @export
kube <- function(config_file = NULL, context = NULL, namespace = "default",
                  client = NULL, field_manager = "rk8s") {
  if (is.null(client)) {
    client <- ApiClient$new(load_kube_config(config_file, context))
  }
  Kube$new(client, namespace = namespace, field_manager = field_manager)
}

#' Kube — high-level Kubernetes session
#'
#' Constructed via [kube()]. Carries an [ApiClient], a [DynamicClient],
#' a default namespace, and a kind-to-resource alias table.
#'
#' Usually you don't call `Kube` methods directly; use the `kube_*` verbs
#' which dispatch into here.
#'
#' @name Kube
#' @rdname Kube
#' @export
Kube <- R6::R6Class(
  "Kube",
  public = list(
    #' @field client The backing [ApiClient].
    client = NULL,
    #' @field dynamic The backing [DynamicClient].
    dynamic = NULL,
    #' @field namespace Default namespace.
    namespace = "default",
    #' @field field_manager Field manager used by `kube_apply()`.
    field_manager = "rk8s",

    #' @description
    #' @param client An [ApiClient].
    #' @param namespace Default namespace.
    #' @param field_manager Field manager.
    initialize = function(client, namespace = "default",
                          field_manager = "rk8s") {
      self$client <- client
      self$dynamic <- DynamicClient$new(client)
      self$namespace <- namespace
      self$field_manager <- field_manager
    },

    #' @description Resolve a resource ref to a `DynamicResource`.
    #'   Accepts: `"pod"`, `"pods"`, `"po"`, `"deployment/nginx"` (name is
    #'   captured separately via `parse_ref`), `"apps/v1:Deployment"`, or
    #'   a `c(api_version, kind)` vector.
    #' @param ref Resource reference.
    resource = function(ref) {
      r <- parse_ref(ref)
      gv <- private$gvk_for(r$alias %||% r$api_version_kind)
      self$dynamic$resource(api_version = gv$apiVersion, kind = gv$kind)
    },

    #' @description Parse `ref` and return both the resource and a name (if
    #'   one was embedded as `"kind/name"`).
    #' @param ref Resource reference.
    resource_and_name = function(ref) {
      r <- parse_ref(ref)
      gv <- private$gvk_for(r$alias %||% r$api_version_kind)
      list(
        resource = self$dynamic$resource(api_version = gv$apiVersion, kind = gv$kind),
        name = r$name
      )
    }
  ),

  private = list(
    # Resolve a kind alias (e.g. "po", "deployment", "ing") to {apiVersion, kind}.
    gvk_for = function(x) {
      if (is.list(x) && !is.null(x$apiVersion) && !is.null(x$kind)) return(x)
      key <- tolower(as.character(x))
      hit <- KIND_ALIASES[[key]]
      if (!is.null(hit)) return(hit)
      stop("Unknown resource: '", x,
           "'. Pass an explicit apiVersion+kind, e.g. \"apps/v1:Deployment\", ",
           "or extend rk8s:::KIND_ALIASES.", call. = FALSE)
    }
  )
)

# Parse a resource ref string. Returns a list with:
#   * alias                — short name like "pods" (if user gave just a kind)
#   * api_version_kind     — list(apiVersion, kind) (if user gave an explicit GVK)
#   * name                 — element after `/`, if present
parse_ref <- function(ref) {
  if (is.null(ref)) stop("ref is NULL", call. = FALSE)
  if (is.list(ref) && !is.null(ref$apiVersion) && !is.null(ref$kind)) {
    return(list(api_version_kind = ref, name = NULL))
  }
  if (length(ref) == 2 && !is.null(names(ref)) == FALSE && is.character(ref)) {
    return(list(api_version_kind = list(apiVersion = ref[[1]], kind = ref[[2]]),
                name = NULL))
  }
  s <- as.character(ref)
  name <- NULL
  if (grepl("/", s, fixed = TRUE) && !grepl(":", s, fixed = TRUE)) {
    parts <- strsplit(s, "/", fixed = TRUE)[[1]]
    s <- parts[1]; name <- parts[2]
  }
  if (grepl(":", s, fixed = TRUE)) {
    parts <- strsplit(s, ":", fixed = TRUE)[[1]]
    return(list(api_version_kind = list(apiVersion = parts[1], kind = parts[2]),
                name = name))
  }
  list(alias = s, name = name)
}

# Built-in alias table for the most-used resources. Mirrors `kubectl api-resources
# -o wide` for the core API plus the common workload + networking + RBAC
# resources. Group-version is pinned to the stable choice; users on older or
# bleeding-edge clusters can override via `kube$dynamic$resource(...)`.
KIND_ALIASES <- local({
  e <- list()
  add <- function(a, ...) {
    out <- list(...)
    for (al in a) e[[al]] <<- out  # `<<-` so the outer `e` is mutated, not a
                                    # function-local copy.
  }

  # core/v1
  add(c("pod", "pods", "po"),                       apiVersion = "v1", kind = "Pod")
  add(c("service", "services", "svc"),              apiVersion = "v1", kind = "Service")
  add(c("namespace", "namespaces", "ns"),           apiVersion = "v1", kind = "Namespace")
  add(c("node", "nodes", "no"),                     apiVersion = "v1", kind = "Node")
  add(c("configmap", "configmaps", "cm"),           apiVersion = "v1", kind = "ConfigMap")
  add(c("secret", "secrets"),                       apiVersion = "v1", kind = "Secret")
  add(c("event", "events", "ev"),                   apiVersion = "v1", kind = "Event")
  add(c("endpoint", "endpoints", "ep"),             apiVersion = "v1", kind = "Endpoints")
  add(c("serviceaccount", "serviceaccounts", "sa"), apiVersion = "v1", kind = "ServiceAccount")
  add(c("persistentvolume", "persistentvolumes", "pv"),
      apiVersion = "v1", kind = "PersistentVolume")
  add(c("persistentvolumeclaim", "persistentvolumeclaims", "pvc"),
      apiVersion = "v1", kind = "PersistentVolumeClaim")
  add(c("resourcequota", "resourcequotas", "quota"), apiVersion = "v1", kind = "ResourceQuota")
  add(c("limitrange", "limitranges", "limits"),     apiVersion = "v1", kind = "LimitRange")
  add(c("replicationcontroller", "replicationcontrollers", "rc"),
      apiVersion = "v1", kind = "ReplicationController")

  # apps/v1
  add(c("deployment", "deployments", "deploy"),     apiVersion = "apps/v1", kind = "Deployment")
  add(c("statefulset", "statefulsets", "sts"),      apiVersion = "apps/v1", kind = "StatefulSet")
  add(c("daemonset", "daemonsets", "ds"),           apiVersion = "apps/v1", kind = "DaemonSet")
  add(c("replicaset", "replicasets", "rs"),         apiVersion = "apps/v1", kind = "ReplicaSet")

  # batch/v1
  add(c("job", "jobs"),                             apiVersion = "batch/v1", kind = "Job")
  add(c("cronjob", "cronjobs", "cj"),               apiVersion = "batch/v1", kind = "CronJob")

  # networking.k8s.io/v1
  add(c("ingress", "ingresses", "ing"),
      apiVersion = "networking.k8s.io/v1", kind = "Ingress")
  add(c("ingressclass", "ingressclasses"),
      apiVersion = "networking.k8s.io/v1", kind = "IngressClass")
  add(c("networkpolicy", "networkpolicies", "netpol"),
      apiVersion = "networking.k8s.io/v1", kind = "NetworkPolicy")

  # rbac.authorization.k8s.io/v1
  add(c("role", "roles"),
      apiVersion = "rbac.authorization.k8s.io/v1", kind = "Role")
  add(c("rolebinding", "rolebindings"),
      apiVersion = "rbac.authorization.k8s.io/v1", kind = "RoleBinding")
  add(c("clusterrole", "clusterroles"),
      apiVersion = "rbac.authorization.k8s.io/v1", kind = "ClusterRole")
  add(c("clusterrolebinding", "clusterrolebindings"),
      apiVersion = "rbac.authorization.k8s.io/v1", kind = "ClusterRoleBinding")

  # autoscaling/v2
  add(c("horizontalpodautoscaler", "horizontalpodautoscalers", "hpa"),
      apiVersion = "autoscaling/v2", kind = "HorizontalPodAutoscaler")

  # policy/v1
  add(c("poddisruptionbudget", "poddisruptionbudgets", "pdb"),
      apiVersion = "policy/v1", kind = "PodDisruptionBudget")

  # storage.k8s.io/v1
  add(c("storageclass", "storageclasses", "sc"),
      apiVersion = "storage.k8s.io/v1", kind = "StorageClass")

  # apiextensions.k8s.io/v1
  add(c("customresourcedefinition", "customresourcedefinitions", "crd"),
      apiVersion = "apiextensions.k8s.io/v1", kind = "CustomResourceDefinition")

  e
})
