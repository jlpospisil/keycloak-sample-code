// There is a "bug" with the default mappers that get created for a realm that prevents
// the roles from being added to the id token (despite the UI indicating they should).
// This workaround updates the mappers to save the same attributes as if you went into
// the UI and just clicked save without making any changes.  This is just an attempt
// to automate that to accommodate our need for the roles claim to exist on the id token.

// If/when this is no longer needed, remove this module and any reference

data http "auth" {
  url     = "${var.keycloak_url}/realms/master/protocol/openid-connect/token"
  method  = "POST"
  body    = "grant_type=password&client_id=admin-cli&username=${var.keycloak_username}&password=${var.keycloak_password}"
  headers = {
    Accept = "application/json"
    "Content-Type" = "application/x-www-form-urlencoded"
  }
}

data http client_scopes {
  url     = "${var.keycloak_url}/admin/realms/${var.realm}/client-scopes"
  method  = "GET"
  headers = local.headers
}

locals {
  auth_response = jsondecode(data.http.auth.response_body)
  token_type = local.auth_response.token_type
  access_token = local.auth_response.access_token
  auth_token_value = "${local.token_type} ${local.access_token}"
  client_scopes = jsondecode(data.http.client_scopes.response_body)
  client_scopes_map = {for scope in local.client_scopes: scope.name => scope}
  roles_scope = local.client_scopes_map.roles
  mappers = {for mapper in local.roles_scope.protocolMappers: mapper.id => mapper if contains(["realm roles", "client roles"], mapper.name)}
  config_to_add = {
    "id.token.claim": "true",
    "access.token.claim": "true",
    "userinfo.token.claim": "true"
  }
  headers = {
    Accept = "application/json"
    "Content-Type" = "application/json"
    Authorization = local.auth_token_value
  }
}

data http mapper_update {
  for_each = local.mappers
  url      = "${var.keycloak_url}/admin/realms/${var.realm}/client-scopes/${local.roles_scope.id}/protocol-mappers/models/${each.key}"
  method   = "PUT"
  headers  = local.headers
  status   = 204
  body     = jsonencode(merge(each.value, {
    config = merge(each.value["config"], local.config_to_add),
  }))
}
