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

resource "keycloak_user_groups" "user_groups" {
  realm_id  = var.realm_id
  user_id   = keycloak_user.user.id
  group_ids = var.group_ids
}

resource "keycloak_user_roles" "user_roles" {
  realm_id  = var.realm_id
  user_id   = keycloak_user.user.id
  role_ids  = var.role_ids
}
