####### AKS ###########################################################
# variable "client_id" {
#     default = "468b6d82-4d1f-4752-947e-b61d196b40fc"
# }
# variable "client_secret" {
#     default = "uAtl_hpxnR.M4G5vdzYqd01poGv9.zW_lv"
# }

variable "spn_object_id" {
  default = "64e91fff-3e3f-42ec-b85e-5e1c24791d93"
}

variable "agent_count" {
    default = 1
}

# variable "ssh_public_key" {
#     default = "~/.ssh/id_rsa.pub"
# }

variable "dns_prefix" {
    default = "testaks9"
}

variable cluster_name {
    default = "testaks9"
}

variable resource_group_name {
    default = "test-aks9"
}

variable location {
    default = "West Europe"
}

variable log_analytics_workspace_name {
    default = "testLogAnalyticsWorkspaceName"
}

variable log_analytics_workspace_location {
    default = "westeurope"
}

variable log_analytics_workspace_sku {
    default = "PerGB2018"
}

variable "role_based_access_control_enabled" {
    default = "true"  
}

variable "vm_size" {
    default = "Standard_B2S"
  
}

###### KV #######################################################################
variable keyvault_name {
    default = "kvaks99"
}

variable keyvault_rg {
    default = "test-aks9"
}

### ACR #####################################################

variable "acr_name" {
    default = "testaks9acr9"  
}