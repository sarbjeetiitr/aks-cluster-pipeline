
    # "cloudName": "AzureCloud",
    # "homeTenantId": "b6417cd0-1f73-4471-9a39-20953822a34a",
    # "id": "8c2e8ebe-3a7a-42e4-ba9c-fd784cc59f4b",
    # "isDefault": true,
    # "managedByTenants": [],
    # "name": "Azure for Students",
    # "state": "Enabled",
    # "tenantId": "b6417cd0-1f73-4471-9a39-20953822a34a",
    # "user": {
    #   "name": "c0827215@mylambton.ca",
    #   "type": "user"

    # az ad sp create-for-rbac --name "aks-pipeline-spn" --role Contributor --scopes /subscriptions/8c2e8ebe-3a7a-42e4-ba9c-fd784cc59f4b --sdk-auth
# ACCOUNT_KEY=$(az storage account keys list --resource-group "tfstate_sa_rg" --account-name "aksclusterstate" --query '[0].value' -o tsv) export ARM_ACCESS_KEY=$ACCOUNT_KEY
# uMjrWlQceVGol74i9kVR6RD2EEZprjhM2EaMfbahdyXpWsS1mkMDg0CMaHGcTrJY4+rxcJtBJe9c+AStcI6HIA==

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}



resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  #kubernetes_version  = var.kubernetes_version
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.cluster_name

  default_node_pool {
    name                = "system"
    node_count          = var.system_node_count
    vm_size             = "Standard_DS2_v2"
    type                = "VirtualMachineScaleSets"
    availability_zones  = [1, 2, 3]
    enable_auto_scaling = false
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "kubenet" # CNI
  }
}

