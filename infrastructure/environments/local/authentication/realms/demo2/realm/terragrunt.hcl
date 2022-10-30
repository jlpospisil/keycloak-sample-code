include {
  path = find_in_parent_folders()
}

inputs = {
  name = "demo2"
  display_name = "Demo 2"
  display_name_html = "<b>Demo 2</b>"
  ssl_required = "none"
  login_theme = "sunrise"
}

terraform {
  source = "../../../../../..//modules/realm"
}
