variable "access_type" {
  type        = string
  description = "Specifies the type of client, which can be one of the following"
  validation {
    condition     = contains(["CONFIDENTIAL", "PUBLIC", "BEARER-ONLY"], var.access_type)
    error_message = "Allowed values for ssl_required are \"CONFIDENTIAL\", \"PUBLIC\", or \"BEARER-ONLY\"."
  }
}

variable "client_id" {
  type        = string
  description = "The Client ID for this client, referenced in the URI during authentication and in issued tokens"
}

variable "enabled" {
  type        = bool
  default     = true
  description = "When false, this client will not be able to initiate a login or obtain access tokens"
}

variable "implicit_flow_enabled" {
  type        = bool
  default     = false
  description = "When true, the OAuth2 Implicit Grant will be enabled for this client"
}

variable "name" {
  type        = string
  default     = null
  description = "The display name of this client in the GUI"
}

variable "realm_id" {
  type        = string
  description = "The realm this client is attached to"
}

variable "standard_flow_enabled" {
  type        = bool
  default     = false
  description = "When true, the OAuth2 Authorization Code Grant will be enabled for this client"
}

variable "theme" {
  type        = string
  default     = null
  description = "The client login theme. This will override the default theme for the realm"
}

variable "valid_redirect_uris" {
  type        = list(string)
  description = "A list of valid URIs a browser is permitted to redirect to after a successful login or logout. Simple wildcards in the form of an asterisk can be used here"
}
