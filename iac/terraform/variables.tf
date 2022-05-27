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
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCaVp7TBD+qngQYPFiMzYhW68zyJRl1TmUh+S/8Gc/Hg8bLnRbWBjQ75YY/C2BxaTBcYCX8fd4dEGku/jf9hkcGM8SukwXg4qssCVjr3KKIoPa3QNfmH2uW0QCdXs+TR9j5bo1iaZ2hjgVa87QJ9SiW/bmcNETk5/PLWX6jilW9+Vj1MsHve5IZ7vHdkkiHe7PtkVglzTGbWb/V6DAhhr+6Vwny+W45Juczq0ScJiQg+YWc4A1OAj+GcyU4nntoAZN/BIvBK9KR5+pldOklnujsUrQSH/uicv/Rw2bxyN/xLXR2im6fIUaptRKxz1muKw3TFbKfJqRtTkeB5fVrRM4F nipun@cc-bd44156f-75946bd9b5-tklwn"
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
    default = "fullstack-LogWS"
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
    default = "Standard_B2MS"
  
}

variable "custom_diagnostics_enabled" {
  type    = bool
  default = "true"
}

variable "custom_diagnostics_retention_enabled" {
  type    = bool
  default = "false"
}

variable "custom_diagnostics_retention_days" {
  type    = number
  default = 0
}

###### KV & SQL Server #######################################################################
variable keyvault_name {
    default = "fullstack-kv01"
}

variable sqlserver_name {
    default = "backend-dbserver"
}

variable prerequisite_rg {
    default = "pre-aks"
}

### ACR #####################################################

variable "acr_name" {
    default = "testaks9acr9"  
}


## UMI #######################
variable "umi_name" {
    default = "fullstack-umi"  
}
