terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "k8s" {
    name     = var.resource_group_name
    location = var.location
}

# resource "random_id" "log_analytics_workspace_name_suffix" {
#     byte_length = 8
# }

# resource "azurerm_log_analytics_workspace" "test" {
#     # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
#     name                = "${var.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_suffix.dec}"
#     location            = var.log_analytics_workspace_location
#     resource_group_name = azurerm_resource_group.k8s.name
#     sku                 = var.log_analytics_workspace_sku
# }

# resource "azurerm_log_analytics_solution" "test" {
#     solution_name         = "ContainerInsights"
#     location              = azurerm_log_analytics_workspace.test.location
#     resource_group_name   = azurerm_resource_group.k8s.name
#     workspace_resource_id = azurerm_log_analytics_workspace.test.id
#     workspace_name        = azurerm_log_analytics_workspace.test.name

#     plan {
#         publisher = "Microsoft"
#         product   = "OMSGallery/ContainerInsights"
#     }
# }

resource "azurerm_kubernetes_cluster" "k8s" {
    name                = var.cluster_name
    location            = azurerm_resource_group.k8s.location
    resource_group_name = azurerm_resource_group.k8s.name
    dns_prefix          = var.dns_prefix

    linux_profile {
        admin_username = "ubuntu"

        ssh_key {
            key_data = data.azurerm_key_vault_secret.ssh_public_key.value
        }
    }

    default_node_pool {
        name            = "agentpool"
        node_count      = var.agent_count
        vm_size         = var.vm_size
    }

    service_principal {
        client_id     = data.azurerm_key_vault_secret.spn_id.value
        client_secret = data.azurerm_key_vault_secret.spn_secret.value
    }

    # identity {
    #   type = "SystemAssigned"
    # }

    # addon_profile {
    #     oms_agent {
    #     enabled                    = true
    #     log_analytics_workspace_id = azurerm_log_analytics_workspace.test.id
    #     }
    # }

    role_based_access_control {
        enabled = var.role_based_access_control_enabled
    }

    network_profile {
        load_balancer_sku = "Standard"
        network_plugin = "azure"
    }

    tags = {
        Environment = "Development"
    }
}

resource "azurerm_container_registry" "acr" {
    name                = var.acr_name
    resource_group_name = azurerm_resource_group.k8s.name
    location            = azurerm_resource_group.k8s.location
    sku                 = "Basic"
    admin_enabled       = false
    depends_on          = [azurerm_resource_group.k8s]
}

# resource "azurerm_role_assignment" "aks_sp_container_registry_pull" {
#     scope                = azurerm_container_registry.acr.id
#     role_definition_name = "AcrPull"
#     principal_id         = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
# }

# resource "azurerm_role_assignment" "aks_sp_container_registry_push" {
#     scope                = azurerm_container_registry.acr.id
#     role_definition_name = "AcrPush"
#     principal_id         = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
# }

resource "azurerm_role_assignment" "aks_sp_container_registry_pull" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPull"
  principal_id                     = data.azuread_service_principal.aks_principal.object_id
}

resource "azurerm_role_assignment" "aks_sp_container_registry_push" {
  scope                            = azurerm_container_registry.acr.id
  role_definition_name             = "AcrPush"
  principal_id                     = data.azuread_service_principal.aks_principal.object_id
}