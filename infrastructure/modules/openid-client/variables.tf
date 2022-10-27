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

variable "extra_config" {
  type        = map(any)
  default     = {}
  description = "A map of key/value pairs to add extra configuration attributes to this client. This can be used for custom attributes, or to add configuration attributes that are not yet supported by this Terraform provider. Use this attribute at your own risk, as it may conflict with top-level configuration attributes in future provider updates"
}

variable "implicit_flow_enabled" {
  type        = bool
  default     = false
  description = "When true, the OAuth2 Implicit Grant will be enabled for this client"
}

variable "logout_redirect_uris" {
  type        = string
  default     = "+"
  description = "Valid URI pattern a browser can redirect to after a successful logout. A value of '+' will use the list of valid redirect uris. Separate multiple uris using ##"
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

variable "web_origins" {
  type        = list(string)
  default     = ["+"]
  description = "A list of allowed CORS origins. To permit all valid redirect URIs, add +. Note that this will not include the * wildcard. To permit all origins, explicitly add *."
}
