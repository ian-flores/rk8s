#!/usr/bin/env Rscript
# Access a CustomResource (or any resource without needing a typed API class)
# via the dynamic client. Discovery determines the REST path from apiVersion+kind.

library(rk8s)

client <- new_client_from_config()
dc <- DynamicClient$new(client)

# Built-in resource via the dynamic client:
pods <- dc$resource("v1", "Pod")
result <- pods$list(namespace = "kube-system")
cat("pods in kube-system:", length(result$items), "\n")

# CustomResource:
# foos <- dc$resource("example.com/v1", "Foo")
# foos$list(namespace = "default")
