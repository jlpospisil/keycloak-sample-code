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
  client_id             = "demo-client"
  name                  = "Demo Client"
  access_type           = "PUBLIC"
  standard_flow_enabled = true
  valid_redirect_uris   = [
    "http://localhost:8083",
    "http://localhost:8083/",
    "http://localhost:8083/login/oauth2/code/uaa",
  ]
}

terraform {
  source = "../../../../../../..//modules/openid-client"
}
