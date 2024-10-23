# Resource group variables
variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

# Network variables
variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "nsg_name" {
  type = string
}

# Load balancer variables
variable "lb_name" {
  type = string
}

variable "ip_config_name" {
  type = string
}

variable "pub_ip" {
  type = string
}