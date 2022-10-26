include {
  path = find_in_parent_folders()
}

inputs = {
  name = "demo-realm"
  display_name = "Demo Realm"
  display_name_html = "<b>Demo Realm</b>"
  ssl_required = "none"
}

terraform {
  source = "../../../../../..//modules/realm"
}
