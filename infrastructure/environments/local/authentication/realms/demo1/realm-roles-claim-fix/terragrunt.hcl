include {
  path = find_in_parent_folders()
}

dependency "realm" {
  config_path = "../realm"
  mock_outputs = {
    realm = {
      realm = "mock-realm"
    }
  }
}

inputs = {
  realm = dependency.realm.outputs.realm.realm
}

terraform {
  source = "../../../../../..//modules/realm-roles-claim-fix"
}
