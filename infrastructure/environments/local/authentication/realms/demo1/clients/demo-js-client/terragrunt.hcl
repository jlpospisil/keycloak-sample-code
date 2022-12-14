include {
  path = find_in_parent_folders()
}

dependency "realm" {
  config_path = "../../realm"
  mock_outputs = {
    realm = {
      id = "mock-realm-id"
    }
  }
}

inputs = {
  realm_id              = dependency.realm.outputs.realm.id
  client_id             = "demo-js-client"
  name                  = "Demo JS Client"
  access_type           = "PUBLIC"
  implicit_flow_enabled = true
  valid_redirect_uris   = [
    "http://localhost:8083",
    "http://localhost:8083/",
    "http://localhost:8083/login/callback"
  ]
#  optional_scopes = [
#    dependency.realm.outputs.openid_group_scope_name,
#  ]
  login_theme = "demo"
  extra_config = {
    "theme.primary-color" = "#607D8B",
    "theme.logo" = "https://imgur.com/XpwZOZH.png",
    "theme.login.background-image-url" = "https://imgur.com/ugTuype.jpeg"
  }
}

terraform {
  source = "../../../../../../..//modules/openid-client"
}
