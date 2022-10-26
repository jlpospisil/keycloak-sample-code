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
  description = "Whether the realm is enabled"
}

variable "theme" {
  type        = string
  default     = null
  description = "The theme to be used for the realm"
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
