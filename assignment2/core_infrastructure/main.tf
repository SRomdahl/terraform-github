terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
  backend "azurerm" {
    resource_group_name   = "SSR-tfstate-backend-rg"
    storage_account_name  = "sabe63ui74zo"
    container_name        = "ssrterraformcontainerbackend"
    key                   = "ssr.assignment2coreinfra.terraform.tfstate" 
  }
}

data "terraform_remote_state" "global" {
    backend = "azurerm"
    config = {
        resource_group_name   = "SSR-tfstate-backend-rg"
        storage_account_name  = "sabe63ui74zo"
        container_name        = "ssrterraformcontainerbackend"
        key                   = "ssr.assignment2coreinfra.terraform.tfstate"
    }
}

provider "azurerm" {
    features {
        resource_group {
          prevent_deletion_if_contains_resources = false
        }
    }
  subscription_id = "7c064ed9-c59f-4935-938b-f1a654d088a7"
}

module "network" {
  source = "../modules/networking"
  rg_name = data.terraform_remote_state.global.outputs.resource_group_name
  location = data.terraform_remote_state.global.outputs.resource_group_location
  pub_ip_name = var.pub_ip_name
  nsg_name = var.nsg_name
  subnet_name = var.subnet_name
  ip_config_name = var.ip_config_name
  vnet_name = var.vnet_name
  lb_name = var.lb_name
}
