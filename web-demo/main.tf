resource "random_string" "random_string" {
    length = 8
    special = false
    upper = false
}

locals {
  workspaces_suffix = terraform.workspace == "default" ? "" : "${terraform.workspace}"

  rg_name = terraform.workspace == "default" ? "${var.rg_name}" : "${var.rg_name}-${local.workspaces_suffix}"
  sa_name = terraform.workspace == "default" ? "${var.sa_name}" : "${var.sa_name}-${local.workspaces_suffix}"
  web_suffix = "<h1>${terraform.workspace}</h1>"
}


# Create Resource Group
resource "azurerm_resource_group" "rg_web" {
    name = local.rg_name
    location = var.location
}

# Create Storage Account
resource "azurerm_storage_account" "sa_web" {
    name = "${lower(local.sa_name)}${random_string.random_string.result}"
    resource_group_name = azurerm_resource_group.rg_web.name
    location = azurerm_resource_group.rg_web.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    static_website {
      index_document = var.index_document
    }
}

# Add an index.html file to the storage account
resource "azurerm_storage_blob" "index_html" {
    name = var.index_document
    storage_account_name = azurerm_storage_account.sa_web.name
    storage_container_name = "$web"
    type = "Block"
    source = "${path.module}/index.html"
    content_type = "text/html"
}

output "primary_web_endpoint" {
    value = azurerm_storage_account.sa_web.primary_web_endpoint
}

//Destroy now please please please KOM IGJEN DA FOR FAEN JÆVLA KUKHUE FITTEFAEN GPT FAEN GPT HELVETE fdjkgdjfgdfjghllfsdkfjsdfhdssdfsfdsldfjshdjfhsdklfsdjflsdfjkhsdkjfshsdjkfhsdgdfhdifjghsdfjsdfhsldfngdfgnmbsdlfjsdjkfhdfhdflkkgdøfgjhdkfjhsjdlfsdkjfhjkdjfgdfjkhdlkjfghdlkjfghdlkjfghdfkljghdflkjghsdlkghsdlfkghsdlkghsdlkjghsdffkljgh