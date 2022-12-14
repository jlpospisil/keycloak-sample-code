variable "enabled" {
  type        = bool
  default     = true
  description = "When false, this user cannot log in"
}

variable "email" {
  type        = string
  default     = null
  description = "The user's email"
}

variable "first_name" {
  type        = string
  default     = null
  description = "The user's first name"
}

variable "group_ids" {
  type        = list(string)
  default     = []
  description = "A list of Ids for the groups to add the user to"
}

variable "initial_password" {
  type        = string
  default     = null
  description = "When given, the user's initial password will be set"
}

variable "last_name" {
  type        = string
  default     = null
  description = "The user's last name"
}

variable "realm_id" {
  type        = string
  description = "The realm this client is attached to"
}

variable "role_ids" {
  type        = list(string)
  default     = []
  description = "A list of Ids for the roles to add to the user"
}

variable "username" {
  type        = string
  description = "The unique username of this user"
}
