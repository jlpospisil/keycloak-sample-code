resource "keycloak_realm" "realm" {
  realm                = var.name
  enabled              = var.enabled
  display_name         = var.display_name
  display_name_html    = var.display_name_html
  account_theme        = var.theme
  admin_theme          = var.theme
  email_theme          = var.theme
  login_theme          = var.theme
  ssl_required         = var.ssl_required
  password_policy      = var.password_policy

#  attributes      = {
#    mycustomAttribute = "myCustomValue"
#  }
#
#  internationalization {
#    supported_locales = [
#      "en",
#      "de",
#      "es"
#    ]
#    default_locale    = "en"
#  }
#
#  security_defenses {
#    headers {
#      x_frame_options                     = "DENY"
#      content_security_policy             = "frame-src 'self'; frame-ancestors 'self'; object-src 'none';"
#      content_security_policy_report_only = ""
#      x_content_type_options              = "nosniff"
#      x_robots_tag                        = "none"
#      x_xss_protection                    = "1; mode=block"
#      strict_transport_security           = "max-age=31536000; includeSubDomains"
#    }
#    brute_force_detection {
#      permanent_lockout                 = false
#      max_login_failures                = 10
#      wait_increment_seconds            = 60
#      quick_login_check_milli_seconds   = 1000
#      minimum_quick_login_wait_seconds  = 60
#      max_failure_wait_seconds          = 900
#      failure_reset_time_seconds        = 43200
#    }
#  }
#
#  web_authn_policy {
#    relying_party_entity_name = "Example"
#    relying_party_id          = "keycloak.example.com"
#    signature_algorithms      = ["ES256", "RS256"]
#  }
#
#    smtp_server {
#      host = "smtp.example.com"
#      from = "example@example.com"
#
#      auth {
#        username = ""
#        password = ""
#      }
#    }
}
