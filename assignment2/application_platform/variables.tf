variable "rg_name" {
    description = "The name of the resource group"
    type        = string
}

variable "location" {
    description = "The location of the resource group"
    type        = string
}

# App variables
variable "app_service_plan_name" {
    description = "The name of the app service"
    type        = string
}

variable "app_service_name" {
    description = "The name of the app service"
    type        = string
}

# Database variables
variable "db_server_name" {
    description = "The name of the database server"
    type        = string
}

variable "db_name" {
    description = "The name of the database"
    type        = string
}