resource "keycloak_group" "group" {
  realm_id   = var.realm_id
  name       = var.name
  parent_id  = var.parent_id
  attributes = var.attributes
}
