terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.53.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "omkar"
    storage_account_name = "omkarstor2"
    container_name       = "omkarstorc"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "6e65d60a-bc12-4f70-8dcd-6cdb4da48e3e"
}

