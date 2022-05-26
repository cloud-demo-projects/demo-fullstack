output "client_key" {
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.client_key
}

output "client_certificate" {
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate
}

output "cluster_username" {
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.username
}

output "cluster_password" {
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.password
}

output "kube_config" {
    value = azurerm_kubernetes_cluster.k8s.kube_config_raw
    sensitive = true
}

output "host" {
    value = azurerm_kubernetes_cluster.k8s.kube_config.0.host
}

output "UMI_clientID" {
    value = azurerm_user_assigned_identity.this.client_id
}

#app insights outputs
# output "instrumentation_key" {
#   value = azurerm_application_insights.applicationinsights.instrumentation_key
#   sensitive = true
# }

# output "app_id" {
#   value = azurerm_application_insights.applicationinsights.app_id
# }