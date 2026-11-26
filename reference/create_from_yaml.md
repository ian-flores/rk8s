# Create one or more Kubernetes resources from a YAML manifest

Accepts a path or a character string containing one or more YAML
documents (separated by `---`). Each document is routed to the correct
endpoint via the
[DynamicClient](https://ian-flores.github.io/rk8s/reference/DynamicClient.md).
Mirrors `kubernetes.utils.create_from_yaml`.

## Usage

``` r
create_from_yaml(
  client,
  yaml_file = NULL,
  yaml_string = NULL,
  namespace = "default"
)
```

## Arguments

- client:

  An
  [ApiClient](https://ian-flores.github.io/rk8s/reference/ApiClient.md).

- yaml_file:

  Path to a YAML file; mutually exclusive with `yaml_string`.

- yaml_string:

  A character string of YAML content.

- namespace:

  Default namespace for namespaced resources that don't specify one.
  Defaults to "default".

## Value

A list of server responses, one per document.

## Examples

``` r
if (FALSE) { # \dontrun{
client <- new_client_from_config()
create_from_yaml(client, yaml_file = "manifest.yaml")
} # }
```
