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
  realm_id         = dependency.demo_realm.outputs.realm.id
  username         = "fullaccess"
  initial_password = "P@55w0rd"
}

terraform {
  source = "../../../../../../..//modules/user"
}
