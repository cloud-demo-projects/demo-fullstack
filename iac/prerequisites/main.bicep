//targetScope = 'subscription'

@description('The Azure env into which the resources should be deployed.')
param environmentType string = 'development'

@description('The Azure rg into which the resources should be deployed.')
@maxLength(13)
param rgName string = 'test-aks9'

@description('The Azure rg into which the resources should be deployed.')
param location string = 'westeurope'

@description('The Azure KV into which the resources should be deployed.')
param keyVaultName string = 'kvdds7657'


resource resourceGroup 'Microsoft.Resources/resourceGroups@2020-06-01' existing = {
  name: rgName
  scope: subscription()
}

module keyVault 'modules/createKV.bicep' = {
  name: 'kvdeployment'
  params: {
    keyVaultName: keyVaultName
    location: location
  }
  dependsOn: [
    resourceGroup
  ]
}

// module AksPreModuleSac 'modules/createSac.bicep' = {
//   name: 'sacdeployment'
//   params: {
//     environmentType: environmentType
//     location: location
//   }
// }

// module AksPreModuleBlob 'modules/createBlob.bicep' = {
//   name: 'blobdeployment'
//   params: {
//     sacName: AksPreModuleSac.outputs.sacName
//   }
// }
