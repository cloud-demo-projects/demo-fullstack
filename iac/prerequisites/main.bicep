//targetScope = 'subscription'

@description('The Azure env into which the resources should be deployed.')
param environmentType string = 'development'

// @description('The Azure rg into which the resources should be deployed.')
// @maxLength(13)
// param rgName string = 'test-aks9'

@description('The Azure rg into which the resources should be deployed.')
param location string = 'westeurope'

// resource rResourceGroup 'Microsoft.Resources/resourceGroups@2020-06-01' = {
//   name: rgName
//   location: location
// }

@description('The Azure KV into which the resources should be deployed.')
param keyVaultName string = 'kvdds7657'

module AksPreModuleKV 'modules/createKVDeploy.bicep' = {
  name: 'kvdeployment'
  //scope: rResourceGroup
  params: {
    keyVaultName: keyVaultName
    location: location
  }
}

module AksPreModuleSac 'modules/createSac.bicep' = {
  name: 'sacdeployment'
  //scope: rResourceGroup
  params: {
    environmentType: environmentType
    location: location
  }
}

module AksPreModuleBlob 'modules/createBlob.bicep' = {
  name: 'blobdeployment'
  params: {
    sacName: AksPreModuleSac.outputs.sacName
  }
}
