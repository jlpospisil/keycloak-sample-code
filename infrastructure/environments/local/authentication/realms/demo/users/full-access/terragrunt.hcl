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

dependency "demo_read_group" {
  config_path = "../../groups/demo.read"
  mock_outputs = {
    group = {
      id = "mock-group-id"
    }
  }
}

dependency "demo_write_group" {
  config_path = "../../groups/demo.write"
  mock_outputs = {
    group = {
      id = "mock-group-id"
    }
  }
}

inputs = {
  realm_id         = dependency.demo_realm.outputs.realm.id
  username         = "fullaccess"
  initial_password = "P@55w0rd"
  group_ids = [
    dependency.demo_read_group.outputs.group.id,
    dependency.demo_write_group.outputs.group.id,
  ]
}

terraform {
  source = "../../../../../../..//modules/user"
}
