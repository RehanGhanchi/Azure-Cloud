provider "azurerm" {
  features {}
}

resource "azurerm_management_group" "Managementgroup" {
  display_name               = "Managementgroup"
}

resource "azurerm_management_group" "SecurityOU" {
  display_name    = "Security OU"
  parent_management_group_id      = azurerm_management_group.Managementgroup.id
}

resource "azurerm_management_group" "SharedServicesOU" {
  display_name    = "Shared Services OU"
  parent_management_group_id     = azurerm_management_group.Managementgroup.id
}

resource "azurerm_management_group" "LogAuditOU" {
  display_name    = "Log Audit OU"
  parent_management_group_id      = azurerm_management_group.Managementgroup.id
}

resource "azurerm_management_group" "InfrastructureOU" {
  display_name    = "Infrastructure OU"
  parent_management_group_id      = azurerm_management_group.Managementgroup.id
}

resource "azurerm_management_group" "ProductionOU" {
  display_name    = "Production OU"
  parent_management_group_id     = azurerm_management_group.InfrastructureOU.id
}

resource "azurerm_management_group" "NonProductionOU" {
  display_name    = "Non-Production OU"
  parent_management_group_id      = azurerm_management_group.InfrastructureOU.id
}

