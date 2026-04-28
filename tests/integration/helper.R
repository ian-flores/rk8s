# Integration-test helpers.

# Bridge a cert-authed kube() to a bearer-token ApiClient by minting a
# TokenRequest for a cluster-admin ServiceAccount. Needed because the R
# `websocket` package's TLS configuration doesn't yet expose
# clientCertificate/clientKey, so exec/port-forward must be authenticated
# by token. The cert-authed client is fully capable of creating the SA,
# the binding, and minting the token — we just exchange one credential
# for another.
#
# Returns an ApiClient. Cleanup is left to the test caller (or to cluster
# teardown).
mint_token_client <- function(k, sa_name = "rk8s-test",
                                sa_namespace = "default") {
  # Ensure ServiceAccount exists (idempotent via SSA).
  rk8s::kube_apply(k, list(
    apiVersion = "v1", kind = "ServiceAccount",
    metadata = list(name = sa_name, namespace = sa_namespace)
  ))
  rk8s::kube_apply(k, list(
    apiVersion = "rbac.authorization.k8s.io/v1", kind = "ClusterRoleBinding",
    metadata = list(name = paste0("rk8s-test-", sa_name)),
    subjects = list(list(kind = "ServiceAccount",
                          name = sa_name, namespace = sa_namespace)),
    roleRef = list(apiGroup = "rbac.authorization.k8s.io",
                    kind = "ClusterRole", name = "cluster-admin")
  ))

  resp <- k$client$call_api(
    resource_path = sprintf("/api/v1/namespaces/%s/serviceaccounts/%s/token",
                             sa_namespace, sa_name),
    method = "POST",
    body = list(
      apiVersion = "authentication.k8s.io/v1",
      kind = "TokenRequest",
      spec = list(expirationSeconds = 3600L)
    )
  )
  token <- resp$status$token
  if (is.null(token) || !nzchar(token))
    stop("TokenRequest returned no token", call. = FALSE)

  cfg_old <- k$client$configuration
  cfg_new <- rk8s::Configuration$new(
    host = cfg_old$host,
    api_key = list(authorization = paste("Bearer", token)),
    ssl_ca_cert = cfg_old$ssl_ca_cert,
    verify_ssl = cfg_old$verify_ssl
  )
  rk8s::ApiClient$new(cfg_new)
}
