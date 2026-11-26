# Parse a Kubernetes resource quantity

Converts strings like "100m", "256Mi", "2Gi", "1.5", "500k" into numeric
values. Suffix semantics match
`k8s.io/apimachinery/pkg/api/resource.Quantity`.

## Usage

``` r
parse_quantity(x)
```

## Arguments

- x:

  Character vector of quantity strings.

## Value

Numeric vector of the same length.

## Examples

``` r
parse_quantity(c("100m", "256Mi", "1.5Gi", "2"))
#> [1]          0.1  268435456.0 1610612736.0          2.0
```
