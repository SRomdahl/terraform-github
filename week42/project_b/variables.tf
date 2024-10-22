# Variables for the main configuration
variable "resource_group_name" {
  type        = string
  default     = "SSR-rg-demo-project-btest"
  description = "The name of the resource group for project B"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "The location of the storage account"
}

# Variables for the storage account
variable "storage_account_name" {
  type        = string
  default     = "ssrsademo123456789aproj" # MUST BE UNIQUE, CHANGE THIS VALUE
  description = "The name of the storage account"
}