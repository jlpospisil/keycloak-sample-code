inputs = {
  environment            = "local"
  keycloak_client_id     = "admin-cli"
#  keycloak_client_secret = "TODO: use this instead of username/password"
  keycloak_password      = "admin"
  keycloak_username      = "admin"
  keycloak_url           = "http://localhost:8080"
}

generate "requirements" {
  path      = "provider-requirements.tf"
  if_exists = "overwrite"
  contents  = file("../../terraform-providers/requirements.tf")
}

generate "keycloak" {
  path      = "provider-keycloak.tf"
  if_exists = "overwrite"
  contents  = file("../../terraform-providers/keycloak.tf")
}
