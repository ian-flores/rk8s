#!/usr/bin/env Rscript
# Create an nginx Deployment in the `default` namespace.

library(rk8s)

client <- new_client_from_config()
apps <- AppsV1Api$new(client)

dep <- V1Deployment$new(
  api_version = "apps/v1", kind = "Deployment",
  metadata = V1ObjectMeta$new(name = "nginx"),
  spec = V1DeploymentSpec$new(
    replicas = 3L,
    selector = V1LabelSelector$new(match_labels = list(app = "nginx")),
    template = V1PodTemplateSpec$new(
      metadata = V1ObjectMeta$new(labels = list(app = "nginx")),
      spec = V1PodSpec$new(containers = list(
        V1Container$new(
          name = "nginx", image = "nginx:1.25",
          ports = list(V1ContainerPort$new(container_port = 80L))
        )
      ))
    )
  )
)

resp <- apps$create_namespaced_deployment(namespace = "default", body = dep)
message("Created: ", resp$metadata$name)
