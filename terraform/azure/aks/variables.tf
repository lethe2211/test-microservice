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

variable "cluster_name" {
  type        = string
  description = "Name of Azure Kubernetes Cluster"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the managed cluster"
}

variable "default_node_pool_name" {
  type        = string
  description = "Name of default node pool"
}

variable "enable_auto_scaling" {
  type        = string
  description = "Whether auto scaling is enabled"
}

variable "vm_size" {
  type        = string
  description = "Size of VM (like Standard_DS2_v2)"
}

variable "node_count" {
  type        = string
  description = "Initial number of Nodes in the created cluster"
}


