//targetScope = 'subscription'

@description('The Azure env into which the resources should be deployed.')
param environmentType string = 'development'

@description('The location into which the resources should be deployed.')
param location string = 'westeurope'

// @description('The Azure rg into which the resources should be deployed.')
// @maxLength(13)
// param rgName string = 'test-aks9'

// resource rResourceGroup 'Microsoft.Resources/resourceGroups@2020-06-01' = {
//   name: rgName
//   location: location
// }

module AksPreModule 'modules/createSac.bicep' = {
  name: deployment().name
  //scope: rResourceGroup
  params: {
    environmentType: environmentType
    location: location
  }
}
