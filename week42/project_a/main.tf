terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.1.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "SSR-tfstate-backend-rg"
    storage_account_name = "sabe63ui74zo"
    container_name       = "ssrterraformcontainerbackend"
    key                  = "project_a.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "7c064ed9-c59f-4935-938b-f1a654d088a7"
  features {

  }
}

resource "azurerm_resource_group" "rg_a" {
  name     = var.resource_group_name
  location = var.location
}