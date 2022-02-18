terraform {
   backend "azurerm" {
     resource_group_name  = "tfstate_sa_rg"
     storage_account_name = "aksclusterstate"
     container_name       = "tfstate"
     key                  = "terraform.tfstate"
     access_key           = "uMjrWlQceVGol74i9kVR6RD2EEZprjhM2EaMfbahdyXpWsS1mkMDg0CMaHGcTrJY4+rxcJtBJe9c+AStcI6HIA=="

   }
}


# terraform {
#   cloud {
#     organization = "sarbjeet-terraform"

#     workspaces {
#       name = "aks-pipeline-demo"
#     }
#   }
# }