# Azure Storage Account Module and Azure Resource Group

# This is a test module that demonstrates how to create a basic module using Terraform

```hcl
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

module "resource_group_storage" {
  source                = "Kagerou4649/resource_group_storage/terraform-azurerm-resource_group_storage"
  resource_group_name   = "specific-resource-group"
  storage_account_name  = "specificstorageaccount"
  location              = "West US"
}
```

## Inputs

| Name                              | Description                                                        |
|-----------------------------------|--------------------------------------------------------------------|
| `resource_group_name`             | The name of the resource group.                                    |
| `location`                        | The location of the resource group and storage account             |
| `storage_account_name`            | The name of the storage account.                                   |
| `account_tier`                    | The tier of the storage account.                                   |
| `account_replication_type`        | The replication type of the storage account.                       |

## Outputs

| Name                              | Description                                                        |
|-----------------------------------|--------------------------------------------------------------------|
| `resource_group_name`             | The name of the resource group that was created.                   |
| `storage_account_name`            | The name of the storage account that was created.                  |
