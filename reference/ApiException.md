# Kubernetes API exception

Kubernetes API exception

Kubernetes API exception

## Details

Condition raised for non-2xx responses from the Kubernetes API. Carries
the HTTP status code, reason phrase, response headers, and parsed body
(a `metav1.Status` object when the server returned one).

Typed API methods raise `rk8s_api_error` conditions whose `$exception`
field is an `ApiException`. Catch with
[`tryCatch()`](https://rdrr.io/r/base/conditions.html).

## Public fields

- `status`:

  Integer HTTP status code.

- `reason`:

  HTTP reason phrase.

- `headers`:

  Named list of response headers.

- `body`:

  Raw response body (character).

- `status_obj`:

  Parsed `metav1.Status`, or `NULL` if body wasn't JSON.

## Methods

### Public methods

- [`ApiException$new()`](#method-ApiException-new)

- [`ApiException$format()`](#method-ApiException-format)

- [`ApiException$clone()`](#method-ApiException-clone)

------------------------------------------------------------------------

### Method `new()`

Construct an ApiException.

#### Usage

    ApiException$new(
      status = NA_integer_,
      reason = NA_character_,
      headers = list(),
      body = ""
    )

#### Arguments

- `status`:

  HTTP status code.

- `reason`:

  HTTP reason phrase.

- `headers`:

  Named list of headers.

- `body`:

  Response body (character or raw).

------------------------------------------------------------------------

### Method [`format()`](https://rdrr.io/r/base/format.html)

Render a human-readable message.

#### Usage

    ApiException$format()

------------------------------------------------------------------------

### Method `clone()`

The objects of this class are cloneable with this method.

#### Usage

    ApiException$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

## Examples

``` r
if (FALSE) { # \dontrun{
tryCatch(
  CoreV1Api$new(new_client_from_config())$read_namespaced_pod(
    name = "does-not-exist", namespace = "default"),
  rk8s_api_error = function(e) {
    message("API error: ", e$exception$status, " ", e$exception$reason)
  }
)
} # }
```
