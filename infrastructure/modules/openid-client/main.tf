resource "keycloak_openid_client" "client" {
  realm_id              = var.realm_id
  client_id             = var.client_id
  name                  = var.name
  enabled               = var.enabled
  access_type           = var.access_type
  valid_redirect_uris   = var.valid_redirect_uris
  login_theme           = var.login_theme
  standard_flow_enabled = var.standard_flow_enabled
  implicit_flow_enabled = var.implicit_flow_enabled
  web_origins           = var.web_origins
  extra_config          = merge(var.extra_config, {
    "post.logout.redirect.uris" = var.logout_redirect_uris
  })
}

resource "keycloak_openid_client_optional_scopes" "optional_scopes" {
  realm_id        = var.realm_id
  client_id       = keycloak_openid_client.client.id
  optional_scopes = var.optional_scopes
}
