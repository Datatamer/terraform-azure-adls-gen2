variable "storage_account_primary_connection_string" {
  description = "Primary connection string associated with the storage account for which the token will be created"
  type        = string
}

variable "signed_version" {
  description = "Specifies the signed storage service version to use to authorize requests made with this account SAS"
  type        = string
  default     = "2017-07-29"
}

variable "start_time" {
  description = "The starting time and date of validity of this SAS. Must be a valid ISO-8601 format time/date string"
  type        = string
}

variable "end_time" {
  description = "The expiration time and date of this SAS. Must be a valid ISO-8601 format time/date string"
  type        = string
}

variable "delete_allowed" {
  description = "Whether or not to give this token permission to delete blobs"
  type        = bool
  default     = false
}
