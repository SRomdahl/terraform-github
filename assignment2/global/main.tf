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

resource "azurerm_resource_group" "rg" {
  name     = "SSR-assignment2-rg-${terraform.workspace}"
  location = "westeurope"
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  value = azurerm_resource_group.rg.location
}