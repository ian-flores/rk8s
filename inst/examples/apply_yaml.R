#!/usr/bin/env Rscript
# Apply a multi-document YAML manifest. Routes each document to the right
# endpoint via DynamicClient, like `kubectl apply -f`.

library(rk8s)

manifest <- '
apiVersion: v1
kind: ConfigMap
metadata: {name: demo-cm}
data: {hello: world}
---
apiVersion: v1
kind: Service
metadata: {name: demo-svc}
spec:
  selector: {app: demo}
  ports:
    - {port: 80, targetPort: 8080}
'

client <- new_client_from_config()
results <- create_from_yaml(client, yaml_string = manifest, namespace = "default")
for (r in results) message("Created: ", r$kind, "/", r$metadata$name)
