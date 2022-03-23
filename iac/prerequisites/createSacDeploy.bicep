
targetScope = 'subscription'

param environmentType string
param rgName string = 'test-aks9'

resource rResourceGroup 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: rgName
  location: deployment().location
}

module AksPreModule 'modules/createSac.bicep' = {
  name: deployment().name
  scope: rResourceGroup
  params: {
    environmentType: environmentType
  }
}
