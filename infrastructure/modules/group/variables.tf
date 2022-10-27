variable "attributes" {
  type        = map(string)
  default     = null
  description = "A map representing attributes for the group. In order to add multivalue attributes, use ## to seperate the values. Max length for each value is 255 chars"
}

variable "name" {
  type        = string
  default     = null
  description = "The name of the group"
}

variable "parent_id" {
  type        = string
  default     = null
  description = "The ID of this group's parent. If omitted, this group will be defined at the root level"
}

variable "realm_id" {
  type        = string
  description = "The realm this group exists in"
}
