resource "keycloak_role" "role" {
  realm_id        = var.realm_id
  name            = var.name
  description     = var.description
  composite_roles = var.composite_roles
  attributes      = var.attributes
}
