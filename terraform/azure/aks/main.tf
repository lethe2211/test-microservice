terraform {
  required_version = ">=0.12.0"

  # Save terrafrom states into Azure Storage
  backend "azurerm" {
  }
}

provider "azurerm" {
  version = "=2.32.0"

  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id

  features {}
}

resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name                = var.default_node_pool_name
    enable_auto_scaling = var.enable_auto_scaling
    vm_size             = var.vm_size
    node_count          = var.node_count
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }
}