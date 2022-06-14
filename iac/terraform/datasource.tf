### Key Vault #######################################
data "azurerm_key_vault" "this"{
  name                = var.keyvault_name
  resource_group_name = var.prerequisite_rg
}

data "azurerm_sql_server" "this"{
  name                = var.sqlserver_name
  resource_group_name = var.prerequisite_rg
}

# data "azurerm_key_vault" "terraform_vault" {
#   name                = var.keyvault_name
#   resource_group_name = var.prerequisite_rg
# }

# data "azurerm_key_vault_secret" "ssh_public_key" {
#   name         = "LinuxSSHPubKey"
#   key_vault_id = data.azurerm_key_vault.terraform_vault.id
# }

# data "azurerm_key_vault_secret" "spn_id" {
#   name         = "spn-id"
#   key_vault_id = data.azurerm_key_vault.terraform_vault.id
# }
# data "azurerm_key_vault_secret" "spn_secret" {
#   name         = "spn-secret"
#   key_vault_id = data.azurerm_key_vault.terraform_vault.id
# }

# ### Azure AD #######################################
# data "azuread_service_principal" "aks_principal" {
#   application_id = data.azurerm_key_vault_secret.spn_id.value
# }

### Node resource group
data "azurerm_resource_group" "aks_node_rg" {
  name = azurerm_kubernetes_cluster.k8s.node_resource_group
}
