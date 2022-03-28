@description('The name of the Key Vault.')
@minLength(3)
@maxLength(24)
param keyVaultName string

@description('The location of the Key Vault.')
param location string

@description('Whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the Key Vault.')
param enabledForDeployment bool = true

@description('Whether Azure Disk Encryption is permitted to retrieve secrets from the Key Vault and unwrap keys.')
param enabledForDiskEncryption bool = true

@description('Whether Azure Resource Manager is permitted to retrieve secrets from the Key Vault.')
param enabledForTemplateDeployment bool = true

@description('An object array that contains the permissions to be assigned.')
param permissions object = {
  keys: [
    'get'
    'list'
    'update'
    'create'
  ]
  secrets: [
    'get'
    'list'
    'set'
  ]
  certificates: [
    'get'
    'list'
    'update'
    'import'
  ]
}

@description('An object array that contains the complete definition of the access policy.')
param AccessPolicies array = [
  {
    objectId: spnObjectId
    tenantId: subscription().tenantId
    permissions: permissions
  }
]

@description('Whether to enable RBAC authorization.')
param enableRbacAuthorization bool = false

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
param bypassNetworkAcls string = 'None' //AzureServices

@description('An array of Virtual Network resource IDs allowed to access the Key Vault.')
param virtualNetworkRules array = []

@description('Service Pronciple ObjectID to assign role against.')
param spnObjectId string = '61b1df67-a2ad-493f-9fd1-b6a19d122f06'

@description('Azure Reader role definition Guid.')
param roleDefinitionGuid string = 'acdd72a7-3385-48ef-bd42-f606fba81ae7'

@description('Azure Reader role definition name.')
param roleDefinitionName string = 'Reader'

resource keyVault 'Microsoft.KeyVault/vaults@2021-11-01-preview' = {
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
    enablePurgeProtection: enablePurgeProtection
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
  name: guid(roleDefinitionName, 'Microsoft.Authorization/roleDefinitions', roleDefinitionGuid, spnObjectId)
  scope: keyVault
  properties:{
    roleDefinitionId: resourceId('Microsoft.Authorization/roleDefinitions', roleDefinitionGuid)
    principalId: spnObjectId
  }
}
