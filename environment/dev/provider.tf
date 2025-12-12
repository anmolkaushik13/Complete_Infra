terraform {
  required_version = ">= 1.5.0"
  
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-test"
    storage_account_name = "pipelinestd1"
    container_name       = "tfstate"
    subscription_id      = "de1c1815-4f90-412b-9551-d55f0de9407d"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  subscription_id = "de1c1815-4f90-412b-9551-d55f0de9407d"
  features {

  }
}
