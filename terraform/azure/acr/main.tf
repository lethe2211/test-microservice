terraform {
  required_version = ">=0.12.0"

  # Save terrafrom states into Azure Storage
  backend "azurerm" {
  }
}

provider "azurerm" {
  version = "=2.23.0"

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {}
}

resource "azurerm_resource_group" "acr_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = azurerm_resource_group.acr_rg.name
  location            = azurerm_resource_group.acr_rg.location
  sku                 = var.sku
}
