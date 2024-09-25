variable "rg_name" {
    description = "The name of the resource group"
    type        = string
    default = "SSR-tfstate-rg"
}

variable "location" {
    description = "The location of the resource group"
    type        = string
    default = "westeurope"
}