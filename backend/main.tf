

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
    key                   = "ssr.backend.terraform.tfstate" 
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
resource "random_string" "random_string" {
  length  = 8      # Adjust the length as needed
  special = false  # Set to true if you want special characters
  upper   = false  # Set to true if you want uppercase letters
}


resource "azurerm_resource_group" "tfstate_rg_backend" {
  name     = var.rg_backend_name
  location = var.location
} 

resource "azurerm_storage_account" "sa_backend" {
  name                     = "${lower(var.sa_backend_base_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.tfstate_rg_backend.name
  location                 = azurerm_resource_group.tfstate_rg_backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "sc_backend" {
  name                  = var.sc_backend_name
  storage_account_name  = azurerm_storage_account.sa_backend.name
  container_access_type = "private"
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv_backend" {
  name                        = "${lower(var.kv_backend_name)}${random_string.random_string.result}"
  location                    = azurerm_resource_group.tfstate_rg_backend.location
  resource_group_name         = azurerm_resource_group.tfstate_rg_backend.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get","List", "Create", "Delete",
    ]

    secret_permissions = [
      "Get", "Set", "List", "Delete", "Purge", "Recover",
    ]

    storage_permissions = [
      "Get", "Set", "List", "Delete",
    ]
  }
}

resource "azurerm_key_vault_secret" "sa_backend_accesskey" {
  name         = var.sa_backend_accesskey_name
  value        = azurerm_storage_account.sa_backend.primary_access_key
  key_vault_id = azurerm_key_vault.kv_backend.id
}

//HEI
