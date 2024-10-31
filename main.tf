resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

module "simple_module" {
  source                = "./07-modules/simple-module"
  resource_group_name   = "specific-resource-group"
  storage_account_name  = "specificstorageaccount"
  location              = "West US"
}
