include {
  path = find_in_parent_folders()
}

dependency "demo_realm" {
  config_path = "../../realm"
  mock_outputs = {
    zone = {
      id = "mock-realm-id"
    }
  }
}

inputs = {
  realm_id              = dependency.demo_realm.outputs.realm.id
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
#    dependency.demo_realm.outputs.openid_group_scope_name,
#  ]
}

terraform {
  source = "../../../../../../..//modules/openid-client"
}
