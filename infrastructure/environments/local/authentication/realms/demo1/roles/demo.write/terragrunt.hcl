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
  realm_id    = dependency.realm.outputs.realm.id
  name        = "demo.write"
  description = "access to create or update demo resources"
}

terraform {
  source = "../../../../../../..//modules/role"
}
