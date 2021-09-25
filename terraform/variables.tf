# AKS
# variable "client_id" {
#     default = "468b6d82-4d1f-4752-947e-b61d196b40fc"
# }
# variable "client_secret" {
#     default = "uAtl_hpxnR.M4G5vdzYqd01poGv9.zW_lv"
# }

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

# KV
variable keyvault_name {
    default = "kvaks9"
}

variable keyvault_rg {
    default = "test-aks"
}