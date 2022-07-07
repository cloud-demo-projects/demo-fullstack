# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = "~>2.0"
#     }
#   }
# }

# provider "azurerm" {
#   features {}
# }

############ Resource Group ##############
resource "azurerm_resource_group" "k8s" {
    name     = var.resource_group_name
    location = var.location
}

############ Logging Module ################################################
# resource "azurerm_log_analytics_workspace" "fullstack_lws" {
#     # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
#     name                = var.log_analytics_workspace_name
#     location            = var.log_analytics_workspace_location
#     resource_group_name = azurerm_resource_group.k8s.name
#     sku                 = var.log_analytics_workspace_sku
# }

# resource "azurerm_log_analytics_solution" "fullstack_lws_solution" {
#     solution_name         = "ContainerInsights"
#     location              = azurerm_log_analytics_workspace.fullstack_lws.location
#     resource_group_name   = azurerm_resource_group.k8s.name
#     workspace_resource_id = azurerm_log_analytics_workspace.fullstack_lws.id
#     workspace_name        = azurerm_log_analytics_workspace.fullstack_lws.name

#     plan {
#         publisher = "Microsoft"
#         product   = "OMSGallery/ContainerInsights"
#     }
# }

# resource "azurerm_application_insights" "applicationinsights" {
#   name                = "fullstack-appinsights"
#   location            = azurerm_resource_group.k8s.location
#   resource_group_name = azurerm_resource_group.k8s.name
#   workspace_id        = azurerm_log_analytics_workspace.fullstack_lws.id
#   application_type    = "web"
# }

# resource "azurerm_monitor_diagnostic_setting" "fullstack_diagnostic_settings" {
#   name                       = "custom_diagnostics"
#   target_resource_id         = azurerm_kubernetes_cluster.k8s.id
#   log_analytics_workspace_id = azurerm_log_analytics_workspace.fullstack_lws.id

#   metric {
#     category = "AllMetrics"
#     enabled  = var.custom_diagnostics_enabled
#     retention_policy {
#       enabled = var.custom_diagnostics_retention_enabled
#       days    = var.custom_diagnostics_retention_days
#     }
#   }

#   log {
#     category = "kube-apiserver"
#     enabled  = var.custom_diagnostics_enabled
#     retention_policy {
#       enabled = var.custom_diagnostics_retention_enabled
#       days    = var.custom_diagnostics_retention_days
#     }
#   }

#   log {
#     category = "kube-controller-manager"
#     enabled  = var.custom_diagnostics_enabled
#     retention_policy {
#       enabled = var.custom_diagnostics_retention_enabled
#       days    = var.custom_diagnostics_retention_days
#     }
#   }

#   log {
#     category = "kube-scheduler"
#     enabled  = var.custom_diagnostics_enabled
#     retention_policy {
#       enabled = var.custom_diagnostics_retention_enabled
#       days    = var.custom_diagnostics_retention_days
#     }
#   }

#   log {
#     category = "kube-audit"
#     enabled  = var.custom_diagnostics_enabled
#     retention_policy {
#       enabled = var.custom_diagnostics_retention_enabled
#       days    = var.custom_diagnostics_retention_days
#     }
#   }

#   log {
#     category = "cluster-autoscaler"
#     enabled  = var.custom_diagnostics_enabled
#     retention_policy {
#       enabled = var.custom_diagnostics_retention_enabled
#       days    = var.custom_diagnostics_retention_days
#     }
#   }
# }
################# Logging Module End #####################

################# AKS #################################################
resource "azurerm_kubernetes_cluster" "k8s" {

    timeouts {
      delete = "30m"
    }

    name                = var.cluster_name
    location            = azurerm_resource_group.k8s.location
    resource_group_name = azurerm_resource_group.k8s.name
    dns_prefix          = var.dns_prefix

    linux_profile {
        admin_username = "ubuntu"

        ssh_key {
            //key_data = data.azurerm_key_vault_secret.ssh_public_key.value
            key_data    = var.ssh_public_key_value
        }
    }

    default_node_pool {
        name            = "agentpool"
        node_count      = var.agent_count
        vm_size         = var.vm_size
    }

    # service_principal {
    #     client_id     = data.azurerm_key_vault_secret.spn_id.value
    #     client_secret = data.azurerm_key_vault_secret.spn_secret.value
    # }

    identity {
      type = "SystemAssigned"
    }

    addon_profile {
        oms_agent {
        enabled                    = true
        log_analytics_workspace_id = azurerm_log_analytics_workspace.fullstack_lws.id
        }
    }

    role_based_access_control {
        enabled = var.role_based_access_control_enabled
    }

    network_profile {
        load_balancer_sku = "Standard"
        network_plugin    = "azure"
    }

    tags = {
        EnvironmentSetup = "Development"
    }
}
################# AKS Module End #######

################# ACR Module ##############
resource "azurerm_container_registry" "acr" {
    name                = var.acr_name
    resource_group_name = azurerm_resource_group.k8s.name
    location            = azurerm_resource_group.k8s.location
    sku                 = "Basic"
    admin_enabled       = false
    depends_on          = [azurerm_resource_group.k8s]
}
################# ACR Module Ends ###########

############ SMI Role Assignment ##############
resource "azurerm_role_assignment" "aks_mi_container_registry_pull" {
    scope                         = azurerm_container_registry.acr.id
    role_definition_name          = "AcrPull"
    principal_id                  = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
}

resource "azurerm_role_assignment" "aks_mi_container_registry_push" {
    scope                         = azurerm_container_registry.acr.id
    role_definition_name          = "AcrPush"
    principal_id                  = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
}

resource "azurerm_role_assignment" "aks_mi_managed_identity_operator" {
  principal_id                     = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
  scope                            = data.azurerm_resource_group.aks_node_rg.id
  role_definition_name             = "Managed Identity Operator"
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "aks_mi_virtual_machine_contributor" {
  principal_id                     = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
  scope                            = data.azurerm_resource_group.aks_node_rg.id
  role_definition_name             = "Virtual Machine Contributor"
  skip_service_principal_aad_check = true
}
############ SMI Role Assignment Ends ##############

# resource "azurerm_role_assignment
# {
#   scope                            = azurerm_container_registry.acr.id
#   role_definition_name             = "AcrPull"
#   principal_id                     = data.azuread_service_principal.aks_principal.object_id
# }

# resource "azurerm_role_assignment" "aks_sp_container_registry_push" {
#   scope                            = azurerm_container_registry.acr.id
#   role_definition_name             = "AcrPush"
#   principal_id                     = data.azuread_service_principal.aks_principal.object_id
# }

################# UMI Module ####################
resource "azurerm_user_assigned_identity" "this" {
  location                          = var.location
  name                              = var.umi_name
  resource_group_name               = azurerm_resource_group.k8s.name
}

resource "azurerm_role_assignment" "keyvault_reader" {
  principal_id                     = azurerm_user_assigned_identity.this.client_id
  scope                            = data.azurerm_key_vault.this.id
  role_definition_name             = "Reader"
  skip_service_principal_aad_check = true
}

resource "azurerm_role_assignment" "sqlserver_contributor" {
  principal_id                     = azurerm_user_assigned_identity.this.client_id
  scope                            = data.azurerm_sql_server.this.id
  role_definition_name             = "Contributor"
  skip_service_principal_aad_check = true
}
################# UMI Module End #######################
