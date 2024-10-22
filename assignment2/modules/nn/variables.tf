# Resource group variables
variable "rg_name" {
  type = string
}

variable "location" {
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