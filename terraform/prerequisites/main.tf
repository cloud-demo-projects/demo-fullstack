terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "k8s" {
    name     = var.sac_rg
    location = var.location
}

resource "azurerm_storage_account" "k8s" {
  name                     = var.sac_name
  resource_group_name      = azurerm_resource_group.k8s.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "development"
  }
}

resource "azurerm_storage_container" "k8s" {
  name                  = "akstfstate"
  storage_account_name  = azurerm_storage_account.k8s.name
  container_access_type = "private"
}

