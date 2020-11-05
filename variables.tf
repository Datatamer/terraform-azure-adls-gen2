variable "instance_name" {
  description = "Name of ADLS Gen2 instance (lowercase and numbers only, must be fewer than 18 characters.)"
  type        = string
}

variable "resource_group_name" {
  description = "Name of resource group"
  type        = string
}

variable "location" {
  description = "Location of resource group"
  type        = string
}

variable "fs_properties" {
  description = "Map of additional properties to assign to the Gen2 filesystem"
  type        = map(string)
  default     = null
}

variable "replication_type" {
  description = "Storage account replication type"
  type        = string
  default     = "RAGRS"
}

variable "account_kind" {
  description = "Storage account kind"
  type        = string
  default     = "StorageV2"
}

variable "access_tier" {
  description = "Storage account access tier"
  type        = string
  default     = "Hot"
}
