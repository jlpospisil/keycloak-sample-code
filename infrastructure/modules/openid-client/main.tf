resource "keycloak_openid_client" "openid_client" {
  realm_id              = var.realm_id
  client_id             = var.client_id
  name                  = var.name
  enabled               = var.enabled
  access_type           = var.access_type
  valid_redirect_uris   = var.valid_redirect_uris
  login_theme           = var.theme
  standard_flow_enabled = var.standard_flow_enabled
  implicit_flow_enabled = var.implicit_flow_enabled
}
