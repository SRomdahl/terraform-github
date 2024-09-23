variable "rg_backend_name" {
  description = "The name of the resource group for the backend"
  type        = string
  default = "SSR-rg-terraform-backend"
}

variable "location" {
  description = "The location of the resource group for the backend"
  type        = string
  default = "westeurope"
}

variable "sa_backend_base_name" {
  description = "The name of the storage account for the backend"
  type        = string
  default = "sabe"
}

variable "sc_backend_name" {
  description = "The name of the storage container for the backend"
  type        = string
  default = "ssrterraformcontainerbackend"
}

variable "kv_backend_name" {
  description = "The name of the key vault for the backend"
  type        = string
  default = "kvbe"
}

variable "sa_backend_accesskey_name" {
    description = "The name of the key vault secret for the storage account access key"
    type        = string
    default = "sa-backend-access-key"
}