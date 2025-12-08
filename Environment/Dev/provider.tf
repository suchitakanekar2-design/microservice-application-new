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
  subscription_id = "73db7a9a-aef7-41fe-8a49-10610ce568af"
}