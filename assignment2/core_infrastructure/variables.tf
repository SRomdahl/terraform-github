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

variable "pub_ip_name" {
  type = string
}

# Storage variables

variable "storage_name" {
  type = string
}