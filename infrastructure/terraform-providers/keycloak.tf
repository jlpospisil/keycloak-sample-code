variable "keycloak_client_id" {
  type = string
}

variable "keycloak_client_secret" {
  type    = string
  default = null
}

variable "keycloak_password" {
  type    = string
  default = null
}

variable "keycloak_username" {
  type    = string
  default = null
}

variable "keycloak_url" {
  type = string
}

provider "keycloak" {
  client_id     = var.keycloak_client_id
  client_secret = var.keycloak_client_secret
  password      = var.keycloak_password
  username      = var.keycloak_username
  url           = var.keycloak_url
}
