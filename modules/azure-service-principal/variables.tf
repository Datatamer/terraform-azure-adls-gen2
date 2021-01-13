variable "application_name" {
  description = "Name for application registration for the service principal"
  type        = string
}

variable "tags" {
  description = "List of addition tags to attach to the service principal"
  type        = list(string)
  default     = []
}

# including the word "secret" in name fails security linting
variable "client_secr_expiration_date" {
  description = "Expiration date of service principal secret formatted as a RFC3339 date string"
  type        = string
  default     = "2099-01-01T01:02:03Z"
}

variable "role_scopes" {
  description = "List of resource IDs to include in scope of role assignment"
  type        = list(string)
}
