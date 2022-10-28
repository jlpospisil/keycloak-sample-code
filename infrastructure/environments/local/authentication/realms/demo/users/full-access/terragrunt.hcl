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

dependency "demo_read_role" {
  config_path = "../../roles/demo.read"
  mock_outputs = {
    group = {
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
  realm_id         = dependency.demo_realm.outputs.realm.id
  username         = "fullaccess"
  initial_password = "P@55w0rd"
  role_ids = [
    dependency.demo_read_role.outputs.role.id,
    dependency.demo_write_role.outputs.role.id,
  ]
}

terraform {
  source = "../../../../../../..//modules/user"
}
