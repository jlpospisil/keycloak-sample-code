variable "attributes" {
  type        = map(string)
  default     = null
  description = "A map of custom attributes to add to the realm"
}

variable "display_name" {
  type        = string
  default     = null
  description = "The human readable realm name"
}

variable "display_name_html" {
  type        = string
  default     = null
  description = "The display name to be rendered online"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "When false, users and clients will not be able to access this realm"
}

variable "theme" {
  type        = string
  default     = "keycloak"
  description = "The theme to be used for the realm"
}

variable "login_theme" {
  type        = string
  default     = null
  description = "The theme used for the login, forgot password, and registration pages"
}

variable "account_theme" {
  type        = string
  default     = null
  description = "The theme used for account management pages"
}

variable "admin_theme" {
  type        = string
  default     = null
  description = "The theme used for the admin console"
}

variable "email_theme" {
  type        = string
  default     = null
  description = "The theme used for emails that are sent by Keycloak"
}

variable "name" {
  type        = string
  description = "The name of the realm"
}

variable "password_policy" {
  type        = string
  default     = "upperCase(1) and lowerCase(1) and specialChars(1) and digits(1) and length(8) and forceExpiredPasswordChange(365) and notUsername and passwordHistory(5)"
  description = "The password policy for the realm"
}

variable "ssl_required" {
  type        = string
  default     = "all"
  description = "The theme to be used for the realm"
  validation {
    condition     = contains(["none", "external", "all"], var.ssl_required)
    error_message = "Allowed values for ssl_required are \"none\", \"external\", or \"all\"."
  }
}
