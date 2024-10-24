# List resources containing a specific string in the name
az resource list --query "[?contains(name, 'sa')]" --output table

# List resources of a specific type
az resource list --resource-type "Microsoft.Storage/storageAccounts" --output table

# Get the id of a specific resource
az resource show --resource-group SSR-rg-demo-project-a --name ssrsademo123456789aproj --resource-type "Microsoft.Storage/storageAccounts" --query id --output tsv

# Creates a json file with the list of resources
az resource list --resource-group SSR-rg-demo-project-a --output json > resources.json


# Remove a resource from terraform state
terraform state rm module.storage.azurerm_storage_account.sa-demo 

# Move a resource to another resource group
az resource move --destination-group SSR-rg-demo-project-btest --ids /subscriptions/7c064ed9-c59f-4935-938b-f1a654d088a7/resourceGroups/SSR-rg-demo-project-a/providers/Microsoft.Storage/storageAccounts/ssrsademo123456789aproj