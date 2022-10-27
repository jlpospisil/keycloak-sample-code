resource "keycloak_user" "user" {
  realm_id   = var.realm_id
  username   = var.username
  enabled    = var.enabled
  email      = var.email
  first_name = var.first_name
  last_name  = var.last_name

  dynamic initial_password {
    for_each = var.initial_password == null ? [] : [1]
    content {
      value     = var.initial_password
      temporary = true
    }
  }
}
