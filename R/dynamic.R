#' Dynamic (untyped) Kubernetes client
#'
#' Discovers the API surface at runtime (GVR → REST path) via `/api` and
#' `/apis/*` discovery endpoints and exposes CRUD for any resource, including
#' CustomResourceDefinitions. Mirrors `kubernetes.dynamic.DynamicClient` in the
#' Python client and `dynamic.Interface` in client-go.
#'
#' Discovery is cached on first access.
#'
#' @examples
#' \dontrun{
#' client <- new_client_from_config()
#' dc <- DynamicClient$new(client)
#'
#' # Built-in:
#' pods <- dc$resource("v1", "Pod")
#' pods$list(namespace = "kube-system")
#'
#' # CustomResource:
#' foos <- dc$resource("example.com/v1", "Foo")
#' foos$get("my-foo", namespace = "default")
#' }
#' @export
DynamicClient <- R6::R6Class(
  "DynamicClient",
  public = list(
    #' @field client The underlying [ApiClient].
    client = NULL,

    #' @description
    #' @param client An [ApiClient].
    initialize = function(client) {
      self$client <- client
    },

    #' @description Look up a resource by apiVersion+kind. Returns a
    #'   `DynamicResource` object with `get/list/create/patch/replace/delete`
    #'   methods.
    #' @param api_version E.g. "v1", "apps/v1", "example.com/v1".
    #' @param kind E.g. "Pod", "Deployment", "MyCustomResource".
    resource = function(api_version, kind) {
      info <- private$discover(api_version, kind)
      DynamicResource$new(self$client, info)
    },

    #' @description Invalidate the discovery cache.
    invalidate_cache = function() {
      private$.discovery <- list()
      invisible(self)
    }
  ),

  private = list(
    .discovery = list(),

    discover = function(api_version, kind) {
      key <- api_version
      doc <- private$.discovery[[key]]
      if (is.null(doc)) {
        path <- if (identical(api_version, "v1")) "/api/v1"
                else paste0("/apis/", api_version)
        doc <- self$client$call_api(path, method = "GET")
        private$.discovery[[key]] <- doc
      }
      res <- NULL
      for (r in doc$resources) {
        if (identical(r$kind, kind) && !grepl("/", r$name, fixed = TRUE)) {
          res <- r; break
        }
      }
      if (is.null(res)) {
        stop(sprintf("Resource %s/%s not found in discovery", api_version, kind))
      }
      base <- if (identical(api_version, "v1")) "/api/v1"
              else paste0("/apis/", api_version)
      list(
        api_version = api_version,
        kind = kind,
        name = res$name,
        namespaced = isTRUE(res$namespaced),
        verbs = res$verbs %||% list(),
        base_path = base
      )
    }
  )
)

# Not exported; obtained via DynamicClient$resource().
DynamicResource <- R6::R6Class(
  "DynamicResource",
  public = list(
    client = NULL,
    info = NULL,

    initialize = function(client, info) {
      self$client <- client
      self$info <- info
    },

    list = function(namespace = NULL, label_selector = NULL,
                     field_selector = NULL, ...) {
      path <- private$collection_path(namespace)
      q <- drop_nulls(list(labelSelector = label_selector,
                            fieldSelector = field_selector, ...))
      self$client$call_api(path, "GET", query_params = q)
    },

    get = function(name, namespace = NULL) {
      self$client$call_api(private$item_path(name, namespace), "GET")
    },

    create = function(body, namespace = NULL) {
      self$client$call_api(private$collection_path(namespace), "POST",
                           body = body)
    },

    replace = function(name, body, namespace = NULL) {
      self$client$call_api(private$item_path(name, namespace), "PUT",
                           body = body)
    },

    patch = function(name, body, namespace = NULL,
                      patch_type = "application/merge-patch+json") {
      self$client$call_api(private$item_path(name, namespace), "PATCH",
                           body = body, content_type = patch_type)
    },

    delete = function(name, namespace = NULL, body = NULL) {
      self$client$call_api(private$item_path(name, namespace), "DELETE",
                           body = body)
    },

    watch = function(namespace = NULL, callback, resource_version = NULL,
                      timeout_seconds = NULL, label_selector = NULL) {
      w <- Watch$new()
      q <- drop_nulls(list(labelSelector = label_selector))
      w$stream(self$client,
               resource_path = private$collection_path(namespace),
               query_params = q,
               callback = callback,
               timeout_seconds = timeout_seconds,
               resource_version = resource_version)
      w
    }
  ),

  private = list(
    collection_path = function(namespace) {
      if (isTRUE(self$info$namespaced)) {
        if (is.null(namespace)) namespace <- "default"
        sprintf("%s/namespaces/%s/%s", self$info$base_path, namespace, self$info$name)
      } else {
        sprintf("%s/%s", self$info$base_path, self$info$name)
      }
    },
    item_path = function(name, namespace) {
      paste0(private$collection_path(namespace), "/", name)
    }
  )
)
