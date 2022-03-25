@description('The name of the Key Vault.')
@minLength(3)
@maxLength(24)
param keyVaultName string = 'kvdds7657'

@description('The location of the Key Vault.')
param location string = resourceGroup().location

@description('Whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the Key Vault.')
param enabledForDeployment bool = true

@description('Whether Azure Disk Encryption is permitted to retrieve secrets from the Key Vault and unwrap keys.')
param enabledForDiskEncryption bool = true

@description('Whether Azure Resource Manager is permitted to retrieve secrets from the Key Vault.')
param enabledForTemplateDeployment bool = true

@description('An object array that contains the complete definition of the access policy.')
param AccessPolicies array = []

@description('Whether to enable RBAC authorization.')
param enableRbacAuthorization bool = true

@description('Whether to enable enable purge protection.')
param enablePurgeProtection bool = true

@description('Whether to enable soft-delete.')
param enableSoftDelete bool = true

@description('The number of days that the soft-deleted items should be retained.')
@minValue(7)
@maxValue(90)
param softDeleteRetentionInDays int = 90

@description('Specifies what traffic can bypass network rules.')
@allowed([
  'AzureServices'
  'None'
])
param bypassNetworkAcls string = 'AzureServices'

@description('An array of Virtual Network resource IDs allowed to access the Key Vault.')
param virtualNetworkRules array = []

param ServiceConnectionSPID string


resource KeyVault 'Microsoft.KeyVault/vaults@2021-11-01-preview' = {
  name: keyVaultName
  location: location
  tags: {
    tagName1: 'tagValue1'
    tagName2: 'tagValue2'
  }
  properties: {
    accessPolicies: [for item in AccessPolicies: {
      tenantId: item.tenantId
      objectId: item.objectId
      permissions: item.permissions
    }]
    createMode: 'string'
    enabledForDeployment: enabledForDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    enabledForTemplateDeployment: enabledForTemplateDeployment
    enablePurgeProtection: enablePurgeProtection
    enableRbacAuthorization: enableRbacAuthorization
    enableSoftDelete: enableSoftDelete
    networkAcls: {
      bypass: bypassNetworkAcls
      defaultAction: 'Allow'
      ipRules: [
      ]
      virtualNetworkRules: [for item in virtualNetworkRules: {
        id: item
      }]
    }
    provisioningState: 'string'
    publicNetworkAccess: 'string'
    sku: {
      family: 'A'
      name: 'premium'
    }
    softDeleteRetentionInDays: softDeleteRetentionInDays
    tenantId: subscription().tenantId
    vaultUri: 'string'
  }
}

resource KeyVault 'Microsoft.KeyVault/vaults@2021-11-01-preview' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: subscription().tenantId
    sku: {
      name: 'premium'
      family: 'A'
    }
    accessPolicies: [for item in AccessPolicies: {
      tenantId: item.tenantId
      objectId: item.objectId
      permissions: item.permissions
    }]
    enabledForDeployment: enabledForDeployment
    enabledForDiskEncryption: enabledForDiskEncryption
    enabledForTemplateDeployment: enabledForTemplateDeployment
    enableSoftDelete: enableSoftDelete
    softDeleteRetentionInDays: softDeleteRetentionInDays
    enableRbacAuthorization: enableRbacAuthorization
    enablePurgeProtection: true
    networkAcls: {
      bypass: bypassNetworkAcls
      defaultAction: 'Allow'
      ipRules: [
      ]
      virtualNetworkRules: [for item in virtualNetworkRules: {
        id: item
      }]
    }
  }
}

resource roleAssignment 'Microsoft.Authorization/roleAssignments@2020-10-01-preview' = {
  name: guid('KV Admin', 'Microsoft.Authorization/roleDefinitions', '00482a5a-887f-4fb3-b363-3b7fe8e74483', ServiceConnectionSPID) // KV Admin
  scope: KeyVault
  properties:{
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', '00482a5a-887f-4fb3-b363-3b7fe8e74483') // KV Admin
    principalId: ServiceConnectionSPID
  }
  dependsOn: [
  ]
}

// // Creates a KeyVault with Private Link Endpoint
// @description('The Azure Region to deploy the resrouce group into')
// param location string = resourceGroup().location

// @description('Tags to apply to the Key Vault Instance')
// param tags object = {}

// @description('The name of the Key Vault')
// param keyvaultName string = 'kv123224r'

// resource keyVault 'Microsoft.KeyVault/vaults@2021-04-01-preview' = {
//   name: keyvaultName
//   location: location
//   tags: tags
//   properties: {
//     createMode: 'default'
//     enabledForDeployment: false
//     enabledForDiskEncryption: false
//     enabledForTemplateDeployment: false
//     enableSoftDelete: true
//     enableRbacAuthorization: true
//     enablePurgeProtection: true
//     networkAcls: {
//       bypass: 'AzureServices'
//       defaultAction: 'Deny'
//     }
//     sku: {
//       family: 'A'
//       name: 'standard'
//     }
//     softDeleteRetentionInDays: 7
//     tenantId: subscription().tenantId
//   }
// }

// output keyvaultId string = keyVault.id
