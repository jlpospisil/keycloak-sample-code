variable "attributes" {
  type        = map(string)
  default     = null
  description = "A map representing attributes for the role. In order to add multivalue attributes, use ## to seperate the values. Max length for each value is 255 chars"
}

variable "composite_roles" {
  type        = list(string)
  default     = null
  description = "When specified, this role will be a composite role, composed of all roles that have an ID present within this list"
}

variable "description" {
  type        = string
  description = "The description of the role"
}

variable "name" {
  type        = string
  description = "The name of the role"
}

variable "realm_id" {
  type        = string
  description = "The realm this role exists within."
}
