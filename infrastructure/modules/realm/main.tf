resource "keycloak_realm" "realm" {
  realm                = var.name
  enabled              = var.enabled
  display_name         = var.display_name
  display_name_html    = var.display_name_html
  account_theme        = var.theme
  admin_theme          = var.theme
  email_theme          = var.theme
  login_theme          = var.theme
  ssl_required         = var.ssl_required
  password_policy      = var.password_policy
}
