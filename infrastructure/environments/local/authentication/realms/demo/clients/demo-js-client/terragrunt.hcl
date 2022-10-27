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
  extra_config = {
    "post.logout.redirect.uris" : "http://localhost:8083",
  }
}

terraform {
  source = "../../../../../../..//modules/openid-client"
}
