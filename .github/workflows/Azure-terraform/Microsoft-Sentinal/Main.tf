# Create a resource group
resource "azurerm_resource_group" "sentinel_rg" {
  name     = "sentinel-resource-group"
  location = "eastus"
}

# Configure the Azure provider
provider "azurerm" {
  features {}
}


# Create the Sentinel workspace
resource "azurerm_log_analytics_workspace" "sentinel_workspace" {
  name                = var.LogAnalyticsWorkspacename
  location            = azurerm_resource_group.sentinel_rg.location
  resource_group_name = azurerm_resource_group.sentinel_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 90
}

resource "azurerm_sentinel_log_analytics_workspace_onboarding" "example" {
  resource_group_name          = azurerm_resource_group.sentinel_rg.name
  workspace_name               = azurerm_log_analytics_workspace.sentinel_workspace.name
  customer_managed_key_enabled = false
}
