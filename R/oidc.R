# OIDC `auth-provider` support for kubeconfig users:
#
#   users:
#   - name: me
#     user:
#       auth-provider:
#         name: oidc
#         config:
#           client-id: ...
#           client-secret: ...            # optional
#           id-token: <JWT>
#           refresh-token: ...            # optional
#           idp-issuer-url: https://issuer.example.com
#           idp-certificate-authority: /path/ca.pem          # optional
#           idp-certificate-authority-data: <base64 PEM>     # optional
#
# The id-token is sent as the bearer token. When it is expired (or within 10
# seconds of expiring) and a refresh-token is available, a new one is fetched
# from the issuer's token endpoint (found via OpenID discovery). With
# `persist_config = TRUE` the refreshed tokens are written back to the
# kubeconfig file that defined the user. Mirrors the Python client's
# `kubernetes.config.kube_config._load_oid_token`.

oidc_id_token <- function(cfg) {
  ap <- cfg$auth_provider
  conf <- ap$config
  tok <- conf[["id-token"]]
  if (!is.null(tok) && nzchar(tok) && !jwt_expired(tok)) return(tok)

  if (is.null(conf[["refresh-token"]]) || is.null(conf[["idp-issuer-url"]])) {
    stop("OIDC id-token for kubeconfig user '", ap$user_name %||% "?",
         "' is ", if (is.null(tok) || !nzchar(tok)) "missing" else "expired",
         " and there is no refresh-token/idp-issuer-url to renew it. ",
         "Log in again (or use an exec plugin such as kubelogin).",
         call. = FALSE)
  }
  fresh <- oidc_refresh(conf, base_dir = ap$base_dir %||% getwd())
  conf[["id-token"]] <- fresh$id_token
  if (!is.null(fresh$refresh_token)) conf[["refresh-token"]] <- fresh$refresh_token
  ap$config <- conf
  cfg$auth_provider <- ap
  if (!is.null(ap$kubeconfig)) {
    tryCatch(persist_oidc_tokens(ap$kubeconfig, ap$user_name, conf),
             error = function(e) warning("could not persist refreshed OIDC ",
                                         "token: ", conditionMessage(e),
                                         call. = FALSE))
  }
  fresh$id_token
}

oidc_refresh <- function(conf, base_dir) {
  ca <- materialize_pem(conf[["idp-certificate-authority"]],
                        conf[["idp-certificate-authority-data"]],
                        base_dir, suffix = "idp-ca.crt")
  with_ca <- function(req) {
    if (is.null(ca)) req else httr2::req_options(req, cainfo = ca)
  }
  issuer <- sub("/$", "", conf[["idp-issuer-url"]])
  disco <- httr2::resp_body_json(httr2::req_perform(with_ca(
    httr2::request(paste0(issuer, "/.well-known/openid-configuration")))))
  if (is.null(disco$token_endpoint)) {
    stop("OIDC discovery for ", issuer, " returned no token_endpoint",
         call. = FALSE)
  }
  form <- drop_nulls(list(
    grant_type = "refresh_token",
    refresh_token = conf[["refresh-token"]],
    client_id = conf[["client-id"]],
    client_secret = conf[["client-secret"]]
  ))
  req <- with_ca(httr2::request(disco$token_endpoint))
  req <- do.call(httr2::req_body_form, c(list(req), form))
  req <- httr2::req_error(req, is_error = function(resp) FALSE)
  resp <- httr2::req_perform(req)
  body <- tryCatch(httr2::resp_body_json(resp), error = function(e) list())
  if (httr2::resp_status(resp) >= 400 || is.null(body$id_token)) {
    stop("OIDC token refresh failed (HTTP ", httr2::resp_status(resp), "): ",
         body$error_description %||% body$error %||% "no id_token in response",
         call. = FALSE)
  }
  list(id_token = body$id_token, refresh_token = body$refresh_token)
}

# TRUE if the JWT's `exp` claim is in the past (or within `skew` seconds).
# Tokens without a readable `exp` are treated as not expired; the API server
# will reject them if they are.
jwt_expired <- function(token, skew = 10) {
  parts <- strsplit(token, ".", fixed = TRUE)[[1]]
  if (length(parts) < 2) return(FALSE)
  payload <- tryCatch({
    b64 <- chartr("-_", "+/", parts[2])
    b64 <- paste0(b64, strrep("=", (4 - nchar(b64) %% 4) %% 4))
    jsonlite::fromJSON(rawToChar(base64enc::base64decode(b64)))
  }, error = function(e) NULL)
  exp <- suppressWarnings(as.numeric(payload$exp))
  if (length(exp) != 1 || is.na(exp)) return(FALSE)
  as.numeric(Sys.time()) + skew >= exp
}

persist_oidc_tokens <- function(path, user_name, conf) {
  kc <- yaml::read_yaml(path)
  for (i in seq_along(kc$users)) {
    if (identical(kc$users[[i]]$name, user_name)) {
      kc$users[[i]]$user[["auth-provider"]]$config[["id-token"]] <- conf[["id-token"]]
      if (!is.null(conf[["refresh-token"]])) {
        kc$users[[i]]$user[["auth-provider"]]$config[["refresh-token"]] <-
          conf[["refresh-token"]]
      }
    }
  }
  tmp <- tempfile(tmpdir = dirname(path))
  yaml::write_yaml(kc, tmp)
  Sys.chmod(tmp, "0600")
  file.rename(tmp, path)
}
