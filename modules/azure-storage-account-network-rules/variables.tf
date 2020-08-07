variable "storage_account_name" {
  description = "Name of storage account on which to create rules"
  type        = string
}

variable "resource_group_name" {
  description = "Name of resource group containing the storage account"
  type        = string
}

variable "allowed_ips" {
  description = "List of allowed IPs"
  type        = list(string)
  default     = null
}

variable "allowed_subnet_ids" {
  description = "List of allowed subnet IDs. Subnets must have Microsoft.Storage service endpoint"
  type        = list(string)
  default     = null
}
