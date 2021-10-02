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

variable "ssh_public_key_value" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDgdoD5MOC+suUURmM8omGZ//cjW2SvzVhdYgWzNHSxbVy3HPTCEhGpUrgmmDYbi3sdZxpI4SIyazqKL+IAtlHJeENnJjp2QJFz5VFqMW0k4o3FtI1G32Ij1CoBiw3dVT2S3j4+RxOu1pE5AaW3H8Y8WoFla+i978VGz4hRQddpQOhmk6kQS0AISx37MWi6n3hYz+eCgPUIh2H4ZW4TNcCm5vObR5W3w8+SF9qN8rnILgFnb79FDaOIQ3qFpNqeq3ho++ZfEIA+awYV0s/5k750aPCdNKSS1S61B/z2RYn9VUH0FHL6PgHSsOi4AUgCuQb9k87EXHSG5L6ZqNI+8zTJ nipun@cc-a7b25532-6f7f5f69d5-nk8hx"
}

variable "dns_prefix" {
    default = "testaks9"
}

variable cluster_name {
    default = "testaks9"
}

variable resource_group_name {
    default = "test-aks"
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
    default = "kvaks993"
}

variable keyvault_rg {
    default = "test-aks9"
}

### ACR #####################################################

variable "acr_name" {
    default = "testaks9acr9"  
}