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
  realm_id = dependency.demo_realm.outputs.realm.id
  name     = "demo.read"
}

terraform {
  source = "../../../../../../..//modules/group"
}
