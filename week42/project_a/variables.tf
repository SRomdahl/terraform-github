# Variables for the main configuration
variable "resource_group_name" {
  type        = string
  default     = "SSR-rg-demo-project-a"
  description = "The name of the resource group"
}
variable "location" {
  type        = string
  default     = "westeurope"
  description = "The location of the storage account"
}