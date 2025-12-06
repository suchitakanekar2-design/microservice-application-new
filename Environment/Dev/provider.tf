terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.48.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "microservice-rg"
    storage_account_name = "microdevinfrastorage456"
    container_name       = "dev-container"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "a5aaa5ad-6e93-46b9-a1d8-b3f7d19bf107"
}