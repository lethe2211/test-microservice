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

variable "vnet_name" {
  type        = string
  description = "Name of Azure Virtual Network vnet setting"
}

variable "vnet_address_space" {
  type        = list
  description = "Address spaces in which Azure Virtual Network vnet resides"
}

variable "subnet_name" {
  type        = string
  description = "Name of Azure Virtual Network subnet setting"
}

variable "subnet_address_prefixes" {
  type        = list
  description = "Address spaces in which Azure Virtual Network subnet resides"
}

variable "public_ip_name" {
  type        = string
  description = "Name of Azure Public IP"
}

variable "public_ip_allocation_method" {
  type        = string
  description = "IP allocation method for Azure Public IP"
}

variable "network_security_group_name" {
  type        = string
  description = "Name of Azure Network Security Group"
}

variable "nic_name" {
  type        = string
  description = "Name of Azure Network Interface"
}

variable "nic_ip_configuration_name" {
  type        = string
  description = "IP configuration name of Azure Network Interface"
}