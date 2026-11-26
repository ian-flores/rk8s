# Kubernetes API client

Kubernetes API client

Kubernetes API client

## Details

Low-level transport used by every generated API class. Wraps
[`httr2::request()`](https://httr2.r-lib.org/reference/request.html)
with authentication, TLS, serialization, and error translation. You
rarely call `call_api()` directly; instead, you pass an `ApiClient` into
a typed API class like
[CoreV1Api](https://ian-flores.github.io/rk8s/reference/CoreV1Api.md) or
[AppsV1Api](https://ian-flores.github.io/rk8s/reference/AppsV1Api.md),
or a
[DynamicClient](https://ian-flores.github.io/rk8s/reference/DynamicClient.md).

Mirrors `kubernetes.client.ApiClient` from the Python client and
`rest.RESTClient` from client-go.

## Public fields

- `configuration`:

  The attached
  [Configuration](https://ian-flores.github.io/rk8s/reference/Configuration.md).

- `default_headers`:

  Named list of headers added to every request.

## Methods

### Public methods

- [`ApiClient$new()`](#method-ApiClient-new)

- [`ApiClient$call_api()`](#method-ApiClient-call_api)

- [`ApiClient$select_path()`](#method-ApiClient-select_path)

- [`ApiClient$clone()`](#method-ApiClient-clone)

------------------------------------------------------------------------

### Method `new()`

Construct an ApiClient.

#### Usage

    ApiClient$new(configuration = Configuration$new(), default_headers = list())

#### Arguments

- `configuration`:

  A
  [Configuration](https://ian-flores.github.io/rk8s/reference/Configuration.md)
  (defaults to an empty one).

- `default_headers`:

  Additional headers, as a named list.

------------------------------------------------------------------------

### Method `call_api()`

Perform an HTTP call against the API server.

#### Usage

    ApiClient$call_api(
      resource_path,
      method = "GET",
      path_params = list(),
      query_params = list(),
      header_params = list(),
      body = NULL,
      response_type = NULL,
      content_type = "application/json",
      accept = "application/json",
      stream = FALSE
    )

#### Arguments

- `resource_path`:

  Path portion of the URL (e.g.
  `"/api/v1/namespaces/{namespace}/pods"`).

- `method`:

  HTTP method (GET, POST, PUT, PATCH, DELETE).

- `path_params`:

  Named list of path params substituted into `resource_path`.

- `query_params`:

  Named list of query parameters.

- `header_params`:

  Named list of headers (merged with defaults).

- `body`:

  An R object (serialized as JSON) or a raw/character body.

- `response_type`:

  Either `NULL` (return parsed JSON as a nested list), `"raw"` (return
  raw bytes), `"text"` (return string), or the name of a generated model
  class (return an instance, constructed via `$from_list`).

- `content_type`:

  Content-Type to send (default application/json; use
  `application/merge-patch+json`,
  `application/strategic-merge-patch+json`, or
  `application/json-patch+json` for PATCH variants).

- `accept`:

  Accept header (default application/json).

- `stream`:

  If TRUE, return the raw
  [httr2::response](https://httr2.r-lib.org/reference/response.html)
  without reading the body - used by
  [Watch](https://ian-flores.github.io/rk8s/reference/Watch.md) and
  log-streaming.

------------------------------------------------------------------------

### Method `select_path()`

Substitute `{name}` placeholders in a path template.

#### Usage

    ApiClient$select_path(path_template, path_params = list())

#### Arguments

- `path_template`:

  E.g. `"/api/v1/namespaces/{namespace}/pods/{name}"`.

- `path_params`:

  Named list of replacements.

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    ApiClient$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

## Examples

``` r
if (FALSE) { # \dontrun{
client <- new_client_from_config()
core   <- CoreV1Api$new(client)
core$list_pod_for_all_namespaces()
} # }
```
