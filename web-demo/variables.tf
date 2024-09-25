variable "rg_name" {
    description = "The name of the resource group"
    type        = string
    default = "SSR-web-rg"
}

variable "location" {
    description = "The location of the resource group"
    type        = string
    default = "westeurope"
}

variable "sa_name" {
    description = "The name of the storage account"
    type        = string
    default = "ssrwebstorage"
}

variable "index_document" {
    description = "The name of the index document"
    type        = string
    default = "index.html"
}