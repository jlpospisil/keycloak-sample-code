resource "keycloak_realm" "realm" {
  realm                = var.name
  enabled              = var.enabled
  display_name         = var.display_name
  display_name_html    = var.display_name_html
  account_theme        = coalesce(var.account_theme, var.theme)
  admin_theme          = coalesce(var.admin_theme, var.theme)
  email_theme          = coalesce(var.email_theme, var.theme)
  login_theme          = coalesce(var.login_theme, var.theme)
  ssl_required         = var.ssl_required
  password_policy      = var.password_policy
}

#resource "keycloak_openid_client_scope" "openid_client_group_scope" {
#  realm_id               = keycloak_realm.realm.id
#  name                   = "groups"
#  description            = "When requested, this scope will map a user's group memberships to a claim"
#  include_in_token_scope = true
#}
#
#resource "keycloak_openid_group_membership_protocol_mapper" "group_membership_mapper" {
#  realm_id            = keycloak_realm.realm.id
#  client_scope_id     = keycloak_openid_client_scope.openid_client_group_scope.id
#  name                = "group-membership-mapper"
#  add_to_id_token     = true
#  add_to_access_token = true
#  add_to_userinfo     = true
#  full_path           = false
#  claim_name          = "groups"
#}
