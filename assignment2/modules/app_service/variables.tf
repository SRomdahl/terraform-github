# Resource group variables
variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

# App Service variables
variable "app_service_plan_name" {
  type = string
}

variable "app_service_name" {
  type = string
}