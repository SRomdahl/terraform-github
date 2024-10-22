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

resource "azurerm_service_plan" "app_sp" {
  name                = var.app_service_plan_name
  resource_group_name = var.rg_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = "P1v2"

  tags = {
    environment = terraform.workspace
  }
}

resource "azurerm_app_service" "app_service" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_service_plan.app_sp.id
}