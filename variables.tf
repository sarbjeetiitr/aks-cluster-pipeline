variable "resource_group_name" {
  default = "aks_pipeline_rg"        
}

variable "sa_name" {
  default = "aks_tfstate_sa"        
}

variable "location" {
  default = "eastus" 
  description = "Resources location in Azure"
}

variable "cluster_name" {
  default        = "terraform-aks-pipeline"
  description = "AKS name in Azure"
}

# variable "kubernetes_version" {
#   type        = string
#   description = "Kubernetes version"
# }

variable "system_node_count" {
  type        = number
  description = "Number of AKS worker nodes"
}