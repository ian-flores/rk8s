# Create the files for an operator written in R

Writes a starting point for an operator: an R script that runs a
[Manager](https://ian-flores.github.io/rk8s/reference/Manager.md), a
Dockerfile to build it into an image, and the Kubernetes manifests to
install it (CustomResourceDefinition, RBAC and Deployment).

## Usage

``` r
use_operator(
  path,
  name,
  group,
  kind,
  version = "v1",
  plural = NULL,
  namespace = "default",
  image = NULL,
  replicas = 1L,
  rk8s_source = "github",
  overwrite = FALSE
)
```

## Arguments

- path:

  Directory to write into (created if needed).

- name:

  Operator name, used for the Deployment, ServiceAccount, RBAC objects
  and the leader election Lease. Lowercase letters, digits and `-`.

- group:

  API group of the custom resource, e.g. `"example.com"`.

- kind:

  Kind of the custom resource, e.g. `"Site"`.

- version:

  API version of the custom resource.

- plural:

  Plural resource name (default: lowercase `kind` + "s").

- namespace:

  Namespace to install the operator into.

- image:

  Image name for the Deployment (default `"<name>:dev"`).

- replicas:

  Number of operator replicas; with more than one, leader election keeps
  a single active one.

- rk8s_source:

  Where the image gets rk8s from: `"github"` (the default) or the path
  to a source tarball built with `R CMD build`, which is copied next to
  the Dockerfile.

- overwrite:

  Replace existing files.

## Value

The paths written, invisibly.

## Details

The generated controller watches a new custom resource and, for each
object, keeps a ConfigMap it owns holding the object's `spec` and
records `status.observedGeneration`. Replace the body of `reconcile()`
with your own logic, and extend the RBAC rules if it manages other
resources.

Files written (relative to `path`):

- `operator.R`: the controller. It connects in-cluster when run in a pod
  and through your kubeconfig otherwise, so you can run it locally with
  `Rscript operator.R` while developing.

- `Dockerfile`: builds the image on `rocker/r-ver`.

- `deploy/crd.yaml`, `deploy/rbac.yaml`, `deploy/deployment.yaml`.

Then:

    docker build -t my-operator:dev .
    kubectl apply -f deploy/

(with kind, run `kind load docker-image my-operator:dev` before
applying).

## Examples

``` r
dir <- file.path(tempdir(), "site-operator")
use_operator(dir, name = "site-operator", group = "example.com", kind = "Site")
list.files(dir, recursive = TRUE)
#> [1] "Dockerfile"             "deploy/crd.yaml"        "deploy/deployment.yaml"
#> [4] "deploy/rbac.yaml"       "operator.R"            
```
