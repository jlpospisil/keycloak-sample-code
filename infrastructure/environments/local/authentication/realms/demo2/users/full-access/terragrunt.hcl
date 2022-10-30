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

dependency "demo_read_role" {
  config_path = "../../roles/demo.read"
  mock_outputs = {
    role = {
      id = "mock-group-id"
    }
  }
}

dependency "demo_write_role" {
  config_path = "../../roles/demo.write"
  mock_outputs = {
    role = {
      id = "mock-role-id"
    }
  }
}

inputs = {
  realm_id         = dependency.realm.outputs.realm.id
  username         = "demo2full"
  initial_password = "P@55w0rd"
  role_ids = [
    dependency.demo_read_role.outputs.role.id,
    dependency.demo_write_role.outputs.role.id,
  ]
}

terraform {
  source = "../../../../../../..//modules/user"
}
