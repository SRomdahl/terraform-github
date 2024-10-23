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
    key                   = "ssr.assignment2app.terraform.tfstate" 
  }
}

data "terraform_remote_state" "global" {
    backend = "azurerm"
    config = {
        resource_group_name   = "SSR-tfstate-backend-rg"
        storage_account_name  = "sabe63ui74zo"
        container_name        = "ssrterraformcontainerbackend"
        key                   = "ssr.assignment2global.terraform.tfstate"
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

module "app_service" {
  source = "../modules/app_service"
  app_service_plan_name = var.app_service_plan_name
  app_service_name = var.app_service_name
  rg_name = data.terraform_remote_state.global.outputs.resource_group_name
  location = data.terraform_remote_state.global.outputs.resource_group_location
}