variable "subscription_id" {
  type        = string
  description = "Subscription ID for Azure"
}

variable "client_id" {
  type        = string
  description = "App ID in Azure Service Principal where we want to pass the auth"
}

variable "client_secret" {
  type        = string
  description = "Password in Azure Service Principal where we want to pass the auth"
}

variable "tenant_id" {
  type        = string
  description = "Tenant in Azure Service Principal where we want to pass the auth"
}

variable "resource_group_name" {
  type        = string
  description = "Name of Azure Resource Group"
}

variable "location" {
  type        = string
  description = "Location of the resource"
}

variable "acr_name" {
  type        = string
  description = "Name of Azure Container Registry. It must be unique among all the ACR accounts"
}

variable "sku" {
  type        = string
  description = "SKU (Stock Keeping Unit. Kind of level of the service) name of Azure Container Registry"
}