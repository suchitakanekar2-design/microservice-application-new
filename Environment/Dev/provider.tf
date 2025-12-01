terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.48.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "dev-rg"
    storage_account_name = "devinfrastorage456"
    container_name       = "dev-container"
    key                  = "dev.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "80217434-ec3b-4237-9fd0-656182852097"
}