terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_storage_account" "storage" {
  name                = var.storage_name
  resource_group_name = var.rg_name
}

output "storage_account_tier" {
  value = data.azurerm_storage_account.storage.account_tier
}