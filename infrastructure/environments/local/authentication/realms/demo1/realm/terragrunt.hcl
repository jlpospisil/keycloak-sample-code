include {
  path = find_in_parent_folders()
}

inputs = {
  name = "demo1"
  display_name = "Demo 1"
  display_name_html = "<b>Demo 1</b>"
  ssl_required = "none"
#  login_theme = "sunrise"
}

terraform {
  source = "../../../../../..//modules/realm"
}
